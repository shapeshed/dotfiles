source ~/.mutt/authentication/gornbo@gmail.com
source ~/.mutt/colors/mutt-colors-solarized-dark-16.muttrc                  

set pgp_sign_as     =   "george@gmail.com"
set signature       =   "~/.mutt/signatures/shapeshed.com.txt"
set header_cache    =   ~/.mutt/cache/pebblecode/headers
set message_cachedir =  ~/.mutt/cache/pebblecode/bodies
set certificate_file =  ~/.mutt/certificates
set sendmail        =   "/usr/local/bin/msmtp -a gmail"
set envelope_from   =   "yes"
set sort            =   reverse-threads
set sort_aux        =   last-date-received
set folder          =   "imaps://imap.gmail.com:993"
set realname        =   "George Ornbo"
set from            =   "gornbo@gmail.com"
set spoolfile       =   "+INBOX"
set postponed       =   "+[Gmail]/Drafts"
set record          =   /dev/null
set trash           =   "+[Gmail]/All Mail"
set move            =   no
set include
set auto_tag        =   yes

hdr_order Date From To Cc
bind editor <Tab> complete-query
bind editor ^T complete
bind editor <space> noop

# Gmail-style keyboard shortcuts
bind  index,pager a  group-reply
bind  index,pager c  mail       
bind  generic     x  tag-entry      #Select Conversation
bind  index       x  tag-thread     #Select Conversation
bind  pager       x  tag-message    #Select Conversation
bind  index,pager s  flag-message   #Star a message
macro index,pager +  <save-message>=[Gmail]/Important<enter><enter> "Mark as important"
macro index,pager !  <save-message>=[Gmail]/Spam<enter><enter> "Report spam"
bind  index,pager a  group-reply    #Reply all
bind  index,pager \# delete-thread  #Delete
bind  index,pager l  copy-message   #Label
bind  index,pager v  save-message   #Move to
macro index,pager I  <set-flag>O    "Mark as read"
macro index,pager U  <clear-flag>O  "Mark as unread"
macro index,pager y "<enter-command>unset trash\n <delete-message>" "Gmail archive message"
macro index,pager gl "<change-folder>"
macro index,pager gi "<change-folder>=INBOX<enter>" "Go to inbox"
macro index,pager ga "<change-folder>=[Gmail]/All Mail<enter>" "Go to all mail"
macro index,pager gs "<change-folder>=[Gmail]/Starred<enter>" "Go to starred messages"
macro index,pager gd "<change-folder>=[Gmail]/Drafts<enter>" "Go to drafts"
macro index,pager gt "<change-folder>=[Gmail]/Sent Mail<enter>" "Go to sent mail"
