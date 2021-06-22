#!/bin/bash 
ipinfo=$(curl ifconfig.co/ip)

# Please add your username, password and host you want to update in the next lines.
# then just execute the script to update the ip. 

user=
password=
host=
echo "....."
echo "meine ip"
echo "$ipinfo" 

curl https://$user:$password@dyndns.strato.com/nic/update?hostname=$host&myip=$ipinfo
echo "$host status update complete"
