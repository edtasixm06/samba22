# SAMBA
## @edt ASIX M06 2022-2023

Podeu trobar les imatges docker al Dockehub de [edtasixm06](https://hub.docker.com/u/edtasixm06/)

Podeu trobar la documentació del mòdul a [ASIX-M06](https://sites.google.com/site/asixm06edt/)


ASIX M06-ASO Escola del treball de barcelona

### Imatges:

 * **edtasixm06/samba22:base**  Servidor SAMBA bàsic amb shares d'exemple: *documentation*, *manpages*,
   *public*, *private* i els *homes dels usuaris*. Crea hardcoded els usuaris de samba. S'tilitza per
   veure la creació d'usuaris, l'activació del servei i els homes dles usuaris. Ports samba: 139, 445.
   
   L'opció *--privileged* és necessària si es vol usar el propi servidor de també com a client i muntar
   al minux amb mount del sistema cifs els recursos samba.



#### Execució i verificació

```
docker run --rm --name samba.edt.org -h samba.edt.org --net 2hisix --privileged -d edtasixm06/samba22:base 

$ smbclient -L a.b.c.d
$ smbclient -L samba
$ smbclient -L samba.edt.org

$ smbclient //samba.edt.org/documentation
$ smbclient -U lila%lila //samba.edt.org/public
  put /etc/services file
  ls
  get file
$ smbclient -U roc //samba.edt.org/manpages

$ smbget [-R] smb://host/share/file-or-dir

# mount -t cifs -o guest //samba.edt.org/public /mnt
# mount -t cifs
# umount /mnt

Nautilus:  smb://host/share
```

Des de dins del container:
```
# ps ax
# testparm
# nmap localhost
# nmblookup samba
```

#### Shares d'exemple

```
[global]
        workgroup = MYGROUP
        server string = Samba Server Version %v
        log file = /var/log/samba/log.%m
        max log size = 50
        security = user
        passdb backend = tdbsam
        load printers = yes
        cups options = raw
[homes]
        comment = Home Directories
        browseable = no
        writable = yes
;       valid users = %S
;       valid users = MYDOMAIN\%S
[printers]
        comment = All Printers
        path = /var/spool/samba
        browseable = no
        guest ok = no
        writable = no
        printable = yes
# ------------------------------------------------------------------
# SHARES d'exemple M06
# -------------------------------------------------------------------
# public = yes <--> guest ok = yes
# read only = yes <--> writable = no
[documentation]
    comment = Documentació doc del container
    path = /usr/share/doc
    public = yes
    browseable = yes
    writable = no
[manpages]
    comment = Documentació man  del container
    path = /usr/share/man
    guest ok = yes
    browseable = yes
    read only = yes
[public]
        comment = Share de contingut public
        path = /var/lib/samba/public
        public = yes
        browseable = yes
        writable = yes
[privat]
        comment = Share d'accés privat 
        path = /var/lib/samba/privat
        guest ok = no
        browseable = no
        read only = yes
```

#### Home dels usuaris
```
mount -t cifs -o user=lila //samba/lila /mnt
Password for lila@//samba/lila: 
mount -t cifs
ls -la /mnt
umount /nmt
```


### Directives a practicar

[HowTo-ASIX-SAMBA-part2-userShares-2016-2017.pdf](https://gitlab.com/edtasixm06/m06-aso/-/blob/main/UF1_5_samba/HowTo-ASIX-SAMBA-part2-userShares-2016-2017.pdf)
```
path = /dir1/dir2/share
comment = share description
volume = share name
browseable = yes/no
max connections = #
public = yes/no
guest ok = yes/no
guest account = unix-useraccount
guest only = yes/no
valid users = user1 user2 @group1 @group2 ...
invalid users = user1 user2 @group1 @group2 ...
auto services = user1 user2 @group1 @group2 ...
admin users = user1 user2 @group1 @group2 ...
writable = yes/no
read only = yes/no
write list = user1 user2 @group1 @group2 ...
read list = user1 user2 @group1 @group2 ...
create mode = 0660
directory mode = 0770
```
