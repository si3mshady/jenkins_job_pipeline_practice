#!/bin/bash

sudo apt update
sudo apt install apache2 -y


sudo mkdir -p /var/www/redpill.com/public_html


sudo mkdir -p /var/www/bluepill.com/public_html



sudo chown -R $USER:$USER /var/www/redpill.com/public_html


sudo chown -R $USER:$USER /var/www/bluepill.com/public_html


sudo chmod -R 755 /var/www


sudo touch /var/www/redpill.com/public_html/index.html

sudo chmod 777  /var/www/redpill.com/public_html/index.html

cat << FIN > /var/www/redpill.com/public_html/index.html
<html>
  <head>
    <title>Welcome to RedPill.com!</title>
  </head>
  <body>
    <h1>Success! The redpill.com virtual host is working!</h1>
  </body>
</html>
FIN


sudo touch /var/www/bluepill.com/public_html/index.html
sleep 5

sudo chmod 777  /var/www/bluepill.com/public_html/index.html
sleep 5


cat << FIN > /var/www/bluepill.com/public_html/index.html
<html>
  <head>
    <title>Welcome to BluePill.com!</title>
  </head>
  <body>
    <h1>Success! The bluepill.com virtual host is working!</h1>
  </body>
</html>
FIN 

sudo chmod 777 /etc/apache2/sites-available/redpill.com.conf
sleep 5


cat << FIN > /etc/apache2/sites-available/redpill.com.conf
<VirtualHost *:80>
    ServerAdmin admin@redpill.com
    ServerName redpill.com
    ServerAlias www.redpill.com
    DocumentRoot /var/www/redpill.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
FIN

sudo chmod 777 /etc/apache2/sites-available/bluepill.com.conf


cat << FIN > /etc/apache2/sites-available/bluepill.com.conf
<VirtualHost *:80>
    ServerAdmin admin@bluepill.com
    ServerName bluepill.com
    ServerAlias www.bluepill.com
    DocumentRoot /var/www/bluepill.com/public_html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
FIN

sudo a2ensite redpill.com.conf
sudo a2ensite bluepill.com.conf
sudo a2dissite 000-default.conf
sudo systemctl restart apache2
sudo systemctl status apache2

