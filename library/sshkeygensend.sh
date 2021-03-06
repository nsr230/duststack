declare -a servers
servers=$(awk '{ print $1 }' /etc/hosts | grep ^192.168.122)

function sendkeys(){
  for ipadr in ${servers[*]}; do sshpass -p openstack ssh-copy-id -o PubkeyAuthentication=no -o StrictHostKeyChecking=no root@${ipadr} > /dev/null 2>&1 ; done
exit
}

function genkeys(){
  ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa > /dev/null 2>&1 
}

if [ -f ~/.ssh/id_rsa ]; then
  echo "the file exist. passed it"
  sendkeys 
else
  genkeys
  sendkeys
fi


