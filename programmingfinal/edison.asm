; Program name: "Electric Current Calculator". This program calculates the current 
; in a circuit with two parallel sub-circuits using modular components.
; Copyright (C) 2024 William Dam

; This file is part of the software program "Electric Current Calculator".

; Electric Current Calculator is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.

; Electric Current Calculator is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program. If not, see <https://www.gnu.org/licenses/>. 

; Author information
;   Author name : William Dam
;   Author email: wdam1@csu.fullerton.edu
;   Author section: 240-19
;   Author CWID : 884616384

global electricity

segment .data
    msgI1 db "The current on the first circuit is %.5f amps.", 0
    msgI2 db "The current on the second circuit is %.5f amps.", 0
    msgTotal db "The total current is %.5f amps.", 0

segment .bss
    align 64
    storedata resb 832
    temp resb 4   ; Temporary storage for floats (4 bytes each)

segment .text

electricity:
    ; Back up components
    push        rbp
    mov         rbp, rsp
    push        rbx
    push        rcx
    push        rdx
    push        rsi
    push        rdi
    push        r8 
    push        r9 
    push        r10
    push        r11
    push        r12
    push        r13
    push        r14
    push        r15
    pushf

    ; Save all the floating-point numbers
    mov         rax, 7
    mov         rdx, 0
    xsave       [storedata]

    ; Load parameters
    movss       xmm0, [rbp + 16] ; Load E
    movss       xmm1, [rbp + 24] ; Load R1
    movss       xmm2, [rbp + 32] ; Load R2

    ; Compute I1 = E / R1
    divss       xmm0, xmm1
    movss       [temp], xmm0     ; Store I1 in temporary memory

    ; Print I1
    mov         rdi, msgI1
    mov         rsi, temp        ; Pass the address of temp to printf
    xor         eax, eax
    call        printf

    ; Compute I2 = E / R2
    movss       xmm0, [rbp + 16] ; Reload E
    divss       xmm0, xmm2
    movss       [temp], xmm0     ; Store I2 in temporary memory

    ; Print I2
    mov         rdi, msgI2
    mov         rsi, temp        ; Pass the address of temp to printf
    xor         eax, eax
    call        printf

    ; Compute I = I1 + I2
    movss       xmm0, [temp]     ; Load I1 from temporary memory
    movss       xmm1, xmm0       ; Copy I1 to xmm1
    movss       xmm0, [rbp + 16] ; Reload E (to recalculate I2)
    divss       xmm0, xmm2       ; Recalculate I2
    addss       xmm1, xmm0       ; Add I1 and I2 (I = I1 + I2)
    movss       [temp], xmm1     ; Store total current I in temp

    ; Print I
    mov         rdi, msgTotal
    mov         rsi, temp        ; Pass the address of temp to printf
    xor         eax, eax
    call        printf

    ; Restore all the floating-point numbers
    mov         rax, 7
    mov         rdx, 0
    xrstor      [storedata]

    ; Epilogue
    movss       xmm0, [temp]     ; Load total current I into xmm0 for return

    ; Restore the original values to the GPRs
    popf
    pop         r15
    pop         r14
    pop         r13
    pop         r12
    pop         r11
    pop         r10
    pop         r9 
    pop         r8 
    pop         rdi
    pop         rsi
    pop         rdx
    pop         rcx
    pop         rbx
    pop         rbp

    ; Clean up
    ret
