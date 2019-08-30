---
title: 사지방을 위한 배치 파일들
date: 2019-08-27 23:17:58
tags: file, ckir
articleID: 6
---

제 스스로가 사지방에서 사용하기 위한 배치파일들 입니다...

[register-hosts.bat](./register-hosts.bat) : 구글이나 유튜브 등 호스트 등록
[unblock.bat](./unblock.bat) : 우클릭이나 드라이브 제한 등 해제


-----

PS. 나중에 register-hosts는 정리 좀 해야합니다. 주워서 다 합쳐놓은 파일 이거든요
```batch
@echo OFF
set HOSTS=C:\Windows\System32\drivers\etc\hosts
set HOSTS_github[0]=13.229.188.59
set HOSTS_github[1]=13.250.177.223
set HOSTS_github[2]=52.74.223.119

set "i=0"

:HOSTS_github_loop
if defined HOSTS_github[%i%] (
    call echo %%HOSTS_github[%i%]%% github.com >> %HOSTS%
    set /a "i+=1"
    GOTO :HOSTS_github_loop
)
pause
```
이런식으로 정리 해야죠 뭐...
