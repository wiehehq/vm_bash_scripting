#!/bin/bash


##### Update and upgrade before getting started via this script

echo "update and upgrade before getting started via this script"
apt update
apt upgrade
echo "Y"

##### Install CURL and some other dependencies via this script
echo "Install CURL and some other dependencies via this script"
apt install curl
echo "Y"
apt install software-properties-common apt-transport-https wget
echo "Y"

##### Install Visual Studio via this script
echo "Install Visual Studio via this script"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install code

##### Install Chrome via this script
echo "Install Chrome via this script"
apt install gdebi-core
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi google-chrome-stable_current_amd64.deb
echo "Y"

##### Install and configure Git via this script
echo "Install and configure Git via this script"

ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com"

echo "/home/dev/.ssh/id_rsa"
echo ""
echo ""

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

read -p "Copy and paste the public key into github, and when finished, press enter: "

apt install git-all
echo "Y"
git clone git@github.com:wiehehq/vm_bash_scripting.git

echo "yes"

cd vm_bash_scripting
cp ~/stack_builder.sh stack_builder.sh

git add stack_builder.sh
git config --global user.email "local_vm_generic_default_user_email.com"
git config --global user.name "local_vm_generic_default_user_name"
git commit -m "deployment script (which is also what is making this commit)"
git push origin master

##### Set terminal and text editor as favorites (control panel on left)
### gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.gedit.desktop']"

##### Set as favorites (in control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code
gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'code.desktop']"
code
google-chrome

echo "All Done!"
