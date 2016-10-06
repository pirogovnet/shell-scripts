#!/bin/bash
/usr/bin/find /home/ericsson/debug/console-logs/  -type f -exec /bin/gzip \{\} \;

## remove older logs older 1 week 
/usr/bin/find /home/ericsson/debug/console-logs/ -mtime +7 -exec /bin/rm {} \;


##TANET tunnel
/usr/bin/find /home/ericsson/debug/tanet-tunnel-debug/  -type f -exec /bin/gzip \{\} \;

## remove older logs older 1 week
/usr/bin/find /home/ericsson/debug/tanet-tunnel-debug/ -mtime +7 -exec /bin/rm {} \;


/usr/bin/find /home/ericsson/debug/tcpdump/  -type f -exec /bin/gzip \{\} \;

/usr/bin/find /home/ericsson/debug/tcpdump/ -mtime +4 -exec /bin/rm {} \;
