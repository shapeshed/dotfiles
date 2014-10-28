set imap_user = "gornbo@gmail.com"
set imap_pass = `pass show email/tokens/gmail.com`
