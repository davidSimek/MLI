section .data
    msg db "Hello from x86_64 Nasm for Windows.\n", 0

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 5
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
