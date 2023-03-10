; Programma per il calcolo del massimo e del minimo di N valori
vals:                       ; valori
DB 0x12
DB 0x34
DB 0x7A
DB 0x13
DB 0x9B
DB 0x65
DB 0xC5
DB 0x11
DB 0x84
DB 0x36
last:DB 0                   ; elemento da utilizzare come spazio e puntatore al numero di oggetti
MIN: DB 0                   ; locazione di memoria dove scrivere il MIN
MAX: DB 0                   ; locazione di memoria dove scrivere il MAX

; inizio del programma
start:
MOV SI,0                    ; metto nel registro sorgente il valore 0
MOV CX,OFFSET last          ; metto in CX l'offset (quindi il numero di byte scritti)
MOV AL, byte [SI]           ; metto in AL il valore puntato da SI
back:
CMP byte [SI],AL            ; confronto il valore puntato da SI con AL
JNC skip                    ; se non è piu piccolo salto
MOV AL,byte [SI]            ; altrimenti metto nel registro AL il valore puntato da SI
skip:
INC SI                      ; incremento il puntatore
loop back                   ; loop back (è come un FOR sulla variabile CX)
mov byte MIN,AL             ; in AL ho il valore minimo e quindi lo metto nella locazione di memoria etichettata come MIN

mov SI,0                    ; reset del puntatore all'input
mov CX, OFFSET last         ; metto in CX (registro di loop) il numero di elementi
mov AL, byte [SI]           ; metto in AL il massimo provvisorio
back1:
CMP AL,byte [SI]            ; confronto per trovare il max
JNC skip1                   ; se valore è più piccolo salto la prossima istruzione
MOV AL,byte [SI]            ; metto il nuovo MAX in AL
skip1:
INC SI                      ; increment counter
loop back1                  ; loop back (è come un FOR sulla variabile CX)
mov byte MAX,AL             ; in AL ho il valore massimo e quindi lo metto nella locazione di memoria etichettata come MAX