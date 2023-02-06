start:
MOV AX, 0x10
MOV SP, AX
MOV AL, 75
MOV CL, 10
MOV BL, 0x0
dividi:
    DIV CL
    MOV DL, AH
    PUSH DX
    INC BL
    MOV AH, 0x0
    CMP AL, 0
    JNE dividi
    
stampa:
    POP DX
    MOV AL, 0x30
    ADD DL, AL
    MOV AH, 0x02
    INT 0x21
    DEC BL
    CMP BL, 0x0
    JNE stampa


