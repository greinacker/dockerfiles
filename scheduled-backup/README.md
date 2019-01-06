Runs cron to schedule daily jobs, primarily intended for backups to S3. Includes installed and configured s3cmd, as well as mysql-client.

Environment variables:

- AWS_ACCESS_KEY (if using S3)
- AWS_SECRET_KEY (if using S3)
- DAILY_SCRIPT - filename for sh script to be executed on a daily basis, assumed to be in the working directory.

Additional environment variables may be specified if they are needed for the daily script; for example, we may need to pass in a MYSQL_ROOT_PASSWORD or similar.

Volumes - map the working directory to /work, for example:

`-v .:/work`

When job is executed, we will cd /work, then execute the daily script.

Example compose file snippet:

```
   backup:
     image: greinacker/scheduled-backup
     volumes:
        - .:/work
     environment:
       DAILY_SCRIPT: dobackup.sh
       AWS_ACCESS_KEY: <key>
       AWS_SECRET_KEY: <key>
       MYSQL_ROOT_PASSWORD: <password>
```
