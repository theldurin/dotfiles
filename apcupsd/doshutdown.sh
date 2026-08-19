#!/bin/bash
#
# Scans the apcupsd log for shutdown events and sends a shutdown signal to UNAS before shutting down the server

LOGFILE="/var/log/apcupsd.events"
USERNAME="root"
NAS_HOST="192.168.1.94"
SHUTDOWN="/sbin/shutdown -h +0"
HOSTNAME=`hostname`

tail -fn0 ${LOGFILE} | \
while read line ; do
	echo "$line" | grep -q "Initiating system shutdown"
	if [ $? = 0 ]
	then
		echo "UPS shutdown detected, sending signal to NAS..."
		ssh -tt -o StrictHostKeyChecking=no -l ${USERNAME} ${NAS_HOST} "${SHUTDOWN}"
		sleep 1;

		echo "Shutting down ${HOSTNAME}..."
		${SHUTDOWN}
	fi
done
