#!/bin/bash


ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com"
# [Press Enter]
# [Press Enter]
# [Press Enter]
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Copy and paste .pub ssh key into github

sudo apt install git-all
git clone git@github.com:wiehehq/vm_bash_scripting.git
# [yes]
cd vm_bash_scripting
git status
cp ~/git_config_script.sh git_config_script.sh
rm ~/git_config_script.sh
git add .
git config --global user.email "local_vm_generic_default_user_email.com"
git config --global user.name "local_vm_generic_default_user_name"
git commit -m "This is the test message for the test commit for the test file"
git status
git push origin master
git status
