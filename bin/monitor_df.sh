#!/bin/bash
# File: monitor_df.sh
# Description: Monitors disk usage and sends an email if limit reached
#
# Adapted from http://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html
#
# Copyright 2009 George Ornbo (Shape Shed)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Run this as a cron with something like
# 0 * * * * /home/user/bin/monitor_df.sh > /dev/null
#
 
# Set these variables
EMAIL=change.this.to@youremail.com
PERCENTAGE=90 # The disk usage level at which to send the email
 
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read OUTPUT;
do
USEP=$(echo $OUTPUT | awk '{ print $1}' | cut -d'%' -f1 )
  PARTITION=$(echo $OUTPUT | awk '{ print $2 }' )
  if [ $USEP -ge $PERCENTAGE ]; then
echo "Running out of space \"$PARTITION ($USEP%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $USEP%" $EMAIL
  fi
done
