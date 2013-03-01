#!/bin/sh
daysago=0
maxdays=356
IFS="
"
while :;
do
        optimisef=/tmp/optimise.${TODAY}
        TODAY=`date +%Y%m%d`
        chmod -R 777  /var/www/newznab/nzbfiles
        mydate=`date --date="${daysago} days ago" +"%Y-%m-%d"`
        echo "--------------------------------------------------------"
        echo "backfilling $group to $mydate"
        cd /var/www/newznab/misc/update_scripts
        php backfill_date.php $mydate
        php update_binaries.php
        php update_releases.php
        if [ ! -f $otimisef ] ; then
                php optimise_db.php
                touch $otimisef
        fi
        #echo "sleeping for 30 min"
        #sleep 1800
        echo "sleeping for 30 sec"
        sleep 30
        if [ $daysago -lt $maxdays ] ; then
                daysago=`expr $daysago + 1`
        else
                daysago=1
        fi
done
