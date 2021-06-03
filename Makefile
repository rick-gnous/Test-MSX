CC=sjasmplus
DOCKER=docker

CFLAGS=
SRCS    = 	$(wildcard *.asm)
OBJ		=	$(patsubst %.asm,%,$(SRCS))

all: $(OBJ)

$(OBJ):
	$(CC) $@.asm --raw=$@.rom

docker:
	$(DOCKER) pull bensuperpc/sjasmplus:latest
	$(DOCKER) run --rm -v "$(PWD)":/usr/src/myapp -w /usr/src/myapp bensuperpc/sjasmplus:latest make all