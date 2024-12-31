segment .data
    LF          equ 0xA ;    line Feed
    NULL        equ 0xD ;    Final da String
    SYS_CALL    equ 0x80;    envia informação ao SO

    ;EAX
    SYS_EXIT    equ 0x1 ;    codigo  de chamada para finalizar
    SYS_READ    equ 0x3 ;    operação de leitura
    SYS_WRITE   equ 0x4 ;    operação de escrita

    ;EBX
    RET_EXIT    equ 0x0 ;    operação realizada com sucesso
    STD_IN      equ 0x0 ;    Entrada Padrão
    STD_OUT     equ 0x1 ;    Saída padrão

section .data
    x dd 50 ; db = tem um byte , dw = tem 2 bytes, dd = tem 4 bytes, dq , dt = define dez words, tem 10 bytes
    y dd 10
    msg1 db "x é maior que y",LF, NULL
    tam1 equ $- msg1
    msg2 db "y é maior que x", LF, NULL
    tam2 equ $- msg2

section .text

global _start

_start:
    mov eax, dword[x]
    mov ebx, dword[y]
    ; if - comparação
    cmp eax, ebx
    ; salto condicional
    jge maior ;eax >= ebx
    mov ecx, msg2
    mov edx, tam2 
    ;je = , jg >, jge >= , jle<=, jne !=
    ; salto incodicional jmp goto
maior: 
    mov ecx, msg1
    mov edx, tam1

final:
    mov eax,SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL

    mov eax, SYS_EXIT
    xor ebx, ebx    ;mov ebx, RET_EXIT  AND OR XOR
    int SYS_CALL

 

;    AND   OR    XOR
;7 - 0111  0111 0111  0111
;5 - 0101  0101 0101  0111
;    0101  0111 0010  0000
;       5     7    2     0
