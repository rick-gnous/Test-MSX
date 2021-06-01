Dépôt contenant des fichiers pour tester le développement sur MSX.

Le compilateur SJASMplus est utilisé afin de compiler les fichiers et [OpenMSX](https://github.com/openMSX/openMSX) pour l'émulateur. La commande pour compiler les sources :

```
sjasmplus hello.asm --raw=hello.rom
```

Il est aussi possible d’utiliser le Makefile avec la commande `make hello`.

Je m'appuie sur [le tuto de Chibiakumas](https://www.chibiakumas.com/z80/helloworld.php#LessonH3) pour le Hello world.
