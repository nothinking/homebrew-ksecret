# Kubernetes Secret(Homebrew) 헬퍼 스크립트

## 설치 방법
```shell
brew tab nothinking/ksecret
brew install ksecret
```

## 사용 방법
```shell
# 시크릿 이름에 키워드가 포함된 시크릿 검색
ksecret search <키워드>

# 특정 시크릿 상태 확인
ksecret status -n <시크릿 이름>

# 시크릿 갱신하기 (인증서/키 파일 교체)
ksecret update -n <시크릿 이름> -c <인증서 파일> -k <키 파일>

# 다른 네임스페이스에 시크릿 복사하기
ksecret copy -n <시크릿 이름> -s <소스 네임스페이스> -t <타겟 네임스페이스>

# 모든 네임스페이스에서 시크릿 삭제하기
ksecret delete -n <시크릿 이름>
```

### 명령어 옵션 설명
- `-n`: 시크릿 이름 (필수)
- `-c`: 인증서 파일 경로 (update 시 필수)
- `-k`: 키 파일 경로 (update 시 필수)
- `-s`: 소스 네임스페이스 (copy 시 필수)
- `-t`: 타겟 네임스페이스 (copy 시 필수)

### 사용 예시
```shell
ksecret search my-cert
ksecret status -n my-cert
ksecret update -n my-cert -c ./tls.crt -k ./tls.key
ksecret copy -n my-cert -s default -t production
ksecret delete -n my-cert
```

## 포뮬러(Formula) 수정 방법
1. 스크립트(`sh/` 디렉토리 내 파일)를 수정하고 GitHub에 push합니다.
2. 새로운 버전으로 release를 생성하여 tar.gz 파일을 만듭니다.
3. tar.gz 파일을 다운로드합니다.
4. 다운로드한 파일의 sha256 값을 구합니다.
5. `ksecret.rb` 파일의 sha256 값을 수정합니다.
6. 변경사항을 GitHub에 push합니다.
7. Homebrew에서 업그레이드합니다:

```shell
brew upgrade ksecret
```

### sha256 값 생성 방법
```shell
shasum -a 256 xxx.tar.gz
```
