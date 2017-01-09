add-apt-repository "deb http://pub-repo.sematext.com/debian sematext main"
wget -O- https://pub-repo.sematext.com/ubuntu/sematext.gpg.key | apt-key add -

#echo '$1 $2' > /etc/hosts
apt-get update
# install mono
apt-get install mono-complete -y 
apt-get install default-jdk -y
apt-get install spm-client -y
