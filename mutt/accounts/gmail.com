source ~/.mutt/authentication/gornbo@gmail.com
source ~/.mutt/colors/ir_black.mutt                  

set pgp_sign_as="gornbo@gmail.com"

set query_command="/usr/local/bin/lbdbq '%s'"

set signature = "~/.mutt/signatures/shapeshed.com.txt"
set header_cache =~/.mutt/cache/gmail/headers
set message_cachedir =~/.mutt/cache/gmail/bodies
set certificate_file =~/.mutt/certificates

set sendmail="/usr/local/bin/msmtp -a gmail"
set envelope_from = "yes"

set sort=threads 
set sort_browser=reverse-date 
set sort_aux=last-date-received 
set folder = "imaps://imap.gmail.com:993"
set realname="George Ornbo"
set from="gornbo@gmail.com"
set spoolfile = "+INBOX"
set postponed = "+[Gmail]/Drafts"
set record = "+[Gmail]/Sent Mail"
set trash = "+[Gmail]/All Mail"

