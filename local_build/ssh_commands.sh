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
  ssh_path='~/.ssh/id_rsa'
  passphrase='test_passphrase'
elif [ "$defaults_requested" = "N" ] ; then
  echo
  read -p 'Enter email: ' email
  read -p 'Enter SSH path with filename: ' ssh_path
  read -s -p 'Enter passphrase you want to use: ' passphrase
  echo
fi

echo
echo "email ------ [$email]"
echo "ssh_path --- [$ssh_path]"
echo "passphrase - [$passphrase]"

echo

show_command 'eval "$(ssh-keygen -t rsa -b 4096 -C $email -f $ssh_path -P $passphrase)"'
eval "$(ssh-keygen -t rsa -b 4096 -C $email -f $ssh_path -P $passphrase)"
show_command 'eval "$(ssh-agent -s)"'
eval "$(ssh-agent -s)"
show_command 'ssh-add $ssh_path'
eval "$(ssh-add $ssh_path)"

exit
