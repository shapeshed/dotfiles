set imap_user = "george@pebbleit.com"
source "gpg -dq ~/.mutt/authentication/mail.pebbleit.com.gpg |"
set sendmail  = "/usr/local/bin/msmtp"
set envelope_from = "yes"
