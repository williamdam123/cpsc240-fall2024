; strlen.asm
; Program name: "Electricity Calculator". Calculate string length.
; Author: William Dam

global strlen
section .text
strlen:
    mov rcx, -1            ; Set RCX to -1 for the loop
    xor al, al             ; Set AL to 0 (null character)
    repnz scasb            ; Scan the string for null character
    not rcx                ; Invert RCX to get the length
    dec rcx                ; Decrement to exclude null terminator
    ret
