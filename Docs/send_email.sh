#!/bin/bash

# Define email parameters
RECIPIENT="celso.eugenio@yahoo.com.br"
SENDER_NAME="Vollnet"
SENDER_ADDR="vollnet.br@gmail.com" # Must be configured in /etc/ssmtp/revaliases
SUBJECT="Automated Email Notification"
EMAIL_BODY="Hello,\n\nThis is an automated test email sent via a bash script using ssmtp.\n\nRegards,\nCI Runner"

# Create the email message in the correct format
(
    echo "To: ${RECIPIENT}"
    echo "From: ${SENDER_NAME}<${SENDER_ADDR}>"
    echo "Subject: ${SUBJECT}"
    echo "" # Empty line separates headers from body
    echo -e "${EMAIL_BODY}"
) | /usr/sbin/ssmtp -t # The -t flag parses To, Cc, and Bcc headers from the input
