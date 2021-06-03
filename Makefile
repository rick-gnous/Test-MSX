CC=sjasmplus
CFLAGS=
OBJ=hello read_one_key

DOCKER=docker

default: docker

all: $(OBJ)

$(OBJ):
	$(CC) $@.asm --raw=$@.rom

docker:
	$(DOCKER) pull bensuperpc/sjasmplus:latest
	$(DOCKER) run --rm -v "$(PWD)":/usr/src/myapp -w /usr/src/myapp bensuperpc/sjasmplus:latest make all