echo "RDP connection via SSH
echo 
echo "Enter the hostname"

read host

ssh -L 33389:$host:3389 remote.vitori.org

