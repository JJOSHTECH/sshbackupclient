#!/bin/bash

echo "#!/bin/bash" >> /root/cacheJob

env >> /root/cacheJob

/root/cronScript.sh >> /root/cacheJob

exec cron -f
