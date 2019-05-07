
source ~/.mutt/authentication/go@clearmatics.com                 
source ~/.mutt/colors/mutt-colors-solarized-dark-256.muttrc

set pgp_sign_as     =   "04E1DF458DA032A0"
set pgp_default_key =   "34638605FC36E53F"
set pgp_use_gpg_agent = yes
set pgp_autosign    = yes

set signature       =   "~/.mutt/signatures/clearmatics.com.txt"
set header_cache    =   ~/.mutt/cache/clearmatics/headers
set message_cachedir =  ~/.mutt/cache/clearmatics/bodies
set certificate_file =  ~/.mutt/certificates
set sendmail        =   "/usr/local/bin/msmtp-enqueue.sh"
set envelope_from   =   "yes"
set sort            =   reverse-threads
set sort_aux        =   last-date-received

set folder          =   "~/.mail/clearmatics"
set mbox            =   "+[Gmail]/.All Mail"
set spoolfile       =   "~/.mail/clearmatics/Inbox"
set mask            =   ".*" 
set timeout         =   30

# set folder        =   "imaps://imap.gmail.com:993"
# set spoolfile     =   "+INBOX"
# set record        =   /dev/null

set realname        =   "George Ornbo"
set from            =   "go@clearmatics.com"
set postponed       =   "+[Gmail]/.Drafts"
set record          =   "+[Gmail]/.Sent Mail"
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

macro index <F8> \
"<enter-command>unset wait_key<enter><shell-escape>notmuch-mutt --prompt search<enter><change-folder-readonly>`echo ${XDG_CACHE_HOME:-$HOME/.cache}/notmuch/mutt/results`<enter>" \
"notmuch: search mail"
macro index <F9> \
"<enter-command>unset wait_key<enter><pipe-message>notmuch-mutt thread<enter><change-folder-readonly>`echo ${XDG_CACHE_HOME:-$HOME/.cache}/notmuch/mutt/results`<enter><enter-command>set wait_key<enter>" \
"notmuch: reconstruct thread"
macro index <F6> \
"<enter-command>unset wait_key<enter><pipe-message>notmuch-mutt tag -inbox<enter>" \
"notmuch: remove message from inbox"

macro index t "<pipe-message>mutttotask<enter>"
