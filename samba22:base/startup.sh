#! /bin/bash
# @edt ASIX M06 2022-2022
# startup.sh
# -------------------------------------

# Creació de xixa per als shares
# Share public
mkdir /var/lib/samba/public
chmod 777 /var/lib/samba/public
cp /opt/docker/* /var/lib/samba/public/.

# Share privat
mkdir /var/lib/samba/privat
#chmod 777 /var/lib/samba/privat
cp /opt/docker/*.md /var/lib/samba/privat/.

# Configuració samba
cp /opt/docker/smb.conf /etc/samba/smb.conf

# Creació usuaris unix/samba
for user in lila roc patipla pla
do	
  useradd -m -s /bin/bash $user
  echo -e "$user\n$user" | smbpasswd -a $user
done
pdbedit -L

# Activar els serveis
/usr/sbin/smbd && echo "smb Ok"
/usr/sbin/nmbd -F && echo "nmb  Ok"


