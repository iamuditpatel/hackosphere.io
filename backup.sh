#!/usr/bin/env bash

#Our temporary backups will be arhived in this folder
TMPBACKUP='/root/tmp/'
#Website to backup (used only for naming purposes)
SITE='hacksophere.io'
#Directory that will be archived and backed up
BACKUPDIR='/home'
#Remote Google Drive directory ID where the file will be uploaded
ID='0B-1gCFNK7CAghmxnWEJaf2l3R00'

if [ ! -d "$TMPBACKUP" ]; then
        mkdir $TMPBACKUP
fi

cd $TMPBACKUP
#Archive the directory
tar -zcf "$SITE-$(date '+%Y-%m-%d').tar.gz" $BACKUPDIR

# upload to google drive and delete the source files
drive upload "$SITE-$(date '+%Y-%m-%d').tar.gz" --parent $ID --delete

sudo chmod +x backup.sh
sudo ./backup.sh
