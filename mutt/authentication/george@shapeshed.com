set imap_user = "george@shapeshed.com"
source "gpg -dq ~/.mutt/authentication/shapeshed.com.gpg |"
