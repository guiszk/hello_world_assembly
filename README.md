
# hello world assembly

Assembly program to output `hello, world!` to tty.

## running

MacOS: install `nasm` and `truncate` to compile, `qemu` to run.

Create a directory called build with `mkdir build`.

Run `make` to compile.

Run with qemu:
`qemu-system-i386 -fda build/main_floppy.img`
