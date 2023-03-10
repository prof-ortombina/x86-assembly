array:
    db 0x05 
    db 0x02
    db 0x01
    db 0x02
    db 0x03
sommaPari: 
    DB 0x00
sommaDispari: 
    DB 0x00
contaPari: 
    DB 0x00
contaDispari: 
    DB 0x00

start:
    mov SI, 0
    mov BL, 0x02                        ; utilizzo il 2 per vedere se è pari o disapri
    mov CX, offset sommaPari            ; in CX il contatore dei numeri (N)
    ripeti:
        mov AX, 0x00                    ; reset AX
        mov DX, 0x00                    ; reset DX
        mov AL, byte [SI]               ; carico in AH il prossimo numero da verificare
        mov DH, AL                      ; parcheggio temporaneamente il valore in DH
        div BL                          ; divido il valore per 2
        cmp AH, 0x00                    ; se resto zero è pari
        je pari
        dispari:
            mov AX, 0x00                ; pulisco AX dal risultato della divisione
            mov AH, byte sommaDispari   ; recupero il valore della somma
            add AH, DH                  ; aggiungo al valore recuperato il byte dispari
            mov byte sommaDispari, AH   ; sovrascrivo la somma in memoria
            mov AX, 0x00                ; pulisco AX dal risultato della divisione
            mov AH, byte contaDispari   ; recupero il valore del contatore
            inc ah                      ; incremento
            mov byte contaDispari, AH   ; sovrascrivo il contatore in memoria
            jmp fineCiclo
        pari:
            mov AX, 0x00                ; pulisco AX dal risultato della divisione
            mov AH, byte sommaPari      ; recupero il valore della somma
            add AH, DH                  ; aggiungo al valore recuperato il byte dispari
            mov byte sommaPari, AH      ; sovrascrivo la somma in memoria
            mov AX, 0x00                ; pulisco AX dal risultato della divisione
            mov AH, byte contaPari      ; recupero il valore del contatore
            inc ah                      ; incremento
            mov byte contaPari, AH      ; sovrascrivo il contatore in memoria
        fineCiclo:
        inc SI                          ; punto al prossimo byte
    loop ripeti
