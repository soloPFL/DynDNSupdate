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

#check existing dns entry

oldentry=$(dig +short $host)
echo "existing dns entry"
echo "$oldentry"

if [! $oldentry == $ipinfo]
then
curl https://$user:$password@dyndns.strato.com/nic/update?hostname=$host&myip=$ipinfo
echo "$host status update complete"
else
exit 0
fi


