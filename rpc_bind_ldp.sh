#!sh

#customer support case 
#rpc_bind takes random port, 1 time of 600-800 it takes 646 port so LDP process cannot start 
#task -  reproduce issue, verify fix is ok 
#kill ldp procees, restart rpc, check if rpc took ldp port 

i=0
j=1024
port=0
bad_port=646
process_rpc_bind=0
ldp_PID=0
rpc_PID=0

while [ $i -le $j ]
do
i=$(($i+1))

sleep 2 

port=$(netstat -apn | grep -i rpc | grep -v LISTEN | grep -v ":::" | awk '{print $4}'| awk -F'[^0-9]*' '$0=$5' | grep -v 111)

echo i = $i
echo rcpbind port= $port

if [ $port = 646 ]
then
echo Match - RPC uses 646 port 
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~
fi



ldp_PID=$(netstat -apn| grep -i ldp | grep -v LISTEN| grep -v DGRAM | awk '{print $6}' | grep -o -m 1 '[0-9]\+')
echo ldp_PID=$ldp_PID


if [ -n "$ldp_PID" ]
then
echo Ldp is running kill it
kill -9 $ldp_PID
fi



echo rpc_PID=$rpc_PID
rpc_PID=$(netstat -apn| grep -i rpc | grep -v LISTEN| awk '{print $6}' | grep -o -m 1 '[0-9]\+')


if [ -n "$rpc_PID" ]
then
echo rpc is running kill it
kill -9 $rpc_PID
fi

done
