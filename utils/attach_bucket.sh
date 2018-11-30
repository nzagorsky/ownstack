PASSWORD_FILE=~/.passwd-s3fs
MOUNT_PATH=/mnt/bucket

echo "$SCALEWAY_ACCESS_KEY_ID:$SCALEWAY_SECRET_ACCESS_KEY" > $PASSWORD_FILE
chmod 600 $PASSWORD_FILE

mkdir -p $MOUNT_PATH


s3fs mediaserver $MOUNT_PATH \
    -o umask=0002 \
    -o passwd_file=$PASSWORD_FILE \
    -o url=https://s3.nl-ams.scw.cloud
    # -o allow_other \
