#!/bin/sh

read -p "Nombre de usuario: " usuario
echo " "\ &&
echo "Este script asume que existe el grupo (operaciones)"

llave="EstoEsUnaLlaveInsegura"
useradd -m -g operaciones ${usuario}
mkdir -p /home/${usuario}/.ssh/
touch /home/${usuario}/.ssh/authorized_keys
chmod 700 /home/${usuario}/.ssh/
chmod 600 /home/${usuario}/.ssh/authorized_keys
echo ${llave} > /home/${usuario}/.ssh/authorized_keys
chown -R ${usuario} /home/${usuario}/
echo ${usuario}'  ALL=(ALL)      NOPASSWD: ALL' >> /etc/sudoers
