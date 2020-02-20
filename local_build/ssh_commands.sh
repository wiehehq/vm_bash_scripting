#!/bin/bash

function show_command() {
  echo ''
  echo '--------------------------------------';
  echo $1
  echo '--------------------------------------';
  echo ''
}

echo
read -p 'Do you want to use defaults? ' defaults_requested
if [ "$defaults_requested" = "Y" ] ; then
  email='generic_email.com'
  ssh_path='~/.ssh'
  filename='id_rsa'
  passphrase=''
elif [ "$defaults_requested" = "N" ] ; then
  echo
  read -p 'Enter email: ' email
  read -p 'Enter SSH path (do not put slash at end): ' ssh_path
  read -p 'Enter key filename: ' filename
  read -s -p 'Enter passphrase you want to use: ' passphrase
  echo
fi

echo
echo "email ------ [$email]"
echo "ssh_path --- [$ssh_path]"
echo "filename --- [$filename]"
echo "passphrase - [$passphrase]"

echo

# show_command 'eval "$(ssh-keygen -t rsa -b 4096 -C "$email" -f "$ssh_path/$filename")"'
eval "$(ssh-keygen -t rsa -b 4096 -C '$email' -f "$ssh_path/$filename" -P "$passphrase")"
# show_command 'eval "$(ssh-agent -s)"'
eval "$(ssh-agent -s)"
# show_command 'ssh-add ~/.ssh/id_rsa'
eval "$(ssh-add ~/.ssh/id_rsa)"

exit
