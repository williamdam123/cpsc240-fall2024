; Program name: "Electricity Calculator". This program computes resistance in a direct current circuit.
; Copyright (C) 2024  <William Dam>

; This file is part of the software program "Electricity Calculator".

; Electricity Calculator is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; Electricity Calculator is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program. If not, see <https://www.gnu.org/licenses/>.

; Author information
;   Author name : William Dam
;   Author email: wdam1@csu.fullerton.edu

global _start
extern faraday
extern printf, scanf

section .data
    welcome_msg db "Welcome to Electricity brought to you by Henry Finkelstein.", 10, 0
    prompt_name db "Please enter your full name: ", 0
    input_name db 50 dup(0)
    prompt_career db "Please enter the career path you are following: ", 0
    input_career db 50 dup(0)
    emf_prompt db "Please enter the EMF of your circuit in volts: ", 0
    current_prompt db "Please enter the current in this circuit in amps: ", 0
    emf_result db "You entered %f", 10, 0
    current_result db "You entered %f", 10, 0
    resistance_result db "The resistance in this circuit is %f ohms.", 10, 0

section .bss
    emf resq 1
    current resq 1
    resistance resq 1

section .text
_start:
    ; Display welcome message
    mov rdi, welcome_msg
    xor rax, rax
    call printf

    ; Prompt for name
    mov rdi, prompt_name
    lea rsi, [input_name]
    xor rax, rax
    call scanf

    ; Prompt for career path
    mov rdi, prompt_career
    lea rsi, [input_career]
    xor rax, rax
    call scanf

    ; Prompt for EMF
    mov rdi, emf_prompt
    lea rsi, [emf]
    xor rax, rax
    call scanf

    ; Display EMF
    mov rdi, emf_result
    mov rsi, [emf]
    xor rax, rax
    call printf

    ; Prompt for current
    mov rdi, current_prompt
    lea rsi, [current]
    xor rax, rax
    call scanf

    ; Display current
    mov rdi, current_result
    mov rsi, [current]
    xor rax, rax
    call printf

    ; Calculate resistance
    lea rdi, [resistance]
    mov rsi, [emf]
    mov rdx, [current]
    call faraday

    ; Display resistance
    mov rdi, resistance_result
    mov rsi, [resistance]
    xor rax, rax
    call printf

    ; Exit program
    xor rdi, rdi
    mov rax, 60
    syscall
