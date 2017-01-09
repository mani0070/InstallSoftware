#!/bin/bash
apt-get -y update

#echo '127.0.0.1 servername' > /etc/hosts
# install mono
apt-get -y install mono-complete 

add-apt-repository "deb http://pub-repo.sematext.com/debian sematext main"
wget -O- https://pub-repo.sematext.com/ubuntu/sematext.gpg.key | apt-key add -
apt-get update
apt-get install default-jdk -y
apt-get install spm-client -y
