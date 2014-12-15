#!/bin/bash

set -ex # No more errors from here.

echo 'deb http://overviewer.org/debian ./' >> /etc/apt/sources.list
wget -O - http://overviewer.org/debian/overviewer.gpg.asc | sudo apt-key add -
apt-get update
apt-get install -y minecraft-overviewer awscli cloud-utils htop nginx git

# Setup the big drive
mkfs.ext4 /dev/xvdd
mkdir -m 000 /persistent
echo "/dev/xvdd /persistent auto noatime 0 0" | tee -a /etc/fstab
mount /persistent

cd /persistent

mkdir tiles
mkdir backups
mkdir overviewer
mkdir tmp

echo "server { root /persistent/tiles; }" > /etc/nginx/sites-enabled/default
service nginx restart

cd backups
git init .

wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8/1.8.jar -O /persistent/overviewer/1.8.jar
