#!/bin/sh

. /etc/rc.subr

name="master_inet"
rcvar=`set_rcvar`
start_cmd="master_inet_start"
stop_cmd="master_inet_stop"

master_inet_enable=${master_inet_enable:-"NO"}
load_rc_config $name

test="1.1.1.1"

change_router()
{
        echo change to $1
        /sbin/route delete default
        /sbin/route add default $1
}

test_channel()
{
        /sbin/route -q delete $test >/dev/null 2>&1
        /sbin/route -q add $test $1
        /sbin/ping -c 1 $test >/dev/null 2>&1
        if [ $? -eq 0 ]; then
                if [ "${current_router}" != "${1}" ]; then
                        change_router $1
                fi
                /sbin/route -q delete $test >/dev/null 2>&1
                exit
        fi
}

if checkyesno master_inet_enable && [ "${master_router}" != "" ]; then
        current_router=` netstat -nr | grep default | awk '{print $2}' `
        test_channel $master_router
        test_channel $slave_router
fi
