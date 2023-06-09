#!/bin/bash

# 파라메터 받기
while getopts n:k:c: flag
do
    case "${flag}" in
        n) SECRET_NAME=${OPTARG};;
        k) SECRET_KEY=${OPTARG};;
        c) SECRET_CERT=${OPTARG};;
    esac
done

# 파라메터 검증
if [ -z "$SECRET_NAME" ] || [ -z "$SECRET_KEY" ] || [ -z "$SECRET_CERT" ]
then
  echo "사용법 : $0 -n {시크릿 이름} -k {인증서 key} -c {인증서 cert}"
  exit 1
fi

# 진행여부 확인
read -p "$1 인증서를 갱신하시겠습니까?(Y|y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "$1 인증서 갱신을 시작합니다."
else
  echo "$1 인증서 갱신을 취소합니다."
  exit 1
fi

# 인증서 갱신 시작
NAMESPACES=$(kubectl get namespace | awk '{print $1}' | tail -n +2)
echo "Update Secret : $SECRET_NAME"

for NAMESPACE in $NAMESPACES
do
  echo "Check : $NAMESPACE"
  HAS_SECRET=$(kubectl get secret "$SECRET_NAME" -n "$NAMESPACE" --ignore-not-found)
  if [ -n "$HAS_SECRET" ]
  then
    echo "Update namespace : $NAMESPACE"
    echo "kubectl create secret tls "$SECRET_NAME" --key "$SECRET_KEY" --cert "$SECRET_CERT" -n "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f-"
    kubectl create secret tls "$SECRET_NAME" --key "$SECRET_KEY" --cert "$SECRET_CERT" -n "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f-
  fi
done