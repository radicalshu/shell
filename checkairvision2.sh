#!/bin/bash
#   S.w.
# to solve the airvision problem casued by timestamp
date > /tmp/date
errortime=`awk '{print $4}' /tmp/date`
error=`cat /var/log/airvision2/error.log | grep $errortime | grep "calculated timestamp differ by over 120 seconds" | wc -l`
if [  -f /var/run/airvision2/airvision2.pid ]&& error==0 ;
then
date >> /tmp/check.log
echo "airvision2 is running and everything is OK..." >> /tmp/check.log
else
date >> /tmp/check.log
echo "airvision2 or nvr is crashed!Restart now." >> /tmp/check.log
/etc/init.d/airvision2 restart >> /tmp/check.log


fi
