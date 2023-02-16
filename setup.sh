#!/usr/bin/env bash
PGPASSWORD="$POSTGRES_PASSWORD"
BACKUPPATH=/var/lib/postgresql/data

echo "Retrieving backup from remote source. This may take a few minutes."
pg_dump -h $POSTGRES_SOURCE_HOST -U $POSTGRES_USER -Ft $POSTGRES_DB > $BACKUPPATH/$POSTGRES_DB.tar

if [ ! -f $BACKUPPATH/$POSTGRES_DB.tar ]; then
    echo "Backup $POSTGRES_DB.tar not found!"
else
    echo "Retrieval complete. Restoring to local db instance."
    #ls /var/lib/postgresql/data/ -lh

    pg_restore -U $POSTGRES_USER -Ft -d $POSTGRES_DB < $BACKUPPATH/$POSTGRES_DB.tar

    echo "Restore complete from: " $POSTGRES_SOURCE_HOST

fi