set imap_user = "george@pebblecode.com"
source "gpg -dq ~/.mutt/authentication/pebblecode.com.gpg |"
