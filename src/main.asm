ORIGIN equ 0X7C00   ; define ORIGIN var (boot sector is 0x7C00)
org ORIGIN          ; set the origin of the program
bits 16

%define ENDL 0x0D, 0x0A    ; carriage return: 0D, newline (line feed): 0A

start: 
    jmp main        ; jump to main

puts:               ; print strings
    push si         ; save variables to stack
    push ax

.loop:              ; loop to print each character in the string
    lodsb           ; load next char
    or al, al       ; check if next char is null
    jz .done        ; if next char is null, exit the loop

    mov ah, 0x0e    ; AH = 0E: write char to tty
    int 0x10        ; int 10h: video services

    jmp .loop       ; rerun until null char is found

.done:
    pop ax          ; restore variables from stack
    pop si
    ret

main:
    xor ax, ax
    mov dx, ax
    mov es, ax

    mov ss, ax
    mov sp, ORIGIN      ; stack grows downwards from starting point so it doesn't overwrite any code 

    lea si, msg_hello
    call puts           ; print message 

    hlt                 ; stop

.halt:                  
    jmp .halt

msg_hello: db 'hello, world!', ENDL, 0

times 510-($-$$) db 0
dw 0AA55H