#!/bin/bash

# -----  SHOULD BE FUNCTIONAL, BUT LOOK AT THE FINE PRINT -----

######################  KNOWN VULNERABILITIES

######################  ARGUEMENTS

# ssh-keygen "file in which to save your key" (hard-coded with -f currently)

# ssh-keygen passphrase (though passing as an arguement which would be in plain text wouldn't be much better, unless there is some kind of -s flag like 'read' has or something?)

# git repo to clone (instead of mine, since other users will probably want to use their own repos)



######################  FUNCTIONS

# Will run at all points that some kind of checkpoint would be helpful in the terminal
function checkpoint () {
    HR="........................................................................"
    for counter in {1..12}
    do
        echo $HR
    done
}

function leave_dev_note() {
    echo 
    echo
    echo 
    echo 
    echo
    echo 
    echo
    echo
    echo "........................................................................"
    echo
    # $1 = arg: Text to be echo'd as dev note
    echo $1
    echo
    echo "........................................................................"
    echo 
    echo 
    echo
    echo 
    echo
    echo
    echo
    echo
}

function exit_loudly () {
    leave_dev_note "!!!!!!!!!!!!   EXITING LOUDLY   !!!!!!!!!!!!"
    exit
}

function start_loudly () {
    leave_dev_note "!!!!!!!!!!!!   STARTING LOUDLY   !!!!!!!!!!!!"
}







######################  COMMANDS







##### START SCRIPT LOUDLY
start_loudly


##### Installing CURL and some other dependencies via this script
leave_dev_note "Installing CURL and some other dependencies via this script"
yes | apt install curl
yes | apt install software-properties-common apt-transport-https wget


##### Installing Visual Studio via this script
leave_dev_note "Installing Visual Studio via this script"
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code


##### Installing Chrome via this script
leave_dev_note "Installing Chrome via this script"
yes | sudo apt install gdebi-core
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
yes | gdebi google-chrome-stable_current_amd64.deb


##### Installing and configure Git via this script
leave_dev_note "Installing and configure Git via this script"
ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" -f "/home/dev/.ssh/id_rsa"
# USER MUST ENTER A PASSPHRASE MANUALLY UNTIL A SECURE SOLUTION IS FOUND
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
read -p "Copy and paste the public key into github, and when finished, press enter: "
yes | sudo apt install git-all
yes | git clone git@github.com:wiehehq/vm_bash_scripting.git
# USER MUST ENTER YES MANUALLY UNTIL A SECURE SOLUTION IS FOUND
cd vm_bash_scripting
cp ~/stack_builder.sh stack_builder.sh
rm ~/stack_builder.sh
git add stack_builder.sh
git config --global user.email "local_vm_generic_default_user_email.com"
git config --global user.name "local_vm_generic_default_user_name"
git commit -m "deployment script (which is also what is making this commit)"
git push origin master


##### Setting as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code
leave_dev_note "Setting as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code"
gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'code.desktop']"

exit_loudly

