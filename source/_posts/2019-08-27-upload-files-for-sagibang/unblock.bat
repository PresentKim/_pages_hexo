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
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "�ڵ� ����" /t REG_SZ /d "�ڵ� ����" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "�� ����" /t REG_SZ /d "�� ����" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "���� �� ���" /t REG_SZ /d "���� �� ���" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "���콺" /t REG_SZ /d "���콺" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "Ű����" /t REG_SZ /d "Ű����" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "�Ҹ�" /t REG_SZ /d "�Ҹ�" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "Windows Defender" /t REG_SZ /d "Windows Defender" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "���� ���� �� ����" /t REG_SZ /d "���� ���� �� ����" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "���� �ɼ�" /t REG_SZ /d "���� �ɼ�" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "��ȭ �� ��" /t REG_SZ /d "��ȭ �� ��" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "��¥ �� �ð�" /t REG_SZ /d "��¥ �� �ð�" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "����� ����" /t REG_SZ /d "����� ����" /f
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl /v "��Ʈ��ũ ����" /t REG_SZ /d "��Ʈ��ũ ����" /f
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
