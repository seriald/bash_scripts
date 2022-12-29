#! /bin/bash
#
# 2022/08/14
# scripted lazy commit

git status

echo ""
echo "Staging changes to commit"
git add .

echo ""
git status

echo ""
echo "Please enter a commit message:"
read commit

echo ""
git commit -m "$commit"
git push
