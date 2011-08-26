set imap_user = "gornbo@gmail.com"
source "gpg -dq ~/.mutt/authentication/gmail.com.gpg |"
