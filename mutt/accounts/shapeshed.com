
source ~/.mutt/authentication/george@shapeshed.com                 
source ~/.mutt/colors/mutt-colors-solarized-dark-16.muttrc                

set pgp_sign_as="george@shapeshed.com"

set query_command="/usr/local/bin/lbdbq '%s'"

set signature = "~/.mutt/signatures/shapeshed.com.txt"
set header_cache =~/.mutt/cache/shapeshed/headers
set message_cachedir =~/.mutt/cache/shapeshed/bodies
set certificate_file =~/.mutt/certificates

set sendmail="/usr/local/bin/msmtp -a shapeshed"
set envelope_from = "yes"

set sort=threads 
set sort_browser=reverse-date 
set sort_aux=last-date-received 
set folder = "imaps://imap.gmail.com:993"
set realname="George Ornbo"
set from="george@shapeshed.com"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = /dev/null
set trash = "+[Gmail]/All Mail"

