#!/bin/bash


# Will run at all points that some kind of checkpoint would be helpful in the terminal
function checkpoint () {
    HR="........................................................................"
    for counter in {1..12}
    do
        echo $HR
    done
}

##### Update and upgrade before getting started via this script

echo "update and upgrade before getting started via this script" | checkpoint
apt update | checkpoint
apt upgrade | checkpoint
echo "Y" | checkpoint

##### Install CURL and some other dependencies via this script
echo "Install CURL and some other dependencies via this script" | checkpoint
apt install curl | checkpoint
echo "Y" | checkpoint
apt install software-properties-common apt-transport-https wget | checkpoint
echo "Y" | checkpoint

##### Install Visual Studio via this script
echo "Install Visual Studio via this script" | checkpoint
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - | checkpoint
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | checkpoint
apt update | checkpoint
apt install code | checkpoint

##### Install Chrome via this script
echo "Install Chrome via this script" | checkpoint
apt install gdebi-core | checkpoint
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb | checkpoint
gdebi google-chrome-stable_current_amd64.deb | checkpoint
echo "Y" | checkpoint

##### Install and configure Git via this script
echo "Install and configure Git via this script" | checkpoint
ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" | checkpoint
echo "/home/dev/.ssh/id_rsa" | checkpoint
echo "" | checkpoint
echo "" | checkpoint
eval "$(ssh-agent -s)" | checkpoint
ssh-add ~/.ssh/id_rsa | checkpoint
read -p "Copy and paste the public key into github, and when finished, press enter: " | checkpoint
apt install git-all | checkpoint
echo "Y" | checkpoint
git clone git@github.com:wiehehq/vm_bash_scripting.git | checkpoint
echo "yes" | checkpoint
cd vm_bash_scripting | checkpoint
cp ~/stack_builder.sh stack_builder.sh | checkpoint
rm ~/stack_builder.sh | checkpoint
git add stack_builder.sh | checkpoint
git config --global user.email "local_vm_generic_default_user_email.com" | checkpoint
git config --global user.name "local_vm_generic_default_user_name" | checkpoint
git commit -m "deployment script (which is also what is making this commit)" | checkpoint
git push origin master | checkpoint

##### Set as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code
gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'code.desktop']" | checkpoint

printf "\n\n-----------------------------------------------\n-----------------------------------------------\n\n   All done setting up your new environment! \n\n-----------------------------------------------\n-----------------------------------------------\n\n" | checkpoint

exit
