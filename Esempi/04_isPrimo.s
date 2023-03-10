stringa: db "PrimoNon primoEsecuzione Terminata"

def isPrimo {
    pop bx              ;estrae il numero da analizzare
    mov cx, 0x2         ;inizializza il contatore a 2
    mov ax, bx          ;mettere il numero in ax
    div cl              ;divisione per 2
    mov dl, al          ;muovere il risultato in dl
        
    verificaPrimo:
        cmp cl, dl          ;verifico se il contatore è inferiore al numero/2
        jbe verificaPrimo2  ;se diverso verifica primo
        jmp stampaPrimo     ;altrimenti stampa che è primo
        
    verificaPrimo2:
        mov ax, bx          ;rimetto il numero originale in ax
        div cl              ;divido per il contatore
        add cl, 0x1         ;incremento il contatore
        cmp ah, 0x0         ;ritorna a verificare se il resto è diverso da 0
        jne verificaPrimo   ;se diverso da 0, torna a dividere
        jmp stampaNonprimo  ;altrimenti, stampa che non è primo
        
    
    stampaNonprimo:
        mov ax, 0x0
        mov cx, 0x0
        mov dx, 0x0
        mov ah, 0x13        ;setto codice esad.
        mov cx, 0x9          ;setto lunghezzo stringa da stampare
        mov bx, 0x0
        mov es, bx          ;azzero es
        mov bx, 0x5         ;inserire punto della stringa da cui partire
        mov bp, bx          ;punto da cui parte la stampa
        mov dl, 0x0         ;colonna da stampare
        int 0x10            ;stampa
        jmp fine             ;termina
    
    stampaPrimo:
        mov ax, 0x0
        mov cx, 0x0
        mov dx, 0x0
        mov ah, 0x13        ;setto codice esad.
        mov cx, 0x5         ;setto lunghezzo stringa da stampare
        mov bx, 0x0
        mov es, bx
        mov bx, 0x0         ;inserire punto della stringa da cui partire
        mov bp, bx          ;punto da cui parte la stampa
        mov dl, 0x0         ;colonna da stampare
        int 0x10            ;stampa
    fine:                    ;funzione per terminare senza passare per il resto
}


start:
    mov sp, 0x40        ;inizio lo stack da 0x40
    mov bx, 0x03        ;inserisco il numero in bx
    push bx             ;inserisco il numero nello stack
    mov bx, 0x0
    call isPrimo
    mov ax, 0x0         ;stampa il termine del programma
    mov dx, 0x0
    mov ah, 0x13        ;setto codice esad.
    mov cx, 0x14        ;setto lunghezzo stringa da stampare
    mov bx, 0x0
    mov es, bx
    mov bx, 0x0e        ;inserire punto della stringa da cui partire
    mov bp, bx          ;punto da cui parte la stampa
    int 0x10            ;stampa
    
   