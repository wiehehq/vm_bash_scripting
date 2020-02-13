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





##### START SCRIPT LOUDLY
start_loudly

##### GET USER INPUT TO PUT INTO VARS

unrecognized_user_response="Sorry, I don't recognize that response. You'll have to call this script again... Exiting..."

#### Get user input for if they are from wiehehq
read -s -p $'\nAre you from WieheHQ? [y\N]\nIf you are not sure, the answer is definitely [n]\n(By the way, you will not be able to see what you type for certain chosen reasons)\n\n' is_from_wiehehq

case $is_from_wiehehq in
    n)
        echo "That's okay, you can still use this tool (saying yes only limits laziness from WieheHQ)"
        ;;
    N)
        echo "That's okay, you can still use this tool (saying yes only limits laziness from WieheHQ)"
        ;;
    no)
        echo "That's okay, you can still use this tool (saying yes only limits laziness from WieheHQ)"
        ;;
    No)
        echo "That's okay, you can still use this tool (saying yes only limits laziness from WieheHQ)"
        ;;
    NO)
        echo "That's okay, you can still use this tool (saying yes only limits laziness from WieheHQ)"
        ;;
    nO)
        echo "That's okay, you can still use this tool (saying yes only limits laziness from WieheHQ)"
        ;;
    y)
        echo "Sounds good, go on ahead"
        ;;
    Y)
        echo "Sounds good, go on ahead"
        ;;
    yes)
        echo "Sounds good, go on ahead"
        ;;
    Yes)
        echo "Sounds good, go on ahead"
        ;;
    YES)
        echo "Sounds good, go on ahead"
        ;;
    yES)
        echo "Sounds good, go on ahead"
        ;;
    *)
        echo $unrecognized_user_response
        ;;
esac

#### Get user input for repo to clone
echo $'\n***   Right now, you can only clone from repos in github.com/wiehehq using this tool. But if you clone from this tool and help with some super-mega-basic logic with prompts and variables, we can change that!\n'
read -p $'\nWhat do you want to build?\n\n[0]  VM Bash Scripting\n[1]  PERN Stack\n[2]  LAMP Stack\n\n' requested_stack

echo ''
echo "Okay, let me make sure [$requested_stack] is an available option..."
echo ''

case $requested_stack in
# think of the variable repo_to_clone as fitting this format below
# github.com/wiehehq/repo_to_clone
    0)
        repo_to_clone='vm_bash_scripting'
        echo "Okay, we'll clone this repo right now: [$repo_to_clone]"
        ;;
    1)
        repo_to_clone='pern_stack'
        echo "Okay, we'll clone this repo right now: [$repo_to_clone]"
        ;;
    2)
        repo_to_clone='lamp_stack'
        echo "Okay, we'll clone this repo right now: [$repo_to_clone]"
        ;;
    *)
        echo "Sorry, I don't recognize that"
esac
echo '';


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
yes | git clone git@github.com:wiehehq/$repo_to_clone.git
# USER MUST ENTER YES MANUALLY UNTIL A SECURE SOLUTION IS FOUND
cd $repo_to_clone
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

