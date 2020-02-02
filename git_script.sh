#!/bin/bash

sudo apt install git-all
# Enter password
# [Y]
git config --global user.email "local_vm_generic_default_user_email.com"
git config --global user.name "local_vm_generic_default_user_name"
git init
git clone https://github.com/wiehehq/vm_bash_scripting.git
cd vm_bash_scripting
echo "this is a test file" >> test_file.txt
git add .
git commit -m "This is the test message for the test commit for the test file"
git status
git push origin master
git status
# check to make sure test_file.txt is on github
rm -rf test_file.txt
git add .
git commit -m "remove test file"
git push origin master
# check to make sure test_file.txt is no longer on github
