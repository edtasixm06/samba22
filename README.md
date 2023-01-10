# SAMBA
## @edt ASIX M06 2022-2023

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)


ASIX M06-ASO Escola del treball de barcelona

### Imatges:

* **edtasixm06/samba21:base** Servidor SAMBA bàsic amb *shares* d'exemple.


#### Execució

```
docker run --rm --name samba.edt.org -h samba.edt.org --net 2hisx --privileged -d edtasixm06/samba22:base
```

 * **edtasixm06/samba22:base**  Servidor SAMBA bàsic amb shares d'exemple: *documentation*, *manpages*,
   *public*, *private* i els *homes dels usuaris. Crea hardcoded els usuaris de samba. S'tilitza per
   veure la creació d'usuaris, l'activació del servei i els homes dles usuaris. Ports samba: 139, 445.
   
   L'opció *--privileged* és necessària si es vol usar el propi servidor de també com a client i muntar
   al minux amb mount del sistema cifs els recursos samba.
   
   


