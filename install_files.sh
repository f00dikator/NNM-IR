#!/bin/sh

script_dir=/opt/pvs/var/pvs/scripts/
plugin_dir=/opt/pvs/var/pvs/plugins/
bin_location=/opt/pvs/bin/pvs-proxy
pvs_binary=/opt/pvs/bin/pvs

if [ ! -d $script_dir ]
then echo "Could not stat $script_dir . Exiting"
exit
fi

if [ ! -d $plugin_dir ]
then echo "Could not stat $plugin_dir . Exiting"
exit
fi

if [ ! -f $bin_location ]
then echo "Could not stat $bin_location . Exiting"
exit
fi

if [ ! -f $pvs_binary ]
then echo "Could not stat $pvs_binary . Exiting"
exit
fi

# Ensure realtime logging is enabled
$pvs_binary --config "Log Realtime Events To Realtime Log File" 1

# kill all running pvs processes
ps auxww | awk '/pvs/ {print "kill -9 " $2}' | sh

cp *.inc $script_dir 
cp *.pasl $script_dir
cp *.prm $plugin_dir

$bin_location & 


