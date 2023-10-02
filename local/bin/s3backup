#!/bin/bash   

# This relies on Ruby and s3sync http://s3sync.net/
# It pushes to an Amazon S3 repository for a cheap, easy off site backup
# Put this in a cron and forget about it

ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude=".DS_Store$" --delete --progress /Users/george/documents/accounts george-mbp:/accounts
ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude=".DS_Store$" --delete --progress /Users/george/documents/clients george-mbp:/clients
ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude=".DS_Store$" --delete --progress /Users/george/documents/commercial george-mbp:/commercial
ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude=".DS_Store$" --delete --progress /Users/george/documents/icons george-mbp:/icons
ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude=".DS_Store$" --delete --progress /Users/george/documents/knowledge george-mbp:/knowledge
ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude=".DS_Store$" --delete --progress /Users/george/documents/potential_clients george-mbp:/potential_clients
ruby /Users/george/s3sync/s3sync.rb -r -s -v --exclude="cache$|captchas$" --delete --progress /Users/george/Sites george-mbp:/sites 

echo All Done. Time for Bed. 
