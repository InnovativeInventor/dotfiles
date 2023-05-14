#!/usr/bin/env bash
#
# This script will attempt to run borgmatic. borgmatic will only run if power
# is connected and an exclusive lock can be acquired. Otherwise the operation
# will be cancelled.

set -euxo pipefail

echo "Running backup script if power is connected. Checking power now."

if [[ $( cat /sys/class/power_supply/ACAD/online) -eq 1 ]];
then
        echo "Power is connected"
	date -Ins

	echo "Acquiring lock"

	(
	flock -n 200

	echo "Running borgmatic"
	borgmatic
	echo "Borgmatic finished; backup complete"

	) 200>/tmp/borgmaticlock


	date -Ins
	echo "Done running backup script; lock released"
else
	echo "Power is not connected; cancelling"
fi

