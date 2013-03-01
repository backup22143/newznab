#!/bin/sh

# Make sure to get an API KEY from prowlapp.com, and change the -apikeyfile= flag to point to where you stored it.

if [ $# -lt 2 ] ; then
        echo "usage: $0 <eventname> <message>"
        exit 1
fi
event=$1
shift
priority=$1
shift
message="$@"
# These are alerts sounds I set on my phone so different topics have different sounds.
# 2 emergency - rezso bling
# 1 high  - four beep
# 0 normal - tweedle-dee
# -1 moderate - chime
# -2 very low - vibrate only
#
/usr/local/bin/prowl.pl -apikeyfile=/usr/local/etc/prowl-apikey.txt -application MYMSGHEADER -event "$event" -notification "$message" -priority $priority
