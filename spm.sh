#!/bin/bash
apt-get -y update

echo '127.0.0.1 servername' > /etc/hosts
# install mono
apt-get -y install mono-complete 

# register the vm with octopus as a new ssh connection
apt-get -y install jq

serverUrl=$1
apiKey=$2
localIp=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
environment=$3
accountId="usernamepassword-228devspm"
fingerprint=$(ssh-keygen -E md5 -l -f /etc/ssh/ssh_host_rsa_key.pub | cut -c10-56)
machineName="228d-spm0"

environmentId=$(wget --header="X-Octopus-ApiKey: $apiKey" -O- ${serverUrl}/api/environments | jq ".Items[] | select(.Name==\"${environment}\") | .Id" -r)

machineId=$(wget --header="X-Octopus-ApiKey: $apiKey" --post-data "{\"Endpoint\": {\"CommunicationStyle\":\"Ssh\",\"AccountId\":\"$accountId\",\"Host\":\"$localIp\",\"Port\":\"22\",\"Uri\":\"ssh://$localIp:22/\",\"Fingerprint\":\"$fingerprint\"},\"EnvironmentIds\":[\"$environmentId\"],\"Name\":\"$machineName\",\"IsDisabled\":false,\"Uri\":null,\"Thumbprint\":null,\"TenantIds\":[],\"TenantTags\":[],\"Roles\":[\"contentspm\"]}" -O- ${serverUrl}/api/machines | jq ".Id" -r)

healthTaskId=$(wget --header="X-Octopus-ApiKey: $apiKey" --post-data "{\"Name\":\"Health\",\"Description\":\"Check $machineName health\",\"Arguments\":{\"Timeout\":\"00:05:00\",\"MachineIds\":[\"$machineId\"]}}" -O-  ${serverUrl}/api/tasks | jq ".Id" -r)

#sudo add-apt-repository "deb http://pub-repo.sematext.com/debian sematext main"
#wget -O- https://pub-repo.sematext.com/ubuntu/sematext.gpg.key | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install default-jdk -y
#sudo apt-get install spm-client -y
