
source ~/.mutt/authentication/go@clearmatics.com                 
source ~/.mutt/colors/mutt-colors-solarized-dark-256.muttrc

set pgp_sign_as     =   "C8520BF2"
set signature       =   "~/.mutt/signatures/clearmatics.com.txt"
set header_cache    =   ~/.mutt/cache/clearmatics/headers
set message_cachedir =  ~/.mutt/cache/clearmatics/bodies
set certificate_file =  ~/.mutt/certificates
set sendmail        =   "/usr/bin/msmtp -a clearmatics"
set envelope_from   =   "yes"
set sort            =   reverse-threads
set sort_aux        =   last-date-received
set folder          =   "imaps://imap.gmail.com:993"
set realname        =   "George Ornbo"
set from            =   "go@clearmatics.com"
set spoolfile       =   "+INBOX"
set postponed       =   "+[Gmail]/Drafts"
set record          =   /dev/null
set move            =   no
set include
set auto_tag        =   yes
set beep_new
set editor          =   "vim -c 'set spell spelllang=en_gb'"
source "gpg --decrypt --quiet ~/.mutt/aliases/clearmatics.gpg |"
set sort_alias      =   alias
set reverse_alias   =   yes

hdr_order Date From To Cc
bind editor ^T complete
bind editor <space> noop

bind pager v view-attachments

bind pager j next-line
bind pager k previous-line
bind pager / search
bind pager ? search-reverse
bind pager n search-next
bind pager N search-opposite
bind pager gg top
bind pager G bottom
bind pager \Cd half-down
bind pager \Cu half-up

bind pager q exit
