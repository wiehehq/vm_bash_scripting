#!/bin/bash




######################		KNOWN VULNERABILITIES		######################

# Nothing yet




######################		TO-DO LIST			######################

# Ideally, you will be able to run this script using something like [$ sudo bash ${this_scripts_filename}] and that will be all you need to do


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

##### Get git non-default profile variables
email='default_email.com'
key_path='~/.ssh'
key_file='id_rsa'



##### Echo commands for generating keys

leave_dev_note "Run these commands, one single command at a time"

eval "$(ssh-keygen -t rsa -b 4096 -C $email -f ~/dev/.ssh/id_rsa)"

eval "$(ssh-agent -s)"

eval "ssh-add $key_path/$key_file"


##### EXIT SCRIPT LOULDY
exit_loudly
