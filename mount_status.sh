#!/usr/bin/env bash
# A script to check whether volumes are mounted with volume_name and filesystem_type as iinput variables

#FOR debugging
custom_plugin_dir=`dirname $0`
source $custom_plugin_dir/common_things.sh
debug_flag=0
debug_file=/dev/null

volume_name=$1
[ $debug_flag -eq 0 ] && debug $volume_name
filesystem_type=$2 
[ $debug_flag -eq 0 ] && debug $filesystem_type
grep_output=`mount | grep -e $volume_name | grep -e $filesystem_type`
exit_status=`echo  $?`
[ $debug_flag -eq 0 ] && debug $grep_output
[ $debug_flag -eq 0 ] && debug $exit_status

if [ $exit_status = "0" ]
then
	echo "$volume_name : is mounted"
	exit $OK
else
	echo "Critical Error."
	exit $CRITICAL
fi
