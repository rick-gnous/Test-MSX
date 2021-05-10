Dépôt contenant des fichiers pour tester le développement sur MSX.

Le compilateur [VASM](http://sun.hasenbraten.de/vasm/) est utilisé pour l'instant afin de compiler les fichiers et [OpenMSX](https://github.com/openMSX/openMSX) pour l'émulateur. La commande pour compiler les sources :

```
vasmz80_oldstyle hello.asm -chklabels -nocase -DBuildMSX=1 -DBuildMSX_MSX1=1 -Fbin -o hello.rom
```
