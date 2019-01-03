Exim4 server for relaying to Amazon SES

Environment variables:

- EXIM_LOCALINTERFACE (defaults to 0.0.0.0)
- EXIM_DOMAIN
- EXIM_ALLOWED_SENDERS
- EXIM_SMARTHOST
- SES_SMTP_USER - Amazon SES SMTP username
- SES_SMTP_PASS - Amazon SES SMTP password

Borrowed some logging and startup code from [miracle2k](https://github.com/miracle2k/dockerfiles/tree/master/exim-sender) - thanks! :)
