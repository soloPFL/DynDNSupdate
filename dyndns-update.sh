#!/bin/bash 
ipinfo=$(curl ifconfig.co/ip)

# https://github.com/soloPFL/DynDNSupdate
# http://creativecommons.org/licenses/by-sa/4.0/
# Please add your username, password and host you want to update in the next lines.
# then just execute the script to update the ip. 

user=
password=
host=
echo "....."
echo "my ip"
echo "$ipinfo" 

curl https://$user:$password@dyndns.strato.com/nic/update?hostname=$host&myip=$ipinfo
echo "$host status update complete"
