hello: DB "PIPPOPAPERINO" ;

; actual entry point of the program, must be present
start:
MOV AH, 0x13            ; il valore esadecimale dell'output
MOV CX, 5               ; lunghezza della stringa da stampare
MOV BX, 0               ;
MOV ES, BX              ; metto in ES il valore di inizio del segmento (SEGMENT START)
MOV BX, 0               ;
MOV BP, BX              ; metto in BP il valore dell'offeset della memoria
MOV DL, 0               ; metto in DL il valore della colonna dell'output su cui scrivere
int 0x10                ; BIOS interrupt

MOV AH, 0x13            ; il valore esadecimale dell'output
MOV CX, 8               ; lunghezza della stringa da stampare
MOV BX, 0               ;
MOV ES, BX              ; metto in ES il valore di inizio del segmento (SEGMENT START)
MOV BX, 5               ;
MOV BP, BX              ; metto in BP il valore dell'offeset della memoria
MOV DL, 5               ; metto in DL il valore della colonna dell'output su cui scrivere
int 0x10                ; BIOS interrupt

MOV AH, 0x13            ; il valore esadecimale dell'output
MOV CX, 8               ; lunghezza della stringa da stampare
MOV BX, 0               ;
MOV ES, BX              ; metto in ES il valore di inizio del segmento (SEGMENT START)
MOV BX, 5               ;
MOV BP, BX              ; metto in BP il valore dell'offeset della memoria
MOV DL, 0               ; metto in DL il valore della colonna dell'output su cui scrivere
int 0x10                ; BIOS interrupt