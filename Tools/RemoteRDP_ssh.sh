@echo off
echo "RDP connection via SSH"
echo 

echo "Enter the username to connect with"
read user
echo 

echo "Enter the local port to use"
read locPrt

echo "Enter the hostname"
read host

ssh -L $locPrt:$host:3389 $user@remote.vitori.org

echo "Please use 127.0.0.1:$locPrt to connect to RDP"