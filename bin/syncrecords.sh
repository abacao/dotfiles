#!/usr/bin/env bash

# validate needed bash version
if ((BASH_VERSINFO[0] < 4));
	then echo "Sorry, you need at least bash-4.0 to run this script." >&2;
	exit 1;
fi

# Add Route 53 zones (preferably Private) to the following array
declare -A ZONES=(
    [ZA9XK5HFXIKI3]=techlab
    [Z19KD4LOYL9WHU]=techlab
    [ZGU260U7UJNX2]=techlab
    [Z5LZ0MRWA15H6]=prd
)

HOSTSFILE="$HOME/.ssh/hosts"
LOGFILE="$HOME/.ssh/hosts_sync.log"

# see if we have a valid aws session
aws sts get-caller-identity  >> ${LOGFILE} 2>&1
if [ $? -ne 0 ]; then
    echo "FAILED (check $LOGFILE for more details)"
    exit
fi

mylogger() {
    echo `date +'%Y-%m-%d %H:%M:%S'` "- $@"
}

truncate --size 0 $HOSTSFILE
for zoneid in "${!ZONES[@]}"; do
    profile=${ZONES[$zoneid]}
    echo -n "Synchronizing records from zone id $zoneid ($profile)... "
    if records_json=$(aws route53 list-resource-record-sets --hosted-zone-id $zoneid --profile $profile --query "ResourceRecordSets[?Type == 'A' ]" 2>&1)
    then
        records_csv=$(echo $records_json | jq -r '.[] | [ .Name, .ResourceRecords[0]?.Value ] | @csv' | sed 's/\"//g' | sed 's/\.,/,/g')
        for pair in $records_csv
        do
            name=$(echo $pair | cut -d',' -f1)
            addr=$(echo $pair | cut -d',' -f2)
            [[ -z "$addr" ]] || echo "$name" >> $HOSTSFILE
        done
        echo "done"
    else
        echo "FAILED (check $LOGFILE for more details)"
        mylogger $records_json >> ${LOGFILE}
    fi
done
