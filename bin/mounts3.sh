#!/bin/bash

MOUNT_PATH=/mnt/s3-bucket

mkdir -p $MOUNT_PATH
s3fs $1 $MOUNT_PATH -o passwd_file=~/.passwd-s3fs
