#!/bin/sh

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm -y
yum install fail2ban -y
sleep 5s
systemctl enable fail2ban
fail2ban-client -h

#AGREGAR ARCHIVO A JAIL.LOCAL
cat <<EOD > /etc/fail2ban/jail.local
[DEFAULT]
# Tiempo de bloqueo de IP’s:
bantime = 864000

# Sobreescribe /etc/fail2ban/jail.d/00-firewalld.conf:
banaction = firewallcmd-multiport

# Número máximo de intentos permitidos antes de bloquear:
maxretry = 6

#IP’s que serán ignoradas y no serán bloqueadas
ignoreip = 187.174.218.184

[sshd]
enabled = true
EOD

systemctl restart fail2ban
fail2ban-client status
systemctl status fail2ban
