#!/usr/bin/env bash

EMAILS_FILE=./emails
APPS_FILE=./apps

IFS=$'\n' read -d '' -r -a emails < ${EMAILS_FILE}
IFS=$'\n' read -d '' -r -a apps < ${APPS_FILE}

for email in "${emails[@]}"
do
  for app in "${apps[@]}"
  do
    heroku access:add ${email} -a ${app}
  done
done
