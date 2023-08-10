#!/bin/bash

# 파라메터 받기
while getopts n:s:t: flag
do
    case "${flag}" in
        n) SECRET_NAME=${OPTARG};;
        s) SOURCE_NAMESPACE=${OPTARG};;
        t) TARGET_NAMESPACE=${OPTARG};;
    esac
done

# 파라메터 검증
if [ -z "$SECRET_NAME" ] || [ -z "$SOURCE_NAMESPACE" ] || [ -z "$TARGET_NAMESPACE" ]
then
  echo "사용법 : $0 -n {시크릿 이름} -s {복사할 시크릿이 있는 네임스페이스} -t {복사할 타겟 네임스페이스}"
  exit 1
fi

echo "${SECRET_NAME} 시크릿을 복사합니다.."
kubectl get secret $SECRET_NAME -n $SOURCE_NAMESPACE -o yaml | sed "s/namespace: $SOURCE_NAMESPACE/namespace: $TARGET_NAMESPACE/g" | kubectl apply -f -


