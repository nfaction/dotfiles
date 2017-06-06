alias b='byobu'
alias times="date -d@"
alias sk="cat ~/.ssh/id_rsa.pub"
alias ls='ls --color=auto'
alias qfind="find . -iname "

# Keys
## http://askubuntu.com/questions/362280/enter-ssh-passphrase-once
alias storkey="ssh-add ${HOME}/.ssh/id_rsa"

# Updates
alias upg="apt-get update && apt-get upgrade -y"
alias upd="apt-get update && apt-get dist-upgrade -y"
alias upa="apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y && apt-get autoclean -y"

