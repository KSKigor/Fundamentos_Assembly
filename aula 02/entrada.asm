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
    msg db "Entre com seu nome:", LF, NULL
    tam equ $- msg

section .bss
    nome resb 1

section .text

global _start

_start:
    mov rax, SYS_WRITE
    mov rbx, STD_OUT
    mov rcx, msg
    mov rdx, tam
    int SYS_CALL

    mov rax, SYS_READ
    mov rbx, STD_IN
    mov rcx, nome
    mov rdx, 0xA
    int SYS_CALL

    mov rax, SYS_EXIT
    mov rbx, RET_EXIT
    int SYS_CALL