#!/bin/bash
 DATE=$(/bin/date | /usr/bin/tr  " " "-" | /bin/cut -f 2,4,5,7 -d "-") 
 echo Starting expect script with output to  $DATE.txt
/home/ericsson/debug/deb-tunnel-tanet.tcl > /home/ericsson/debug/tanet-tunnel-debug/$DATE.txt    
