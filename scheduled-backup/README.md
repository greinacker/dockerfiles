Runs cron to schedule daily jobs, primarily intended for backups to S3. Includes installed and configured s3cmd, as well as mysql-client.

Environment variables:

- AWS_ACCESS_KEY (if using S3)
- AWS_SECRET_KEY (if using S3)
- DAILY_SCRIPT - script to be executed on a daily basis, starting in the working directory /work. Note this is the actual script, not a filename of a script.

Additional environment variables may be specified if they are needed for the daily script; for example, we may need to pass in a MYSQL_ROOT_PASSWORD or similar. If the script uses env variables, the $ must be $$ when used in a compose file.

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
       DAILY_SCRIPT: |
         env
         date
         echo $$HOSTNAME
       AWS_ACCESS_KEY: <key>
       AWS_SECRET_KEY: <key>
       MYSQL_ROOT_PASSWORD: <password>
```
