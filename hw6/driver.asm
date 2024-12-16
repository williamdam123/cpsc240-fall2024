; driver.asm
; Program name: "Circuit Current Calculator"
; Author: William Dam

global _start  ; Use the default entry point

extern printf, scanf, faraday

section .bss
    input_name resb 64      ; Reserve space for name input
    input_career resb 64    ; Reserve space for career input
    emf resq 1              ; Reserve space for emf (float)
    current resq 1          ; Reserve space for current (float)
    resistance resq 1       ; Reserve space for resistance (float)

section .text
_start:          ; Default entry point handled by the system's runtime
    ; Print welcome message
    mov rdi, welcome_msg
    call printf

    ; Input name
    mov rdi, input_prompt_name
    mov rsi, input_name
    call printf
    mov rdi, input_name
    mov rsi, input_name
    call scanf

    ; Input career
    mov rdi, input_prompt_career
    mov rsi, input_career
    call printf
    mov rdi, input_career
    mov rsi, input_career
    call scanf

    ; Input emf
    mov rdi, input_prompt_emf
    mov rsi, emf
    call printf
    mov rdi, emf
    mov rsi, emf
    call scanf

    ; Input current
    mov rdi, input_prompt_current
    mov rsi, current
    call printf
    mov rdi, current
    mov rsi, current
    call scanf

    ; Call faraday to calculate resistance
    mov rdi, resistance
    mov rsi, [emf]         ; Load emf
    mov rdx, [current]     ; Load current
    call faraday

    ; Output result
    mov rdi, result_msg
    mov rsi, [resistance]
    call printf

    ; Exit the program
    mov rax, 60
    xor rdi, rdi
    syscall

section .data
    welcome_msg db "Welcome to Electricity brought to you by Henry Finkelstein.", 0
    input_prompt_name db "Enter your name: ", 0
    input_prompt_career db "Enter your career: ", 0
    input_prompt_emf db "Enter the EMF value: ", 0
    input_prompt_current db "Enter the current value: ", 0
    result_msg db "The resistance is: %lf", 10, 0
