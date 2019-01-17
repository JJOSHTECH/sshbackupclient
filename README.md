# JJOSHTECH/sshbackupclient
This is the Client Docker Container for JJOSHTECH/sshbackupserver.

# Tags

There are two tags, both are always the latest Version of the image:
    - latest
    - armhf
    
## latest

Latest is build for AMD and Intel Architecture Hosts.

## armhf

armhf is build for ARM Architcture Hosts.

# Volumes

To Connect to the Client you have to define two Volumes:
    - /root/.ssh/
    - /etc/ssh/
    
To store your Files you want to Backup define the Volume:
    - /var/backup/

# Environment

There are three Environment Variables you can set:
    - SERVER_ADDRESS
    - PORT
    - SLACK_HOOK

# Connecting to server

To establish the Server connection you need to create certificates for your client or copy the certs you made for the Server into /etc/ssh/.
And add the public Key into authorized_keyz and known_hosts file in /root/.ssh/ . After that it should run.
