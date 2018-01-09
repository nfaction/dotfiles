####################
## Bash Functions ##
####################

##############################
# Wipe bad known_hosts entry #
##############################
# e.g. khw 48                #
##############################
function khw ()
{
  echo "wiping line: $1"
  sed -i.bak -e "${1}d" ~/.ssh/known_hosts
}

########################################
# Copy SSH Public key to remote server #
########################################
# e.g.  kc root@<hostname>             #
# e.g.  kc root@<hostname> <ssh_port>  #
########################################
function kc ()
{
  ssh_port=22
  if [ $# == 0 ]
    then
      echo "Please specify host..."
      echo "Exiting..."
      exit 1
  elif [ $# == 2 ]
    then
      # Grab SSH port
      ssh_port=$2
  fi
  host=$1

  echo "Copying key to hostname: $host on port: $ssh_port..."

  cat ~/.ssh/id_rsa.pub | ssh $host -p $ssh_port 'cat >> ~/.ssh/authorized_keys'
}

########################################
# Check to see if a reboot is required #
########################################
# e.g. reboot-required                 #
########################################
function reboot-required ()
{
  if [ -a /var/run/reboot-required ];then
    echo "A reboot is required!"
    echo
  else
    echo "A reboot is NOT required."
  fi
}

######################
# Read secret string #
######################
function read_secret ()
{
    # Disable echo.
    stty -echo

    # Set up trap to ensure echo is enabled before exiting if the script
    # is terminated while echo is disabled.
    trap 'stty echo' EXIT

    # Read secret.
    read "$@"

    # Enable echo.
    stty echo
    trap - EXIT

    # Print a newline because the newline entered by the user after
    # entering the passcode is not echoed. This ensures that the
    # next line of output begins at a new line.
    echo
}

######################################
# Ping multiple machines             #
######################################
# e.g. pm <hostname> 10.0.0.10{1..9} #
######################################
function pm ()
{
  if [ $# == 0 ]
    then
      echo "Please specify multiple IP addresses..."
      echo "Exiting..."
      return 1
  fi
  for i in $@
  do
    ping -c 1 -t 1 $i  > /dev/null 2>&1 && 
    printf "Ping Status of %-15s : Success\n" $i || 
    printf "Ping Status of %-15s : Failed\n" $i
  done
}

################################################
# Get MAC and other information of remote host #
################################################
#  Download for arp-scan
#   Site: http://www.nta-monitor.com/tools-resources/security-tools/arp-scan
#   Mac: https://code.google.com/p/rudix/downloads/detail?name=arp-scan-1.8-0.pkg
#   GH: https://github.com/royhills/arp-scan
#   Windows CLI: getmac /s %system name%
#
function netinfo ()
{
  if [ $# == 0 ]
    then
      echo "Please specify IP address..."
      echo "Exiting..."
      return 1
  fi
  for i in $@
    do
      echo $i
      arp-scan $i | grep -A1 "Starting" | grep -v "Starting"
      echo
  done
}

########################################
# Convert Subnet Mask to CIDR Notation #
########################################
# e.g. mask2cdr 255.255.255.128        #
########################################
function mask2cdr ()
{
  if [ $# == 0 ]
    then
      echo "Please specify full subnet mask..."
      echo "Exiting..."
      return 1
  fi
   # Assumes there's no "255." after a non-255 byte in the mask
   local x=${1##*255.}
   set -- 0^^^128^192^224^240^248^252^254^ $(( (${#1} - ${#x})*2 )) ${x%%.*}
   x=${1%%$3*}
   echo $(( $2 + (${#x}/4) ))
}

#############################################
# Convert from CIDR Notation to Subnet Mask #
#############################################
# e.g. cdr2mask 25                          #
#############################################
function cdr2mask ()
{
  if [ $# == 0 ]
    then
      echo "Please specify CIDR subnet..."
      echo "Exiting..."
      return 1
  fi
   # Number of args to shift, 255..255, first non-255 byte, zeroes
   set -- $(( 5 - ($1 / 8) )) 255 255 255 255 $(( (255 << (8 - ($1 % 8))) & 255 )) 0 0 0
   [ $1 -gt 1 ] && shift $1 || shift
   echo ${1-0}.${2-0}.${3-0}.${4-0}
}

############################################
# Quickly search Wikipedia's first section #
############################################
# e.g. wiki ubuntu linux                   #
############################################
function wiki ()
{
  dig +short txt "`echo $@`".wp.dg.cx
}

#################################
# Generate a temporary password #
#################################
# e.g. genpw 2                  #
#################################
function genpw ()
{
  if [ $# == 0 ]
    then
      echo "Please specify password type (1, simple; 2, strong)..."
      echo "Exiting..."
      return 1
  fi

  if [ $1 == 1 ]
    then
      PASS=`pwgen -N 1`
  else
    if [ -z $2 ]
      then
        LEN=8
    else
      LEN=$2
    fi
    PASS=`openssl rand -base64 ${LEN}`
  fi
  echo $PASS
}

################################################
# Convert tempurature in Celsius to Fahrenheit #
################################################
# e.g. ctof 28                                 #
################################################
function ctof ()
{
  if [ $# == 0 ]
    then
      echo "Please specify tempurature in Celcius..."
      echo "Exiting..."
      return 1
  fi
  echo $(($1*9/5+32))
}

###########################################################
# du-sort : Provides a sorted du in human readable format #
###########################################################
# e.g. dus *                                              #
###########################################################
function dus ()
{
  # SORT ORDER  (true/false)
  ASCENDING=true
  # Create temp file
  touch /tmp/duout
  # mktmp file
  DATA="/tmp/duout"
  # RUN DU
  du -sh $@ >$DATA 2>/dev/null
  # SORT DATA AND OUTPUT
  if $ASCENDING
  then
    for P in K M G
    do
      grep -e "[0-9]$P" $DATA|sort -n
    done

  else
    for P in G M K
    do
      grep -e "[0-9]$P" $DATA|sort -nr
    done
  fi
  #remove datafile
  rm $DATA
}

##########
# Extras #
##########
