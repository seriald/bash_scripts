
#!/bin/bash

#varialbles
date=$(date)
user=$(whoami)
whereami=$(pwd)
hostname=$(hostname)

#curl 'wttr.in/Ottawa?m0&lang=en'
echo "Current date: $date"
curl 'wttr.in/?m0&lang=en'
echo ""
echo "Current location: $whereami"
echo "Logged onto: $hostname"
echo ""
echo "You got this $user"
echo ""



