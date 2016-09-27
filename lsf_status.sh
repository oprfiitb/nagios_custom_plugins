#!/usr/bin/env bash
#A plugin to check the status of lsf_daemons
debug_flag=1

command_location="/lsf/share/10.1/linux3.10-glibc2.17-ppc64le/etc/"
output=`$command_location/lsf_daemons status`
exit_status=`echo $?`
count=`echo "$output"|grep -c "is running..."`

[ $debug_flag -eq 0 ] && echo "exit status is ", $exit_status
[ $debug_flag -eq 0 ] && echo "count is ", $count

if [ $count = "3" ] && [ $exit_status = "0" ]
then
	echo "$output"
	echo "Status : OK"
	exit 0
else
	echo "$output"
	echo "Status : Critical"
	exit 2
fi
