#!/bin/bash

echo '----   mkdir Development   ----'
eval "$(mkdir Development)"
echo '';
echo '----   ssh-keygen -t rsa -b 4096 -C "local_vm_generic_default_user_email.com" -f "/home/dev/.ssh/id_rsa"   ----'
eval "$(ssh-keygen -t rsa -b 4096 -C 'my_email' -f '/home/dev/.ssh/id_rsa')"
echo '';
echo '----   eval "$(ssh-agent -s)"   -----'
eval "$(ssh-agent -s)"
echo '';
echo '----   ssh-add ~/.ssh/id_rsa   -----'
eval "$(ssh-add ~/.ssh/id_rsa)"
echo '';

exit
