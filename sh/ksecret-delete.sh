#!/bin/bash

# 파라메터 받기
while getopts n: flag
do
    case "${flag}" in
        n) SECRET_NAME=${OPTARG};;
    esac
done

# 파라메터 검증
if [ -z "$SECRET_NAME" ]
then
  echo "사용법 : $0 -n {시크릿 이름}"
  exit 1
fi

# 진행여부 확인
read -p "$SECRET_NAME 시크릿을 모든 네임스페이스에서 삭제하시겠습니까?(Y|y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "$SECRET_NAME 시크릿 삭제를 시작합니다."
else
  echo "$SECRET_NAME 시크릿 삭제를 취소합니다."
  exit 1
fi

# 시크릿 삭제 시작
NAMESPACES=$(kubectl get namespace | awk '{print $1}' | tail -n +2)
echo "Delete Secret : $SECRET_NAME"

for NAMESPACE in $NAMESPACES
do
  echo "Check : $NAMESPACE"
  HAS_SECRET=$(kubectl get secret "$SECRET_NAME" -n "$NAMESPACE" --ignore-not-found)
  if [ -n "$HAS_SECRET" ]
  then
    echo "Delete namespace : $NAMESPACE"
    echo "kubectl delete secret \"$SECRET_NAME\" -n \"$NAMESPACE\""
    kubectl delete secret "$SECRET_NAME" -n "$NAMESPACE"
  fi
done 