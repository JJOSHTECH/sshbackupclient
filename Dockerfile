# Use a Debian Image
FROM arm32v7/debian:latest

#ARM Support
COPY qemu-arm-static /usr/bin

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install rsync and opsenssh
RUN apt install openssh-client rsync cron curl -y

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
COPY cronscript /home/cronscript

#Add Executable right to cronscript
RUN chmod +x /home/cronscript

#Include cronjob into crontab
RUN crontab /etc/cron.d/cronjob

# Start SSH Server in Debug mode
CMD ["cron","-f"]
