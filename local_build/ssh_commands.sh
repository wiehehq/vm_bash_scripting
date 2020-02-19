#!/bin/bash

echo '----   ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" -f "/home/dev/.ssh/id_rsa"   ----'
echo 'ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" -f "/home/dev/.ssh/id_rsa"'
echo '----   eval "$(ssh-agent -s)"   -----'
echo 'eval "$(ssh-agent -s)"'
echo '----   ssh-add ~/.ssh/id_rsa   -----'
echo ssh-add ~/.ssh/id_rsa
echo '----   ssh-add ~/.ssh/id_rsa   -----'

exit
