#!/bin/bash

Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: ksecret [-h | search | status | update | copy]"
   echo "options:"
   echo "-h        Print this Help."
   echo "search    시크릿이 있는 지 확인."
   echo "status    시크릿의 유효기간 확인."
   echo "update    시크릿의 갱신."
   echo "copy      다른 네임스페이스의 시크릿을 복사."
   echo
}

while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

METHOD=ksecret-$1
shift
$METHOD "$@"

