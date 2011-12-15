################################
#!/usr/bin/env bash
# File: twit_twurl.sh
# Description: Tweet from the command line using twurl & OAuth
#
# Copyright 2010 George Ornbo (Shape Shed)
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
# This script requires that you have installed and setup twurl 
# For instructions see: http://github.com/marcel/twurl
#
################################

################################
# Options             
################################
# Turn on growl notifications (requires growlnotify http://growl.info/documentation/growlnotify.php)
# Set to 1 to enable
GROWLNOTIFY=1

################################
# API URL Constant  
# Handled by twurl but listed here for clarity                
################################
TWITTER_API_URL="http://api.twitter.com/1/"

################################
# Request format
# options: json, xml                
################################
REQUEST_FORMAT=".json"

################################
# Twurl command             
################################
TWURL='twurl'

################################
# Error messages               
################################
ERROR_NO_INPUT="I didn't get a tweet so I can't post it :-( Exiting.."
ERROR_NO_METHOD="No method was supplied for the post request"
ERROR_TOO_LONG="The tweet is over 140 characters and too long"
ERROR_WRONG_NO_ARGUMENTS="The wrong number of arguments were received for this function"

################################
# Status Constants                    
################################
STATUS_UPDATE="/statuses/update"

function post_request
{
  # We are expecting two arguments
  # $1 is the API method, $2 is the string (tweet)
  if [ $# -ne 2 ] 
  then
    echo $ERROR_WRONG_NO_ARGUMENTS
    exit 1
  fi 
  
  # Check we have a method
  # TO DO: Put methods in an array and check it is in array
  if [ -z "$1" ] 
  then
    echo $ERROR_NO_METHOD
    exit 1
  fi
  
  # Check we have a tweet
  if [ -z "$2" ] 
  then
    echo $ERROR_NO_INPUT
    exit 1
  fi
  
  # Check the tweet is not too long
  if [ $(echo "$2" | wc -c) -gt 140 ]; then
    echo $ERROR_TOO_LONG
    exit 1
  fi
  
  $TWURL $1$REQUEST_FORMAT -d "status=""$2"
  
  if [ $GROWLNOTIFY == 1 ]
  then
    growlnotify -t 'Tweet Posted!' -m "$2"
  fi
}

################################
# Read user input             
################################
printf "What are you doing today?\n" 
read tweet

################################
# Send the tweet to twitter!            
################################
post_request $STATUS_UPDATE "$tweet"





