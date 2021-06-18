#!/bin/bash

sudo apt update
sudo apt install apache2 -y

wget https://raw.githubusercontent.com/si3mshady/jenkins_job_pipeline_practice/main/redpill.com.conf && \
sudo mv ./redpill.com.conf /etc/apache2/sites-available/redpill.com.conf

localIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cat << EOF > ./update_hosts.sh
#!/bin/bash
echo $localIP
cat << FIN > /etc/hosts
$localIP redpill.com
FIN
EOF

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

sudo chmod +x ./update_hosts.sh
sudo ./update_hosts.sh

#https://www.digitalocean.com/community/tutorials/how-to-set-up-apache-virtual-hosts-on-ubuntu-18-04
