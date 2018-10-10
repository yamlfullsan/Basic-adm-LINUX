######## USUARIOS #######
#Añadir un usuario.
useradd $Username
useradd -m -g $Groupname $Username
#Modificar un usuario 
usermod -l $newUsername $oldUsername
usermod -d /home/newHomeDir -m $newUsername
#Eliminar un usuario.
userdel $Username

####### GRUPOS ########
#Añadir un grupo 
groupadd $Groupname
#Modificar un grupo
groupmod $Groupname
#Eliminar un grupo.
groupdel $Groupname

######## Archivos #######
cat /etc/passwd  #en este archivo podemos ver todos los usuarios creados, sus UID y sus GID.
cat /etc/group   #En este archivo podemos ver los GID de los grupos existentes en el sistema, y los usuarios pertenecientes a cada grupo.
cat /etc/shadow  # En este archivo se encuentran cifradas las contraseñas de los usuarios.
