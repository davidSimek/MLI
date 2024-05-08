
format ELF64 executable 3
segment readable executable


include "lib.asm"

entry .start
    
.start:
    enter 9

.main_cycle:
    ; prompt
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    call .write    


    ; read input 
    mov rdi, 0
    lea rsi, [rbp + 8]
    mov rdx, 1
    call .read

    call .clean_stdin
    
    ;mov input to rax so it is in lowest byte
    xor rax, rax
    mov al, [rbp + 8]

    ; if `n`, exit if not `y` repeat
    cmp rax, 110
    je .exit_program
    cmp rax, 121
    jne .main_cycle

    ; rbp random
    mov rdi, rbp
    mov rsi, 8
    mov rdx, 0
    call .getrandom

    ; rbp 0 - 5
    mov rax, [rbp]
    mov rbx, 6
    xor rdx, rdx
    div rbx
    mov [rbp], rdx

    mov rdi, [rbp]
    call .print_ascii_digit
    
    jmp .main_cycle
    exit 9
    call .exit_program

.print_ascii_digit:
    ; rdi = buffer with number
    cmp rdi, 0
    je .one
    cmp rdi, 1
    je .two
    cmp rdi, 2
    je .three
    cmp rdi, 3
    je .four
    cmp rdi, 4
    je .five
    jmp .six
    .one:
        mov rax, one
        mov rbx, one_len
        jmp .print_ascii_digit_exit
    .two:
        mov rax, two
        mov rbx, two_len
        jmp .print_ascii_digit_exit
    .three:
        mov rax, thr
        mov rbx, thr_len
        jmp .print_ascii_digit_exit
    .four:
        mov rax, for
        mov rbx, for_len
        jmp .print_ascii_digit_exit
    .five:
        mov rax, fiv
        mov rbx, fiv_len
        jmp .print_ascii_digit_exit
    .six:
        mov rax, six
        mov rbx, six_len
        jmp .print_ascii_digit_exit
    .print_ascii_digit_exit:
        mov rdi, 1
        mov rsi, rax    ; ascii address
        mov rdx, rbx    ; ascii address len
        call .write
        ret


.exit_program:
    mov rdi, 0
    call .exit

.clean_stdin:
    mov rax, 0
    mov rdi, 0
    mov rsi, buf
    mov rdx, 1
    syscall
    
    cmp byte [buf], 10
    jne .clean_stdin
    ret

segment readable

prompt db "Do you want to generate random number? (y/n)", 10, 0
prompt_len = $ - prompt

testing db "this is one", 10, 0
testing_len = $ - testing

one db "  #  ", 10, " ##  ", 10, "# #  ", 10, "  #  ", 10, "#####", 10, 0
one_len = $ - one
two db " ### ", 10, "#   #", 10, "   # ", 10, " ##  ", 10, "#####", 10, 0
two_len = $ - two
thr db " ### ", 10, "#   #", 10, "   # ", 10, "#   #", 10, " ### ", 10, 0
thr_len = $ - thr
for db "  #  ", 10, " #   ", 10, "#####", 10, "  #  ", 10, "  #  ", 10, 0
for_len = $ - for
fiv db "#####", 10, "#    ", 10, "#### ", 10, "    #", 10, "#### ", 10, 0
fiv_len = $ - fiv
six db "    #", 10, "  #  ", 10, " ### ", 10, "#   #", 10, " ### ", 10, 0
six_len = $ - six

segment readable writable
buf db 1
