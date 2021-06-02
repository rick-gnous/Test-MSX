; programme lisant une touche et l’affichant
; headers (voir helloworld pour plus d’information)
    org     0x4000
    db      "AB"
    dw      init
    db      00,00,00,00,00,00

init:                           ; init écran
    call    0x006F
    ld      a, 32
    ld      (0xF3B0), a

main:
    ld      hl, message
    call    printf

    call    0x009F              ; on attend une entrée. Elle sera stockée dans a

    ld      b, a                ; on sauvegarde a dans b pour l’afficher
    call    newLine
    ld      hl, messageTouche
    call    printf
    call    newLine

    ld      a, b                ; on récupère la lettre 
    cp      0x71                ; on vérifie si ce n’est pas q (code ascii)
    jp      z, fin              ; si oui, on arrete le programme
    jr      main

fin:
    call    newLine
    ld      hl, messageFin
    call    printf

    di
    halt

newLine:                        ; une nouvelle ligne = 13 (retour chariot)
    ld      a, 13               ; + 10 (nouvelle ligne)
    call    0x00A2
    ld      a, 10
    call    0x00A2
    ret
    
printf:
    ld      a, (hl)
    cp      1                   ; si on tombe sur 1 dans la string, on affiche
    jp      z, printChar        ; le caractère
    cp      0
    ret     z

    inc     hl
    call    0x00A2
    jr      printf

printChar:
    ld      a, b                ; on reprend le caractère sauvegardé dans b
    inc     hl
    call    0x00A2
    jr      printf

message:    db      'Tapez sur une touche (q pour arreter): ', 0
messageFin: db      'Programme fini !', 0
messageTouche:  db  'Vous avez tape sur: ', 1, 0

    org     0xC000
