source ~/.mutt/authentication/george@pebblecode.com                 
source ~/.mutt/colors/mutt-colors-solarized-dark-16.muttrc                

set pgp_sign_as     =   "george@pebblecode.com"
set query_command   =   "/usr/local/share/python/goobook -c /Users/george/.goobook/pebble/.goobookrc query '%s'"
set signature       =   "~/.mutt/signatures/pebblecode.com.txt"
set header_cache    =   ~/.mutt/cache/pebblecode/headers
set message_cachedir =  ~/.mutt/cache/pebblecode/bodies
set certificate_file =  ~/.mutt/certificates
set sendmail        =   "/usr/local/bin/msmtp -a pebblecode"
set envelope_from   =   "yes"
set sort            =   reverse-threads
set sort_aux        =   last-date-received
set folder          =   "imaps://imap.gmail.com:993"
set realname        =   "George Ornbo"
set from            =   "george@pebblecode.com"
set spoolfile       =   "+INBOX"
set postponed       =   "+[Gmail]/Drafts"
set record          =   /dev/null
set move            =   no
set include
set auto_tag        =   yes

hdr_order Date From To Cc
bind editor <Tab> complete-query
bind editor ^T complete
bind editor <space> noop
bind pager v view-attachments

