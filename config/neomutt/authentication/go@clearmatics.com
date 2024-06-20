set imap_user = "go@clearmatics.com"
set imap_pass = `pass show email/tokens/clearmatics.com`
