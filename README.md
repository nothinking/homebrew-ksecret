# k8s secret 관련 Hombrew 헬퍼 스크립트

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
# 모든 네임스페이스에서 시크릿 삭제하기
ksecret delete -n <secret name>
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

## 로컬에서 테스트 및 검증

1. 포뮬러를 직접 설치하여 동작을 확인합니다.
   ```sh
   brew install --build-from-source ./ksecret.rb
   ```
2. 포뮬러 문법 및 스타일을 체크합니다.
   - 먼저 tap을 추가합니다(최초 1회만 필요).
     ```sh
     brew tap nothinking/ksecret
     ```
   - 그 다음, 포뮬러 이름으로 audit을 실행합니다.
     ```sh
     brew audit --strict ksecret
     ```
3. 빌드 및 설치 테스트를 진행합니다.
   ```sh
   brew test ./ksecret.rb
   ```

위 과정을 통해 실제로 설치와 동작, 포뮬러 규칙 준수 여부를 모두 확인할 수 있습니다.
