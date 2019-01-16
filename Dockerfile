# Use a Debian Image
FROM arm32v7/debian:latest

#ARM Support
COPY qemu-arm-static /usr/bin

# Update and Upgrade Repo
RUN apt update && apt full-upgrade -y && apt autoremove && apt clean

# Install rsync and opsenssh
RUN apt install rsync cron -y

# Create Volume for Certs
VOLUME ["/root/.ssh/"]
# Create Volume for Backup Folder
VOLUME ["/var/backup/"]

# Enviroment to describe the server from which you want to make an update
ENV SERVER_ADDRESS="localhost"
ENV PORT="22"

# Start SSH Server in Debug mode
CMD ["cron","-f"]
