source ~/.mutt/authentication/george@shapeshed.com                 
source ~/.mutt/colors/mutt-colors-solarized-dark-256.muttrc

set pgp_sign_as     =   "george@shapeshed.com"
set crypt_autosign
set signature       =   "~/.mutt/signatures/shapeshed.com.txt"
set header_cache    =   ~/.mutt/cache/shapeshed/headers
set message_cachedir =  ~/.mutt/cache/shapeshed/bodies
set certificate_file =  ~/.mutt/certificates
set sendmail        =   "/usr/bin/msmtp -a shapeshed"
set envelope_from   =   "yes"
set sort            =   reverse-threads
set sort_aux        =   last-date-received
set folder          =   "imaps://imap.gmail.com:993"
set realname        =   "George Ornbo"
set from            =   "george@shapeshed.com"
set spoolfile       =   "+INBOX"
set postponed       =   "+[Gmail]/Drafts"
set record          =   /dev/null
set move            =   no
set include
set auto_tag        =   yes
set beep_new
set editor          =   "vim -c 'set spell spelllang=en_gb'"

hdr_order Date From To Cc
bind editor ^T complete
bind editor <space> noop

bind pager v view-attachments
bind pager j next-line
bind pager k previous-line
bind pager q exit

