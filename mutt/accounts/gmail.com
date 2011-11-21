source ~/.mutt/authentication/gornbo@gmail.com
source ~/.mutt/colors/mutt-colors-solarized-dark-16.muttrc                  

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
set record = /dev/null
set trash = "+[Gmail]/All Mail"

set move = no
set include
set sort = 'threads'
set auto_tag = yes
hdr_order Date From To Cc
set editor='vim + -c "set textwidth=72" -c "set wrap" -c "set nocp" -c "?^$"'

bind editor <Tab> complete-query
bind editor ^T complete
bind editor <space> noop

# Gmail-style keyboard shortcuts
macro index,pager y "<enter-command>unset trash\n <delete-message>" "Gmail archive message"
macro index,pager d "<enter-command>set trash=\"imaps://imap.googlemail.com/[Gmail]/Bin\"\n <delete-message>" "Gmail delete message"
macro index,pager gl "<change-folder>"
macro index,pager gi "<change-folder>=INBOX<enter>" "Go to inbox"
macro index,pager ga "<change-folder>=[Gmail]/All Mail<enter>" "Go to all mail"
macro index,pager gs "<change-folder>=[Gmail]/Starred<enter>" "Go to starred messages"
macro index,pager gd "<change-folder>=[Gmail]/Drafts<enter>" "Go to drafts"
macro index,pager gt "<change-folder>=[Gmail]/Sent Mail<enter>" "Go to sent mail"
