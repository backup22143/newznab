newznab
=======

newznab related tools<br>
<ul>
<li>backfill-incremental.sh - the only script I run continuously.  This continuously backfills, inching back one day at a time while keeping pace with real time.  It stops once a day to run optimise_db.php</li>
<li>crontab.root - the jobs I run from cron rather than from within the script</li>
<li>update-releases.sh simple wrapper script that can live in a well-known path /usr/local/bin</li>
<li>update-theaters.php simple wrapper script that can live in a well-known path /usr/local/bin</li>
<li>update-tvschedule.sh simple wrapper script that can live in a well-known path /usr/local/bin</li>
<p>
<li>monitor.php - borrowed from https://github.com/jonnyboy/newznab-tmux, namely the monitoring files.  Jonnyboy's monitoring scripts are very handy.  I updated monitor.php to send me an iphone alert when the article count changes.  I only let it run once every 5 minutes.  With my backfill-incremental.sh I hear from it a few times a day.  This lets me know its still working.  You have to edit the "edit_these.sh" file to change how long it waits.  Also meant to be run in screen (not from cron)</li>
<li>prowl.pl from https://www.prowlapp.com/static/prowl.pl - this sends an alert to the prowl app on iphone/android.  You have to get your own apikey after you install the prowl app and use it with the script.</li>
<li>send_iphone_alert.sh - wrapper for prowl.pl to make it easier to call.</li>
</ul>
