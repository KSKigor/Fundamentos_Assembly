; compilar - transformar o programa para linguagem de maquina
;nasm -f elf64 asm.s
; linkeditar - transformar o programa em linguagem de maquina para um executável
;ld -s -o asm asm.o
 section .data
    message db "Hello World!", 0xA, 0xD
    a1 db "Hello World!", 0xA; cria uma constante
    b2 db "Hello World!", 0xA
    c3 db "Hello World!", 0xA
    tam equ $- message
    messageC db "Hello World!", 0xA
 section .text


 global _start

 _start:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message 
    mov edx, tam
    int 0x80
    
    ; sintaxe do mov => destino, origem EAX = 1
    mov eax, 0x1 ; <= valor em hexadecimal, representação hexadecimal = 1 2 3 4 5 6 7 8 9 A B C D E F 10
    mov ebx, 0x0
    int 0x80

; boas praticas: sempre que tiver uma variavel definir o seu tamanho logo após
; exemplo: 
;section .data 
; message db "hello world!", 0xA
; tam equ $- message
; se estiver como está logo acima ele vai executar todos os blocos de msg
