@echo off
setlocal
color 1a
goto rest

:rest
cls

:enable
taskkill /f /im explorer.exe
echo Option Explicit > %temp%\a.vbs
echo Dim styles, WSHShell, regs >> %temp%\a.vbs
echo Set WSHShell = WScript.CreateObject("WScript.Shell") >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "0", styles  >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "0", styles >> %temp%\a.vbs
wscript %temp%\a.vbs

reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f

del /f /q /a %temp%\a.vbs
start explorer.exe
cls

ping 127.0.0.1 -n 2 > nul
goto logoff

:disable
taskkill /f /im explorer.exe
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v HonorAutoRunSetting /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoControlPanel /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v DisallowCpl /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 67108859 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDrives /t REG_DWORD /d 1 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "자동 실행" /t REG_SZ /d "자동 실행" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "색 관리" /t REG_SZ /d "색 관리" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "국가 및 언어" /t REG_SZ /d "국가 및 언어" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "마우스" /t REG_SZ /d "마우스" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "키보드" /t REG_SZ /d "키보드" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "소리" /t REG_SZ /d "소리" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "Windows Defender" /t REG_SZ /d "Windows Defender" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "성능 정보 및 도구" /t REG_SZ /d "성능 정보 및 도구" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "전원 옵션" /t REG_SZ /d "전원 옵션" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "전화 및 모뎀" /t REG_SZ /d "전화 및 모뎀" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "날짜 및 시간" /t REG_SZ /d "날짜 및 시간" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "사용자 계정" /t REG_SZ /d "사용자 계정" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "네트워크 연결" /t REG_SZ /d "네트워크 연결" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun /v "11" /t REG_SZ /d "mmc.exe" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /t REG_BINARY /d 00000000000000000300000000005be000005ce000000000 /f

echo Option Explicit > %temp%\a.vbs
echo Dim styles, WSHShell, regs >> %temp%\a.vbs
echo Set WSHShell = WScript.CreateObject("WScript.Shell") >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "1", styles  >> %temp%\a.vbs
echo regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" >> %temp%\a.vbs
echo styles = "REG_DWORD" >> %temp%\a.vbs
echo WSHShell.RegWrite regs, "1", styles >> %temp%\a.vbs
wscript %temp%\a.vbs
del /f /q /a %temp%\a.vbs

start explorer.exe
cls

:exit
del /f /q /a %temp%\a.vbs
exit
