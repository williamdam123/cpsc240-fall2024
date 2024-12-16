; Program name: "Electricity Calculator". Calculate string length.
; Author: William Dam

global strlen
section .text
strlen:
    mov rcx, -1
    xor al, al
    repnz scasb
    not rcx
    dec rcx
    ret
