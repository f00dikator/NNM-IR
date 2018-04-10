#!/bin/sh

script_dir=/opt/pvs/var/pvs/scripts/
plugin_dir=/opt/pvs/var/pvs/plugins/
bin_location=/opt/pvs/bin/pvs-proxy

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


sudo ps auxww | awk '/pvs/ {print "kill -9 " $2}' | sh

sudo cp *.inc $script_dir 
sudo cp *.pasl $script_dir
sudo cp *.prm $plugin_dir

sudo $bin_location & 


