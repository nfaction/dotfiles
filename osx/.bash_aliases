alias sk="cat ~/.ssh/id_rsa.pub | tee >(pbcopy)"

# OS
alias o='open '
alias oa='open /Applications'

# List
alias ls='ls -G'
alias ll='ls -Ghl'
alias la='ls -Gahl'
alias lt='ls -Gltrh'
alias lta='ls -Glatrh'
alias lr='ls -lahtr'

# Grep
alias grep='grep --colour'

# Mounting
alias mount='hdiutil mount '
alias umount='hdiutil unmount '

# Burn ISO
alias burn='hdiutil burn '

# Make ISO FULL: hdiutil makehybrid -iso -joliet -o image.iso /path/to/source
# http://osxdaily.com/2012/03/16/create-iso-images-from-the-command-line/
alias makeiso='hdiutil makehybrid -iso -joliet -o image.iso '
# dd if=/dev/dvd of=/destination/path/dvd.iso

# List all disks
alias fdisk-l='diskutil list'
alias times="date -r "

# Files
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

# Spotlight Indexing
alias indexon='sudo mdutil -a -i on'    
alias indexoff='sudo mdutil -a -i off'    

# Watch
alias watch='_() { while :; do clear; $@; sleep 2; done }; _'

# Flush DNS
if [[ $VERS == '10.10' ]]; then
  alias flushdns="sudo discoveryutil udnsflushcaches"
elif [[ $VERS == '10.9' ]]; then
	alias flushdns="dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
else
	alias flushdns="sudo killall -HUP mDNSResponder"
fi

alias st="open -a /Applications/Sublime\ Text\ 2.app/ "

alias sethostname="sudo scutil –-set HostName "

alias ulkey="security unlock-keychain && eval `ssh-agent -s`"  # Unlock keychain for ssh key

# Brew
alias fixbrew="sudo chown -R $USER:admin /usr/local/"

# alias fixbrew2="sudo chown -R $USER:admin /Library/Caches/Homebrew"
# Brew fix: http://stackoverflow.com/questions/16432071/how-to-fix-homebrew-permissions/16450503