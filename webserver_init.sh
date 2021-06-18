#!/bin/bash

sudo apt update
# sleep 20

sudo apt install apache2 -y
# sleep 20


sudo mkdir -p /var/www/redpill.com/public_html
# sleep 10

sudo chown -R $USER:$USER /var/www/redpill.com/public_html
# sleep 10

sudo chmod -R 755 /var/www
# sleep 10

# sudo touch /var/www/redpill.com/public_html/index.html
# sleep 10

# sudo chmod 777  /var/www/redpill.com/public_html/index.html
sleep 10

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
sleep 10
sudo touch /etc/apache2/sites-available/redpill.com.conf
sleep 10
sudo chmod 777 /etc/apache2/sites-available/redpill.com.conf
sleep 10

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
# sleep 10

sudo a2ensite redpill.com.conf
# sleep 5

sudo a2dissite 000-default.conf
# sleep 5

sudo systemctl restart apache2
# sleep 5

sudo systemctl status apache2

localIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cat << EOF > update_hosts.sh

#!/bin/bash
echo $localIP

cat << FIN > /etc/hosts
$localIP redpill.com
FIN
EOF

sudo chmod +x update_hosts.sh
sudo ./update_hosts.sh



#https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-18-04
