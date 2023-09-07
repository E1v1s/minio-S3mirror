# minio-backup

env variables you should know:

Vars with source used to create source allias
mc alias set $SOURCE_ALIAS_NAME $SOURCE_ENDPOINT $SOURCE_ACCESS_KEY $SOURCE_SECRET_KEY

SOURCE_ALIAS_NAME
SOURCE_ENDPOINT
SOURCE_ACCESS_KEY
SOURCE_SECRET_KEY

Vars with destination used to create source allias
mc alias set $DESTINATION_ALIAS_NAME $DESTINATION_ENDPOINT $DESTINATION_ACCESS_KEY $DESTINATION_SECRET_KEY

DESTINATION_ALIAS_NAME
DESTINATION_ENDPOINT
DESTINATION_ACCESS_KEY
DESTINATION_SECRET_KEY

This var we plan to use pereodically to sync source with destination ( with --remove arg)
https://min.io/docs/minio/linux/reference/minio-mc/mc-mirror.html#mc.mirror.-remove
EXTRA_ARG
