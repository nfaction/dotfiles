#################################################################
# spotlight: Search for a file using MacOS Spotlight's metadata #
#################################################################
# e.g. spotlight helloworld.c                                   #
#################################################################
function spotlight ()
{ 
  mdfind "kMDItemDisplayName == '$@'wc";
}

###############################################
# ii:  display useful host related informaton #
###############################################
function ii () {
    echo -e "\nYou are logged on ${RED}`hostname`"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

###################################################
# Convert date (YYYY-MM-DD) to epoch (01/01/1970) #
###################################################
# For /etc/shadow                                 #
#                                                 #
# e.g. ct 2014-05-19                              #
###################################################
function ct ()
{
  if [ $# == 0 ]
    then
      echo "Please specify date in (YYYY-MM-DD)..."
      echo "Exiting..."
      return 1
  fi
  fdate=$1
  echo `date -j -f '%Y-%m-%d' ${fdate} +%s` / 86400 | bc
}

