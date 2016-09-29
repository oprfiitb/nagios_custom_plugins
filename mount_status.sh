#!/usr/bin/env bash
# A script to check whether volumes are mounted with volume_name and filesystem_type as iinput variables

debug_flag=0
debug_file=/dev/null

custom_plugin_dir=`dirname $0`
source $custom_plugin_dir/common_things.sh
volume_name=$1
[ $debug_flag -eq 0 ] && echo $volume_name >> $debug_file
filesystem_type=$2 
[ $debug_flag -eq 0 ] && echo $filesystem_type >> $debug_file
grep_output=`mount | grep -e $volume_name | grep -e $filesystem_type`
exit_status=`echo  $?`
[ $debug_flag -eq 0 ] && echo $grep_output >> $debug_file
[ $debug_flag -eq 0 ] && echo $exit_status >> $debug_file

if [ $exit_status = "0" ]
then
	echo "$volume_name : is mounted"
	exit $OK
else
	echo "Critical Error."
	exit $CRITICAL
fi
