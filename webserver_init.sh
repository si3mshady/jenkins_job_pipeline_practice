#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sleep 20

sudo mkdir -p /var/www/redpill.com/public_html
sleep 20

sudo mkdir -p /var/www/bluepill.com/public_html
sleep 20


sudo chown -R $USER:$USER /var/www/redpill.com/public_html
sleep 20

sudo chown -R $USER:$USER /var/www/bluepill.com/public_html
sleep 20

sudo chmod -R 755 /var/www
sleep 20

sudo touch /var/www/redpill.com/public_html/index.html
sleep 20

sudo chmod 777  /var/www/redpill.com/public_html/index.html
sleep 20

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
sleep 5

# cp /var/www/redpill.com/public_html/index.html /var/www/bluepill.com/public_html/index.html
# sleep 5


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
sleep 5

# sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/redpill.com.conf
# sleep 5

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


# sudo cp /etc/apache2/sites-available/redpill.com.conf /etc/apache2/sites-available/bluepill.com.conf
sleep 5
sudo chmod 777 /etc/apache2/sites-available/bluepill.com.conf
sleep 5


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
sleep 5

sudo a2ensite redpill.com.conf
sleep 5
sudo a2ensite bluepill.com.conf
sleep 5

sudo a2dissite 000-default.conf
sleep 5

sudo systemctl restart apache2
sleep 5
sudo systemctl status apache2
sleep 5


# cat << FIN > /etc/hosts 
# 127.0.0.1   localhost
# 127.0.1.1   guest-desktop
# 172.31.62.142 redpill.com
# 172.31.62.142 bluepill.com
# FIN