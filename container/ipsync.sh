#!/bin/bash 
ipinfo=$(curl ifconfig.co/ip)

# https://github.com/soloPFL/DynDNSupdate
# http://creativecommons.org/licenses/by-sa/4.0/
# Please add your username, password and host you want to update in the next lines.
# then just execute the script to update the ip. 

user=$user
password=$password
host=$host
sleeptimer=$sleeptimer

if [[ -z "$user" || -z "$password" || -z "$host" ]]; then
  echo 'Your Username, password and host need to be set by env variables user, password and host'
  exit 1
fi

while true
do
    echo "my current ip $ipinfo" | ts '[%Y-%m-%d %H:%M:%S]'

    returnvalue=$(curl --fail-with-body https://$user:$password@dyndns.strato.com/nic/update?hostname=$host&myip=$ipinfo)

    retVal=$?
    if [ $retVal -ne 0 ]; then
    echo "IP update failed" | ts '[%Y-%m-%d %H:%M:%S]'
    exit 1
    fi

    if [ $returnvalue -ne "ok $ipinfo" ]; then
    echo "IP update failed" | ts '[%Y-%m-%d %H:%M:%S]'
    exit 1
    fi

    echo "$host status update complete" | ts '[%Y-%m-%d %H:%M:%S]'

    echo "sleep for $sleeptimer" | ts '[%Y-%m-%d %H:%M:%S]'
    sleep $sleeptimer 
done
