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
