    org     &4000
    db      "AB"
    dw      Start
    db      00,00,00,00,00,00

Start:
    call    &006F
    ld      a, 32
    ld      (&F3B0), a

    ld      hl, Message
    call    PrintString
    di
    halt

PrintString:
    ld      a, (hl)
    cp      255
    ret     z
    inc     hl
    call    &00A2
    jr      PrintString
    
Message:    db      'Hello World!', 255

    org     &C000
