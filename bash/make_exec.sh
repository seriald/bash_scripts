#! /bin/bash
# 2022/08/11
#
#
#

echo "Running will make all Bash scripts executable"
echo
echo "Continue Y/N"

read confirm

if [[ ($confirm -eq Y) || ($confirm -eq y) ]]
	# then sudo chmod u+x *.sh
	then chmod u+x *.sh
fi

# chmod -x  *.sh
