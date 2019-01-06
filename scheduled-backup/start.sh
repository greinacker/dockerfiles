echo "" >> /root/.s3cfg
echo "access_key=${AWS_ACCESS_KEY}" >> /root/.s3cfg
echo "secret_key=${AWS_SECRET_KEY}" >> /root/.s3cfg

echo "#!/bin/sh" > /etc/periodic/daily/scheduled-backup-daily
echo "cd /work" >> /etc/periodic/daily/scheduled-backup-daily
echo "sh ${DAILY_SCRIPT}" >> /etc/periodic/daily/scheduled-backup-daily
chmod +x /etc/periodic/daily/scheduled-backup-daily

crond -l 8 -f
