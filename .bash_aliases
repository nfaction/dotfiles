##################
# Global Aliases #
##################
alias qfind="find . -iname "
alias p="/sbin/ping "
alias rs="rsync -avz "
alias gip="curl icanhazip.com"
alias internet="lsof -P -i -n"
alias 'ps?'='ps ax | grep '
alias ee="exit"
alias skr="ssh-keygen -R "
alias brc="source $HOME/.bash_profile"
alias myip="echo $MY_IP"
alias mymac="echo $MY_MAC"
alias ascii='for i in {1..256};do p="  $i";echo -e "${p: -3} \\0$(($i/64*100+$i%64/8*10+$i%8))";done|cat -t|column -c120'
alias rhist="history | awk '{a[$2]++}END{for(i in a){print a[i] ' ' i}}' | sort -rn | head"
alias mksshdir="echo -e '\nRoot Account:\nmkdir -p /root/.ssh;chmod 700 /root/.ssh;cd /root/.ssh;mkdir -p /root/.ssh/tmp;touch /root/.ssh/authorized_keys\n\nUser account:\nmkdir -p ~/.ssh;chmod 700 ~/.ssh;cd ~/.ssh;mkdir -p ~/.ssh/tmp;touch ~/.ssh/authorized_keys\n'"
alias pf="cd $pf"

################
# Git commands #
################
alias gcl="git clone "
alias ga="git add "
alias gc="git commit"
alias gp="git push origin master"
alias gs="git status"
alias gpl="git pull"

############
# Personal #
############
alias moat="mattofalltrades.org"


##########
# Extras #
##########
