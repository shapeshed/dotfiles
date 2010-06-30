#!/bin/bash  

# A simple local backup using rsync
# Syncronises with a server on the local network over SSH

# Array of directories to be backed up
BACKUPDIRS=("/Users/george/documents/accounts"
"/Users/george/documents/clients"
"/Users/george/documents/commercial"
"/Users/george/documents/icons"
"/Users/george/documents/knowledge"
"/Users/george/documents/potential_clients")

# Destination server for backups
DESTINATION="george@bomberg.local:/mnt/dionysus"

# Logging function
function log() {
   echo "[`date +'%a %b %d %T %Y'`] [$$] $1" >> ~/bin/log/rsyncbackup.log
}

# Loop through directories and do the backup
for DIR in ${BACKUPDIRS[*]}
do
	rsync -azc -e ssh --delete $DIR $DESTINATION
	log "$DIR OK"
done



