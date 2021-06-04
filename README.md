Dépôt contenant des fichiers pour tester le développement sur MSX.

L'assembleur [SJASMplus](https://github.com/z00m128/sjasmplus) est utilisé afin d'assembler les fichiers et [OpenMSX](https://github.com/openMSX/openMSX) pour l'émulateur. La commande pour assembler les sources :

```
sjasmplus hello.asm --raw=hello.rom
```

Il est aussi possible d’utiliser le Makefile avec la commande `make <nom programme>`; pour le helloworld par exemple : `make hello`. La commande `make` assemblera tous les fichiers .asm.

Je m'appuie sur [les tutos de Chibiakumas](https://www.chibiakumas.com/z80/msx.php) pour l’écriture des différents programmes.
