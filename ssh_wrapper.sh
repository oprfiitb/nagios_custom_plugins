#!/usr/bin/env bash
# This is a custome wrapper over 'check_by_ssh'. The wrapper accepts arguments from the command defined in
# /etc/icinga2/conf.d/icinga2/base_config/commands.conf. We have written this custome wrapper because we 
# were facing problems in passing arguments to a script written on a remote machine where the checks will
# get executed. This script should always reside in /usr/lib64/nagios/plugins/nagios_custom_plugins/.

# TODO
# Modify the script for accepting arguments dynamically. Count the no. of arguments that are getting passed
# and then execute them from here. 

#FOR debugging
custom_plugin_dir=`dirname $0`
source $custom_plugin_dir/common_things.sh
debug_flag=0
debug_file=/dev/null

[ $debug_flag -eq 0 ] && debug " arg0= $0 arg1= $1, arg2=$2, arg3=$3 arg4= $4 arg5= $5 arg6= $6 arg7= $7 arg8= $8 arg9= $9 "
[ $debug_flag -eq 0 ] && debug "total number of params= $#"
[ $debug_flag -eq 0 ] && debug "complete array of params is $@"

#Execute the complete command including calling the check_by_ssh plugin and telling it to call the remote command
"$@"
