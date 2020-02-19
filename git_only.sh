#!/bin/bash




######################		KNOWN VULNERABILITIES		######################

# Nothing yet




######################		TO-DO LIST			######################

# User must enter a passphrase mannually until a secure solution is found

# ssh-keygen "file in which to save your key" (hard-coded with -f currently)

# ssh-keygen passphrase (though passing as an arguement which would be in plain text wouldn't be much better, unless there is some kind of -s flag like 'read' has or something?)

# git repo to clone (instead of mine, since other users will probably want to use their own repos)

# Considering that the passphrase can be echo'd within the script, this may not be a secure way to get the passphrase from the user (if a secure way exists at all)




######################		FUNCTIONS			######################

# Will run at all points that some kind of checkpoint would be helpful in the terminal
function checkpoint () {
# Will run at all points that some kind of checkpoint would be helpful in the terminal
  HR="........................................................................"
  for counter in {1..12}
  do
      echo $HR
  done
}

function empty_line () {
# Echo an empty line
  echo ""
  echo ""
}

function leave_dev_note() {
# Echo a note with significant spacing to deliniate starting new goal for script
  empty_line_counter=20
  for i in `seq 1 2`; do
    echo
  done
  echo "........................................................................"
  echo
  # $1 = arg: Text to be echo'd as dev note
  echo $1
  echo
  echo "........................................................................"
  for i in `seq 1 2`; do
    echo
  done
}

function start_loudly () {
# Make clear that commands are now being executed via this script
  leave_dev_note "!!!!!!!!!!!!   STARTING LOUDLY   !!!!!!!!!!!!"
}

function exit_loudly () {
# Make clear that this script is ending
  leave_dev_note "!!!!!!!!!!!!   EXITING LOUDLY   !!!!!!!!!!!!"
  exit
}




######################		COMMANDS			######################


##### START SCRIPT LOUDLY
start_loudly


# What is the directory in which you would like to store your keys?

#### Define default vars
this_script_name='git_setup_script.sh'
ssh_path='~/.ssh'
ssh_file='id_rsa'
repo_account='wiehehq'
repo_name='vm_bash_scripting'
git_username='default_git_username'
git_email='default_git_email'
git_passphrase=''
git_first_file_content='Here is some content for a file pushed to the repo'
git_first_commit_message='default script, which is making this commit'


#### Ask if default settings desired
read -p $'\n\nYou are about to start setting up Git, and will be doing stuff with Github. In order to do this, you will need to have a default account (regardless of what input you provide here). Do you want to use default settings? [Y\N]:  ' defaults_requested

case $defaults_requested in

  y)
    defaults_requested=true
  ;;

  Y)
    defaults_requested=true
  ;;

  yes)
    defaults_requested=true
  ;;

  Yes)
    defaults_requested=true
  ;;

  YES)
    defaults_requested=true
  ;;

  n)
    defaults_requested=false
  ;;

  N)
    defaults_requested=false
  ;;

  no)
    defaults_requested=false
  ;;

  No)
    defaults_requested=false
  ;;

  NO)
    defaults_requested=false
  ;;

  *)
    echo $'\n\n'
    echo "Sorry, but your response of '$defaults_requested' was not recognized. Exiting script..."
    exit_loudly
  ;;

esac
empty_line
if ! $defaults_requested
then
  ## Confirm non-default variables
  echo 'Okay, I will ask for the details you want to use...'
  empty_line
  ## Prompt SSH path
  read -p 'What is your ssh directories path? ' ssh_path
  empty_line
  ## Prompt SSH filename
  read -p 'What is your ssh directories path? ' ssh_file
  empty_line
  ## Prompt Git username
  read -p 'What username do you want to use for the git user you are creating? ' git_username
  empty_line
  ## Prompt Git email
  read -p 'What email do you want to use for the git user you are creating? ' git_email
  empty_line
  ## Prompt Git passphrase
  read -s -p 'What passphrase do you want to use for the git user you are creating? ' git_passphrase
  empty_line
  ## Prompt Git file content
  read -p 'What do you want to be the content of the first file you push? ' git_first_file_content
  empty_line
  ## Prompt Git commit message
  read -p 'What do you want to use as your first commit message? ' git_first_commit_message
  empty_line
else
  echo "Lets use defaults then!"
fi

leave_dev_note "Chosen Git settings are below..."

#### If default settings not desired

echo "ssh_path --------------------- [$ssh_path]"
echo "ssh_file ----------------- [$ssh_file]"
echo "git_username ----------------- [$git_username]"
echo "git_email -------------------- [$git_email]"
echo "git_passphrase --------------- [$git_passphrase]"
echo "git_first_file_content ------- [$git_first_file_content]"
echo "git_first_commit_message ----- [$git_first_commit_message]"


##### Installing and configure Git via this script
leave_dev_note "Installing and configure Git via this script"

### User must run these commands BEFORE running this script - these are the commands ran for default settings

# ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" -f "/home/dev/.ssh/id_rsa"

# eval "$(ssh-agent -s)"

# ssh-add ~/.ssh/id_rsa

leave_dev_note 'read -p "Copy and paste the public key into github, and when finished, press enter: "'
read -p "Copy and paste the public key into github, and when finished, press enter: "
leave_dev_note 'yes | sudo apt install git-all'
yes | sudo apt install git-all
leave_dev_note 'yes | eval "$(git clone git@github.com:$git_account/$git_repo.git)"'
yes | eval "$(git clone git@github.com:$git_account/$git_repo.git)"
leave_dev_note 'eval "$(cd $git_repo)"'
eval "$(cd $git_repo)"
leave_dev_note 'eval "$(cp ~/$this_script_name $this_script_name)"'
eval "$(cp ~/$this_script_name $this_script_name)"
leave_dev_note 'eval "$(rm ~/$this_script_name.sh)"'
eval "$(rm ~/$this_script_name.sh)"
leave_dev_note 'git add $this_script_name'
git add $this_script_name
leave_dev_note 'git config --global user.email $git_username'
git config --global user.email $git_username
leave_dev_note 'git config --global user.name $git_email'
git config --global user.name $git_email
leave_dev_note 'git commit -m "$first_commit_message"'
git commit -m "$first_commit_message"
leave_dev_note 'git push origin master'
git push origin master


##### Setting as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code
leave_dev_note "Setting as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code"
gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'code.desktop']"

exit_loudly

