#!/bin/bash

echo "#!/bin/bash" >> /root/cacheJob

env >> /root/cacheJob

cat /root/cronScript.sh >> /root/cacheJob
cat /root/cacheJob > /root/cronScript.sh

#Add Executable right to cronscript
chmod +x /root/cronScript.sh

#Include cronjob into crontab
crontab /etc/cron.d/cronjob

# set cron env
COMMAND="cron -f"

# Starting Container
echo "$(date +%d.%m.%Y\ %H:%M) Starting container .."
if [ "$@" = "cron" ]; then
	echo "$(date +%d.%m.%Y\ %H:%M) Executing: ${COMMAND}"
	exec ${COMMAND}
else
	echo "$(date +%d.%m.%Y\ %H:%M) Not executing: ${COMMAND}"
	echo "$(date +%d.%m.%Y\ %H:%M) Executing: ${@}"
	exec $@
fi
