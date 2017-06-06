#
# Convert date (YYYY-MM-DD) to epoch (01/01/1970) for /etc/shadow
# e.g. ct 2014-05-19
#
function ct ()
{
  if [ $# == 0 ]
    then
      echo "Please specify date in (YYYY-MM-DD)..."
      echo "Exiting..."
      return 1
  fi
  fdate=$1
  echo `date -d ${fdate} +%s` / 86400 | bc
}

#
# Display quick information about system
#
function ii ()   # Get current host related info.
{
    echo -e "\nYou are logged on ${BRed}$HN"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; who | cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    # echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; df -h
    echo -e "\n${BRed}Global IP Address :$NC" ; gip
    echo -e "\n${BRed}Local IP Address :$NC" ; myip
    echo -e "\n${BRed}Hostname :$NC" ; echo $HN
    echo -e "\n${BRed}MAC Address :$NC" ; mymac
    echo -e "\n${BRed}Open connections :$NC ";lsof -i -n | grep ESTABLISHED | head -n 10
    echo "..."
    echo
}

