set imap_user = "george@pebblecode.com"
set imap_pass = `pass show email/tokens/pebblecode.com`
