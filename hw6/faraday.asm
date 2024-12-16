; Program name: "Electricity Calculator". Function to calculate resistance R = F / I.
; Author: William Dam

global faraday
section .text
faraday:
    ; Input: RDI (resistance address), RSI (emf), RDX (current)
    ; Output: RDI (resistance address updated)
    fld qword [rsi]        ; Load EMF into FPU stack
    fdiv qword [rdx]       ; Divide EMF by Current
    fstp qword [rdi]       ; Store result in Resistance
    ret
