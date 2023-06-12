#! /bin/bash
#

#List of changes in files
git status
""

#add new / modified files to sync
#git add git_sync.sh

#Commit changes being sync'ed
echo "Please enter the commit comment to include"
read commit
git commit -m "$commit"
echo ""
# Push changes to Git
git push
