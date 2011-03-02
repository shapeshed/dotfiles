set imap_user = "george@shapeshed.com"
source "gpg -dq ~/.mutt/authentication/imap.gmail.com.gpg |"
