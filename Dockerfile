# Use a Debian Image
FROM arm32v7/debian:stretch-slim

#ARM Support
COPY qemu-arm-static /usr/bin

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install rsync and opsenssh
RUN apt install openssh-client rsync cron curl sed -y

# Create Volume for Certs
VOLUME ["/root/.ssh/"]
# Create Volume for Backup Folder
VOLUME ["/var/backup/"]

# Enviroment to describe the server from which you want to make an update
ENV SERVER_ADDRESS="localhost"
ENV PORT="22"

# Environment to describe the https hook address for slack
ENV SLACK_HOOK=""

#Copy Cronjob File into Container
COPY cronjob /etc/cron.d/cronjob

#Copy Cronscript File into Container
COPY cronscript /root/cronScript.sh

#Copy Cronscript File into Container
COPY startUp.sh /root/startUp.sh

#Add Executable right to startUp.sh
RUN chmod +x /root/startUp.sh

# Set Entrypoint for Cron Deamon
ENTRYPOINT ["/root/startUp.sh"]

#Start cron deamon
CMD ["cron"]
