; SYS CALLS
WRITE   equ 1
EXIT    equ 60

; FILE DESCRIPTORS
STD_OUT equ 1

macro print string,len
{
    mov rax, WRITE
    mov rdi, STD_OUT
    mov rsi, string
    mov rdx, len
    syscall
}

macro exit code
{
    mov rax, EXIT
    mov rdi, code
    syscall
}

format ELF64 executable 3
segment readable executable
entry start

start:
    print msg, msg_len
    exit 0

    
segment readable writable
msg: db "Hello from x86_64 Nasm for Linux.",10
msg_len = $ - msg
