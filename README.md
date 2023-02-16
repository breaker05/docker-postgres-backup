# docker-postgres-backup

Backup from a remote postgres db and restore to local container. Ideal for pulling from a production environment.

Run the following command to build and run after setting your environment variables.

`docker-compose --env-file .env.dev -p {profileName} up
