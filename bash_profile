#############################
##  .bash_profile/.bashrc  ##
#############################
## written by Matt DePorter #
#############################

######################
# Source extra files #
######################
bash_files=".bash_aliases .bash_env .bash_functions .dotfiles/tmuxinator.bash"

# Load each file into profile, one by one
for f in $bash_files; do
  # Verify that file exists before loading.
  if [ -f $HOME/$f ]; then
    source $HOME/$f
  fi
done

######################################
# Python Virtual Environment Wrapper #
######################################
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

##########
# iTerm2 #
##########
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
