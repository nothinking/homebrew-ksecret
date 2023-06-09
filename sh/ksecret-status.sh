#!/bin/bash

SECRET_NAME=$1
if [ -z "$SECRET_NAME" ] 
then
    echo "secret 을 입력해 주세요.($0 [secret name])";
    exit 0;
fi

if ! which kubectl
then
    echo "kubectl을 설치해 주세요."
    exit 0;
fi

kubectl get secrets $SECRET_NAME -o jsonpath="{.data.tls\.crt}" | base64 -d | openssl x509 -text | head -n 10
