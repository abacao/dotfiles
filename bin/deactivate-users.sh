#!/bin/bash

# Deactivate former employees' users in Production accounts
#
# Input: space-delimited paths to the CSV files with the users email address and
# account id. Glob patterns expanded by the shell also work.
# 
# eg. ./deactivate-users.sh fulano.csv beltrano.csv

set -e

TMPDIR="/tmp/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c32)"
OUTPUT_FILE="users.csv"
INPUT_FILES="$@"
PORT=8000

mkdir $TMPDIR
cd $TMPDIR

for file in $INPUT_FILES; do
    xsv select 'Users Email Address,Users Account ID' $file | tail -n +2 >> "$OUTPUT_FILE"
done

python3 -m http.server $PORT > /dev/null &
SERVER_PID=$!

ngrok http $PORT

kill $SERVER_PID

echo $TMPDIR

# Manually in a separate shell:
# 1. `curl https//$subdomain.ngrok.io/users.csv` and check whether the output
#    contains the expected users and format (user email, account id)
# 2. sanity check in QA: `td apps:run -e qa -a main-web -- env RABBITMQ_PUBLISHER_CONFIRMS_ENABLED=1 bundle exec rake "agents:deactivate_agents_from_csv[https://$subdomain.ngrok.io/users.csv]"`
#    logs here: https://kibana-logging.svc.talkdeskqa.com/app/kibana#/discover?_g=(filters:!())&_a=(columns:!(_source),filters:!(),index:ef229050-80b0-11e9-b067-3be21ff9c0f7,interval:auto,query:(language:kuery,query:'kubernetes.pod_name:%22xpto%22'),sort:!(timestamp,desc))
#    remember to update the "kubernetes.pod_name" value in the query to the pod name returned by td-cli
# 3. run for real: `td apps:run -e prd -a main-web -- env RABBITMQ_PUBLISHER_CONFIRMS_ENABLED=1 bundle exec rake "agents:deactivate_agents_from_csv[https://$subdomain.ngrok.io/users.csv]"`
#    logs here: https://kibana-logging.svc.talkdeskapp.com/app/kibana#/discover?_g=()&_a=(columns:!(_source),index:d45f0d40-b2b3-11e9-a2a8-8dccdf6af8b1,interval:auto,query:(language:kuery,query:'kubernetes.pod_name:%22xpto%22'),sort:!('@timestamp',desc))
#    remember to update the "kubernetes.pod_name" value in the query to the pod name returned by td-cli
