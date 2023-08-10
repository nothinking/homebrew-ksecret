# k8s secret 관련 헬퍼 스크립트

## 설치 방법
```shell
brew install nothinking/ksecret/ksecret
```

## 사용 방법
```shell
# 설치된 인증서 검색
ksecret search <keyword>
# 설치된 인증서 상태 확인
ksecret status <secret name>
# 설치된 인증서 갱신하기
ksecret update -n <secret name> -c <cert> -k <key>
# 다른 네임스페이스에 설치된 인증서 복사하기
ksecret copy -n <secret name> -s <source namespace> -t <target namespace>
```

## 포뮬러 수정 방법
- 스크립트를 수정하고 github에 push 합니다.
- 새로운 버전으로 release를 해서 tar.gz 파일을 만듭니다.
- tar.gz 파일을 다운로드 합니다.
- 다운로드한 파일을 기반으로 sha256 값을 구합니다.
- ksecret.rb > sha256 값을 수정합니다.
- github에 push 합니다.
```shell
shasum -a 256 xxx.tar.gz
```
