#!/bin/bash

function show_command() {
  echo '';
  echo $1
  echo '';
}

show_command '----   mkdir Development   ----'
eval "$(mkdir Development)"
echo '';
show_command '----   ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" -f "/home/dev/.ssh/id_rsa"   ----'
eval "$(ssh-keygen -t rsa -b 4096 -C 'my_email' -f '/home/dev/.ssh/id_rsa')"
echo '';
show_command '----   eval "$(ssh-agent -s)"   -----'
eval "$(ssh-agent -s)"
echo '';
show_command '----   ssh-add ~/.ssh/id_rsa   -----'
eval "$(ssh-add ~/.ssh/id_rsa)"
echo '';

exit
