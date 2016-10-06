#!/bin/bash
 DATE=$(/bin/date | /usr/bin/tr  " " "-" | /bin/cut -f 2,4,5,7 -d "-") 


/usr/sbin/tcpdump -X -s 1600 -n -i eth2  -w  /home/ericsson/debug/tcpdump/$DATE.pcap &
#/usr/sbin/tcpdump -X -s 1600 -n -i eth2 'port 500 or port 4500' -w  /home/ericsson/debug/tcpdump/$DATE.pcap &
pid=$!
sleep 890s 
kill $pid
