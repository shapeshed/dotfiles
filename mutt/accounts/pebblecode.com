source ~/.mutt/authentication/george@pebblecode.com                 
source ~/.mutt/colors/ir_black.mutt                  

set pgp_sign_as="george@pebblecode.com"

set query_command="/usr/local/bin/lbdbq '%s'"

set signature = "~/.mutt/signatures/pebblecode.com.txt"
set header_cache =~/.mutt/cache/pebblecode/headers
set message_cachedir =~/.mutt/cache/pebblecode/bodies
set certificate_file =~/.mutt/certificates

set sendmail="/usr/local/bin/msmtp -a pebblecode"
set envelope_from = "yes"

set sort=threads 
set sort_browser=reverse-date 
set sort_aux=last-date-received 
set folder = "imaps://imap.gmail.com:993"
set realname="George Ornbo"
set from="george@pebblecode.com"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set trash = "+[Gmail]/All Mail"

