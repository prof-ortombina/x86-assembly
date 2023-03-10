start:                  ; stringa iniziale. Obbligatoria
MOV AX, 0x10            
MOV SP, AX              ; sposto lo stack pointer di 10h (16 dec) in modo da usare la prima riga della memoria
MOV AL, 75              ; inserisco il valore da stampare
MOV CL, 0x0a            ; inserisco la base
MOV BL, 0x0
dividi:
    DIV CL  
    MOV DL, AH          
    PUSH DX             ; salvo in memoria il resto della divisione
    INC BL              ; incremento il contatore
    MOV AH, 0x0         ; reset del valore di ah
    CMP AL, 0x0         ; confronto il quoziente con zero
    JNE dividi          ; eseguo il ciclo fino a quando il quoziente non si azzera
    
stampa:
    POP DX              ; recupero dalla memoria la prossima cifra da stampare
    MOV AL, 0x30        ; metto in AL il valore dell'offest (il valore del carattere 0 in ASCII)
    ADD DL, AL          ; trasformo il numero contenuto in DL nel suo codice ASCII
    MOV AH, 0x02
    INT 0x21            ; http://spike.scu.edu.au/~barry/interrupts.html
    DEC BL              ; decremento il contatore del numero di cifre da stampare
    CMP BL, 0x0         ; verifico se ho ancora cifre da stampare
    JNE stampa          ; se ho ancora cifre da stampare torno all'etichetta "stampa"


