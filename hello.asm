section .data
    msg db 'Hello, World!', 0xA  ; String to print followed by newline
    len equ $ - msg               ; Calculate length of the string

section .text
    global _start                 ; Entry point for the program

_start:
    ; sys_write (write to stdout)
    mov rax, 1                    ; System call number for sys_write
    mov rdi, 1                    ; File descriptor (stdout)
    mov rsi, msg                  ; Pointer to message
    mov rdx, len                  ; Message length
    syscall                       ; Make the system call

    ; sys_exit (exit the program)
    mov rax, 60                   ; System call number for sys_exit
    xor rdi, rdi                  ; Return 0 status code
    syscall                       ; Make the system call

