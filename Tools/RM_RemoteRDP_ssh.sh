echo "Looking for SSH Tunnels"
ps |grep "ssh -L"|grep -v grep
test = ps |grep "ssh -L"|grep -v grep

echo ""
echo "Killing all SSH Tunnels' currently in use"
ps |grep "ssh -L"|grep -v grep|awk '{print $1}'|xargs kill