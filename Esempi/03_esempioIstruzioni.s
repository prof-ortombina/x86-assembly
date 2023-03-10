start:
mov sp, 0x10        ; puntatore area di memoria
mov cx, 0x07        ; numero da verificare se pari o dispari
push cx
mov cx, 0x05        ; fine ciclo for
push cx


; for i = 0; 1 < n ; i++
;-------------------  Inizio Ciclo FOR
pop bx              ; inizializzo fine ciclo
mov cx, 0x00        ; inizializzo variabile contatore
cicloFor:
    cmp cx, bx      ; confronto contatore con valore massimo
    jge fineCiclo    ; se maggiore esco dal ciclo
    ;-------------- Istruzioni da fare nel ciclo for
    inc cx
    jmp cicloFor    ; ritorno al confronto (senza condizioni)
fineCiclo:
mov bx, 0x00        ; reset registro
mov cx, 0x00        ; reset registro

;------------------- Il resto del programma


; Istruzione IF (a%b == 0):
mov bx, 0xaa        ; valore da salvare in memoria se numero pari
pop ax              ; numero da verificare se pari o dispari
mov cl, 0x02        ; divisore per vedere se pari o dispari
div cl              ; AL / CL -> Quoziente in AL, Resto in AH
cmp ah, 0x00        ; se resto == 0 è pari
je isPari           ; se è pari salto a isPari
mov bx, 0xff        ; se sono qui non è pari, quindi cambio valore del registro BX
isPari:
push bx             ; a questo punto salvo in memoria il valore di BX che sarà AA se pari, FF altrimenti
