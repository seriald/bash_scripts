#!/bin/bash

echo "Enter the hostname to connect with"
read host

scp /home/robert/.ssh/robert_ansible.pub robert@$host:/home/robert/.ssh/robert_ansible.pub
