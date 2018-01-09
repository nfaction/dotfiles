####################
## Global Aliases ##
####################

##########
# Common #
##########
alias ee="exit"
alias brc="source $HOME/.bash_profile"

######
# LS #
######
alias ls='ls -G'
alias ll='ls -Ghl'
alias la='ls -Gahl'
alias lt='ls -Gltrh'
alias lta='ls -Glatrh'
alias lr='ls -lahtr'

########
# Grep #
########
alias grep='grep --colour'

################
# Git commands #
################
alias gcl="git clone "
alias ga="git add "
alias gc="git commit"
alias gp="git push origin master"
alias gs="git status"
alias gr="git remote -v"
alias gpl="git pull"

#######
# SSH #
#######
alias mksshdir="echo -e '\nRoot Account:\nmkdir -p /root/.ssh;chmod 700 /root/.ssh;cd /root/.ssh;mkdir -p /root/.ssh/tmp;touch /root/.ssh/authorized_keys\n\nUser account:\nmkdir -p ~/.ssh;chmod 700 ~/.ssh;cd ~/.ssh;mkdir -p ~/.ssh/tmp;touch ~/.ssh/authorized_keys\n'"
alias skr="ssh-keygen -R "

##############
# Networking #
##############
alias p="/sbin/ping "
alias gip="curl icanhazip.com"
alias internet="lsof -P -i -n"

#####################
# File Manipulation #
#####################
alias qfind="find . -iname "
alias rs="rsync -avz "

#########
# Tools #
#########
alias 'ps?'='ps ax | grep '
alias ascii='for i in {1..256};do p="  $i";echo -e "${p: -3} \\0$(($i/64*100+$i%64/8*10+$i%8))";done|cat -t|column -c120'
alias times="date -r "
