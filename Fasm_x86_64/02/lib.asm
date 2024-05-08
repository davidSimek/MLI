macro enter bytes
{
    push rbp
    mov rbp, rsp
    sub rsp, bytes
}

macro exit bytes
{
    add rsp, bytes
    pop rbp
}

.write:
    mov rax, 1
    ; rdi = fd
    ; rsi = buffer
    ; rdx = count
    syscall
    ret

.read:
    ; rdi = fd
    ; rsi = buffer
    ; rdx = size
    mov rax, 0
    syscall
    ret

.exit:
    ; rdi = exit code
    mov rax, 60
    syscall
    ret

.getrandom:
    ; rdi = buffer
    ; rsi = count
    ; rdx = flags
    mov rax, 318
    syscall
    ret
