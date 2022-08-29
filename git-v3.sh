#!/bin/bash

echo "Deleting the work folder if one exists"
[ -d work ] && rm -rf work

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

git push -u origin master


echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"

echo "################################################################"
echo "###############      Building PKGBUILD      ####################"
echo "################################################################"
pkgname=$(basename "$PWD")
cd /mnt/TEAM-1TB/darklinux/darklinux-pkgbuild/$pkgname-git
sh makepkg-v1.sh
