sudo apt install git-all
git clone https://github.com/wiehehq/vm_bash_scripting.git
cd vm_bash_scripting
git status
cp ~/git_setup.sh git_configuration.sh
git add .
git config --global user.email "local_vm_generic_default_user_email.com"
git config --global user.name "local_vm_generic_default_user_name"
git commit -m "This is the test message for the test commit for the test file"
git status
git push origin master
git status

