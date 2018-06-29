#!/bin/bash -x
export AWS_SDK_LOAD_CONFIG=1
aws_set_cli() {
    echo ""
    echo "AWS Cli - Setting environment..."
    echo ""
    read -p "AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
    export AWS_ACCESS_KEY_ID

    read -s -p "AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY

    echo ""
    echo ""
    echo "AWS Cli :: Access Key ID" ${AWS_ACCESS_KEY_ID} " - environment set!"
    echo ""
}
alias aws_unset_cli='unset AWS_ACCESS_KEY_ID && unset AWS_SECRET_ACCESS_KEY'

aws_set_climfa() {
    echo ""
    echo "AWS MFA Cli - Setting environment..."
    echo ""
    read -p "AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
    export AWS_ACCESS_KEY_ID

    read -s -p "AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY

    echo ""
    read -s -p "AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN
    export AWS_SESSION_TOKEN

    echo ""
    echo ""
    echo "AWS Cli :: Access Key ID" ${AWS_ACCESS_KEY_ID} " - environment set!"
    echo ""
}
alias aws_unset_climfa='unset AWS_ACCESS_KEY_ID && unset AWS_SECRET_ACCESS_KEY && unset AWS_SESSION_TOKEN'

aws_assumerole_sec_dev() {
    aws_unset_climfa
    AWS_AROLE_FILE='aws-arole.tmp'

    aws_set_cli
    read -p "Insert MFA Token: " TOKEN_CODE
    echo ""
    echo "[*] AWS STS assuming role operation for <talkdesk-sec-dev-switchrole-sec>..."
    aws sts assume-role --role-arn arn:aws:iam::575338236022:role/talkdesk-sec-dev-switchrole-sec --role-session-name terraform-aws-sec-dev --token-code ${TOKEN_CODE} --serial-number arn:aws:iam::774632624673:mfa/andre.bacao > ${AWS_AROLE_FILE}

    echo "[*] Cleaning up environment..."
    aws_unset_climfa

    echo "[*] Setting up env vars..."
    export AWS_ACCESS_KEY_ID=`cat ${AWS_AROLE_FILE} | jq '.Credentials.AccessKeyId' | cut -f 2 -d \"`
    export AWS_SECRET_ACCESS_KEY=`cat ${AWS_AROLE_FILE} | jq '.Credentials.SecretAccessKey' | cut -f 2 -d \"`
    export AWS_SESSION_TOKEN=`cat ${AWS_AROLE_FILE} | jq '.Credentials.SessionToken' | cut -f 2 -d \"`
    export TOKEN_CODE

    echo ""
    echo "Done!"
    echo ""

#    rm ${AWS_AROLE_FILE}
}
