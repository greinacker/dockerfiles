if [ ! -z "$CRON_EMAIL_RECIP" ]
then
  printf '%s\n%s\n' "MAILTO=${CRON_EMAIL_RECIP}" "$(cat /etc/crontabs/root)" > /etc/crontabs/root
  echo "root=${CRON_EMAIL_RECIP}" > /etc/ssmtp/ssmtp.conf
  echo "mailhub=${SMTP_SERVER}" >> /etc/ssmtp/ssmtp.conf
  echo "hostname=${HOSTNAME}.${MAIL_FROM_DOMAIN}" >> /etc/ssmtp/ssmtp.conf
  echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf
fi

echo "" >> /root/.s3cfg
echo "access_key=${AWS_ACCESS_KEY}" >> /root/.s3cfg
echo "secret_key=${AWS_SECRET_KEY}" >> /root/.s3cfg

echo "#!/bin/sh" > /etc/periodic/daily/scheduled-backup-daily
echo "cd /work" >> /etc/periodic/daily/scheduled-backup-daily
echo "${DAILY_SCRIPT}" >> /etc/periodic/daily/scheduled-backup-daily
chmod +x /etc/periodic/daily/scheduled-backup-daily

crond -l 8 -f
