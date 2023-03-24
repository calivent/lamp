#!/bin/sh

#######################################
# Bash script para instalar una pila AMP y PHPMyAdmin más ajustes. Para sistemas basados en Debian.

# En caso de cualquier error (por ejemplo, MySQL), simplemente vuelva a ejecutar el script. No se reinstalará nada excepto los paquetes con errores.
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Paquetes de actualización y sistema de actualización
echo -e "$Cyan \n Sistema de actualización.. $Color_Off"
apt-get update -y && sudo apt-get upgrade -y

## Install AMP
echo -e "$Cyan \n Instalando Apache2 $Color_Off"
apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y

echo -e "$Cyan \n Instalando PHP & Requirements $Color_Off"
apt-get install libapache2-mod-php php php-common php-curl php-dev php-gd php-idn php-pear php-imagick php-mcrypt php-mysql php-ps php-pspell php-recode php-xsl -y

echo -e "$Cyan \n Instalando MySQL $Color_Off"
apt-get install mysql-server mysql-client libmysqlclient15.dev -y

echo -e "$Cyan \n Instalando phpMyAdmin $Color_Off"
apt-get install phpmyadmin -y

echo -e "$Cyan \n Verificando instalaciones$Color_Off"
apt-get install apache2 libapache2-mod-php php mysql-server php-pear php-mysql mysql-client mysql-server php-mysql php-gd -y

## TWEAKS and Settings
# Permissions
echo -e "$Cyan \n permisos para /var/www $Color_Off"
chown -R www-data:www-data /var/www
echo -e "$Green \n Se han establecido permisos $Color_Off"

# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
echo -e "$Cyan \n Habilitación de módulos $Color_Off"
a2enmod rewrite
phpenmod mcrypt

# Restart Apache
echo -e "$Cyan \n Reiniciando Apache $Color_Off"
service apache2 restart
