#!/bin/bash
#
# This script will load the AWS credential to ENV VARS to be able to be available during calls to $AWS_ACCESS_KEY_ID and $AWS_SECRET_KEY


export AWS_ACCESS_KEY_ID=`cat ~/.aws/credentials | grep aws_access_key_id |sed 's/^.* * //'`
export AWS_SECRET_ACCESS_KEY=`cat ~/.aws/credentials | grep aws_secret_access_key |sed 's/^.* * //'`
export AWS_SESSION_TOKEN=`cat ~/.aws/credentials | grep aws_session_token |sed 's/^.* * //'`

echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_SESSION_TOKEN
