#!/bin/bash

apt update -y && apt upgrade -y

apt install apache2 unzip -y

cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

unzip main.zip

cp -R linux-site-dio-main/* /var/www/html/

systemctl restart apache2

echo "Provisionamento concluído! O servidor web está pronto."