echo "Looking for any SSH Tunnel's"
ps | grep "ssh -L" | grep -v grep
echo ""
echo "Do you see the connection you want to kill"
read confirm

if [[ ($confirm -eq Y) || ($confirm -eq y) ]]
echo ""
echo 'Do you want to kill all the tunnels'
read confirm2

fi