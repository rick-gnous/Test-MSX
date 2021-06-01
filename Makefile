CC=sjasmplus
CFLAGS=

%: 
	$(CC) $@.asm --raw=$@.rom
