set imap_user = "george@shapeshed.com"
set imap_pass = `pass show email/tokens/shapeshed.com`
