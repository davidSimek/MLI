section .data
    msg db "Hello from x86_64 Nasm for Linux.\n", 0
    msg_len equ $ - msg

section .text
    global _start

_start:
    mov rdi, msg
    mov rsi, msg_len
    call print

    mov rdi, 0
    call exit
    

print:
    ; rdi(string pointer)
    ; rsi(string length)

    mov rdx, rsi ;arg1
    mov rsi, rdi ;arg0

    mov rax, 1  ; write
    mov rdi, 1  ; STDOUT
    syscall

    ret

exit:
    ; rdi = exit code

    mov eax, 60 ; exit
    syscall

    ret

