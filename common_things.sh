#Common things required for Icinga2]

OK=0
WARNING=1
CRITICAL=2
UNKNOWN=3

debug_flag=0
debug_file=/dev/null

debug () #for printing a debug msg in the right way to the debug log
{
	echo $(date) $1 >> $debug_file
}
