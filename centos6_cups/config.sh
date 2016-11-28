#!/bin/bash

groupadd cupsadmins
useradd -g cupsadmins -c 'CUPS administration account' cupsadmin
echo "cupsadmin:Password" | chpasswd

#sed -i 's/LogLevel warn/LogLevel debug/' /etc/cups/cupsd.conf

sed -i 's/SystemGroup sys root/SystemGroup sys root cupsadmins/' /etc/cups/cupsd.conf

sed -i 's/Listen localhost:631/Listen 0.0.0.0:631/' /etc/cups/cupsd.conf
sed -i 's/Browsing On/Browsing Off/' /etc/cups/cupsd.conf

sed -i '/DefaultAuthType Basic/a DefaultEncryption Never' /etc/cups/cupsd.conf
sed -i '/DefaultEncryption Never/a ServerAlias *' /etc/cups/cupsd.conf
sed -i '/<Location \/admin>/a \ \ AuthType Default\n  Require user @SYSTEM' etc/cups/cupsd.conf

sed -i '/  Order allow,deny/a \ \ Allow from 192.168.0.0\/16' /etc/cups/cupsd.conf
sed -i '/  Order allow,deny/a \ \ Allow from 172.16.0.0\/12' /etc/cups/cupsd.conf
sed -i '/  Order allow,deny/a \ \ Allow from 10.0.0.0\/8' /etc/cups/cupsd.conf

