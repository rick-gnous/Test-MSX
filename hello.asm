; Entête pour cartouche (10bits)
    org     0x4000               ; adresse de la cartouche org permet de 
                                ; se positionner à une adresse dans la mémoire
    db      "AB"                ; premiers bits du header
    dw      Start               ; adresse de la fonction de départ
    db      00,00,00,00,00,00   ; bits inutilisés dans notre cas

Start:
    call    0x006F               ; permet de sélectionner le mode de l'écran
    ld      a, 32               ; mettre la taille de l'écran à 32 caractères
    ld      (0xF3B0), a          ; envoie de la taille de l'écran

    ld      hl, Message
    call    PrintString
    di                          ; pas de retour en cartouche, du coup on fige
    halt                        ; simplement le MSX

PrintString:
    ld      a, (hl)
    cp      255                 ; le message s'arrête avec 255, on vérifie si 
                                ; le car est 255. Si oui, Z est mit à 1
    ret     z                   ; si Z est à 1, on retourne
    inc     hl
    call    0x00A2               ; fonction firmware pour afficher un caractère 
                                ; à l'écran le caractère est contenu dans hl
    jr      PrintString
    
Message:    db      'Hello World!', 255

    org     0xC000               ; alignement de fin de cartouche (pour OpenMSX)
