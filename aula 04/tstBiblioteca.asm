%include 'bibliotecaE.inc'

section .text

global _start

_start:
    lea esi, [BUFFER]   ; load effective address
    add esi, 0x9
    mov byte[esi], 0xA

    dec esi
    mov dl, 0x13 ; 'A' 0x31 -> 'a'
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x12
    add dl, '0'
    mov [esi], dl

    dec esi
    mov dl, 0x11
    add dl, '0'
    mov [esi], dl

    call saidaResultado

    mov eax, SYS_EXIT
    xor ebx, ebx
    int SYS_CALL