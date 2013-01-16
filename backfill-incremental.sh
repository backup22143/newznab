#!/bin/sh

# SET THIS to how many days back you already have info for
# no harm running it for days that you already have backfilled for
# there will just be no new articles to download, but the next time 
# through the loop it will go back 24 hours more

daysago=8
IFS="
"
while :;
do
	mydate=`date --date="${daysago} days ago" +"%Y-%m-%d"`
	echo "--------------------------------------------------------"
	echo "backfilling $group to $mydate"
	cd /var/www/newznab/misc/update_scripts
	php backfill_date.php $mydate
	php update_binaries.php
	php update_releases.php
	echo "sleeping for 30 min"
	sleep 1800
	daysago=`expr $daysago + 1`
done
