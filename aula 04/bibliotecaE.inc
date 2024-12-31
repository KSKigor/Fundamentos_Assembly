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
    
    TAM_BUFFER  equ 0xA 
segment .bss
    BUFFER resb 0x1

segment .text

saidaResultado:
    ;jmp -> GOTO ponto
    ;call -> GOSUB ponto
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, BUFFER
    mov edx, TAM_BUFFER
    int SYS_CALL
    ret

