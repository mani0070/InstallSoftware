#!/bin/bash
apt-get -y update

# install mono
apt-get -y install mono-complete 

sudo add-apt-repository "deb http://pub-repo.sematext.com/debian sematext main"
wget -O - https://pub-repo.sematext.com/ubuntu/sematext.gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install default-jdk -y
sudo apt-get install spm-client -y
