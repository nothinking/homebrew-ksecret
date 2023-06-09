#!/bin/bash

SECRET_NAME=$1
if [ -z "$SECRET_NAME" ] 
then
    echo "secret 을 입력해 주세요.($0 [secret name])";
    exit 0;
fi

kubectl get secret -A | grep $SECRET_NAME