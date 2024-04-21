section .data
    prompt db "Do you want to get random number? (y/n)"
    prompt_len equ $ - prompt
    message db "Your number is:"
    message_len equ $ - message
    new_line db 10

    one db "  #  ", 10, " ##  ", 10, "# #  ", 10, "  #  ", 10, "#####"
    one_len equ $ - one
    two db " ### ", 10, "#   #", 10, "   # ", 10, " ##  ", 10, "#####"
    two_len equ $ - two
    thr db " ### ", 10, "#   #", 10, "   # ", 10, "#   #", 10, " ### "
    thr_len equ $ - thr
    for db "  #  ", 10, " #   ", 10, "#####", 10, "  #  ", 10, "  #  "
    for_len equ $ - for
    fiv db "#####", 10, "#    ", 10, "#### ", 10, "    #", 10, "#### "
    fiv_len equ $ - fiv
    six db "    #", 10, "  #  ", 10, " ### ", 10, "#   #", 10, " ### "
    six_len equ $ - six
        
section .text
    global _start

_start:
    sub rsp, 1 ; y/n input

main_loop:
    mov rdi, prompt
    mov rsi, prompt_len
    call put_nl

    mov rdi, rsp
    mov rsi, 1
    call get
    call clear_stdin
    
    ; if input == n
    cmp byte [rsp], 110
    je main_loop_end

    ; if input != y
    cmp byte [rsp], 121
    jne main_loop

    ; generate number
    mov rdi, message
    mov rsi, message_len
    call put_nl

    call print_random_digit

    jmp main_loop

main_loop_end:
    add rsp, 1
    mov rdi, 0
    call exit
    
put:
    ; rdi(string pointer)
    ; rsi(length)

    mov rdx, rsi ; arg1
    mov rsi, rdi ; arg0
    mov rax, 1  ; write
    mov rdi, 1  ; STDOUT
    syscall
    ret

put_nl:
    ; rdi(string pointer)
    ; rsi(length)

    call put
    mov rdi, new_line
    mov rsi, 1
    call put
    ret


get:
    ; rdi(string pointer)
    ; rsi(length)

    mov rdx, rsi    ; arg1
    mov rsi, rdi    ; arg0
    mov rax, 0      ; read
    mov rdi, 0      ; STDIN
    syscall
    ret

exit:
    ; rdi = exit code

    mov eax, 60 ; exit
    syscall

    ret

random_null_to_five:
    ; rax = output

    push rbp
    mov rbp, rsp
    sub rsp, 8

    ;random number
    mov rax, 318    ;getrandom
    lea rdi, [rsp] ;
    mov rsi, 8
    xor rdx, rdx
    syscall

    ;reminder
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx

    mov rax, [rsp]
    mov rbx, 6
    div rbx
    mov rax, rdx

    add rsp, 8
    pop rbp
    ret

char_to_int:
    ; rdi(char)

    ; rax = output
    cmp rdi, 48 ; 0
    jl wrong_char
    cmp rdi, 57 ; 9
    jg wrong_char
    sub rdi, 48
    mov rax, rdi
    ret
wrong_char:
    mov rax, -1
    ret

string_to_int:
    ; rdi(string_pointer_null_terminated)

    xor rdx, rdx    ; result
    mov rcx, rdi    ; string pointer
    
loop:
    cmp byte [rcx], 0
    je end_loop
    mov qword rdi, [rcx] 
    call char_to_int
    cmp rax, -1
    je error

    imul rdx, rdx, 10
    add rdx, rax

    inc rcx    ; next character
    jmp loop
    
end_loop:
    mov rax, rdx
    ret

error:
    mov rax, -1
    ret

clear_stdin:
    push rbp
    mov rbp, rsp
    sub rsp, 1
clear_stdin_loop:
    mov rdi, rsp
    mov rsi, 1
    call get

    mov rdi, [rsp]
    mov rsi, 1
    call put

    cmp qword [rsp], 10
    jne clear_stdin_loop

    add rsp, 1
    pop rbp
    ret

print_random_digit:
    call random_null_to_five
    cmp rax, 0
    je print_one
    cmp rax, 1
    je print_two
    cmp rax, 2
    je print_thr
    cmp rax, 3
    je print_for
    cmp rax, 4
    je print_fiv
    cmp rax, 5
    je print_six
    
    mov rdi, thr
    mov rsi, thr_len
    call put_nl

print_one:
    mov rdi, one
    mov rsi, one_len
    call put_nl
    jmp print_end

print_two:
    mov rdi, two 
    mov rsi, two_len
    call put_nl
    jmp print_end

print_thr:
    mov rdi, thr 
    mov rsi, thr_len
    call put_nl
    jmp print_end

print_for:
    mov rdi, for 
    mov rsi, for_len
    call put_nl
    jmp print_end

print_fiv:
    mov rdi, fiv 
    mov rsi, fiv_len
    call put_nl
    jmp print_end

print_six:
    mov rdi, six 
    mov rsi, six_len
    call put_nl
    jmp print_end

print_end:
    ret
