#!/usr/bin/env bash
set -euxo pipefail

date -Ins

(
flock -n 200

echo "running borgmatic"
borgmatic
echo "backup complete"

) 200>/tmp/borgmaticlock

date -Ins
