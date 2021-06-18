#!/bin/bash -xe


sudo mkdir -p /var/www/redpill.com/public_html

sudo chown -R $USER:$USER /var/www/redpill.com/public_html

sudo chmod -R 755 /var/www

sudo a2ensite redpill.com.conf
sudo a2dissite 000-default.conf

sudo systemctl reload apache2
sudo systemctl restart apache2
sudo systemctl status apache2