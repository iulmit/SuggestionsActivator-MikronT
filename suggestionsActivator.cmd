@echo off
chcp 65001

net session>nul 2>nul
if %errorLevel% GEQ 1 goto :startAsAdmin





call :logo
echo.^(^i^) Suggestions Activator is running...
>nul timeout /nobreak /t 1

echo.^(^?^) Are you sure^? ^(Enter or close^)
pause>nul





call :logo
set key1=no
set key2=00000000

:question
set /p answer=^(^?^) Turn on suggestions^? (y/n) ^> 
if "%answer%" == "y" (
  set key1=yes
  set key2=00000001
) else if "%answer%" NEQ "n" goto :question
>nul timeout /nobreak /t 1



echo.^(^i^) Updating the Windows Registry settings...
for /l %%i in (4,-1,1) do (
  reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete /v AutoSuggest         /t REG_SZ    /d %key1% /f
  reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete /v "Append Completion" /t REG_SZ    /d %key1% /f
  reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced     /v Start_TrackProgs    /t REG_DWORD /d %key2% /f
)
>nul timeout /nobreak /t 1





call :logo
echo.^(^i^) The work is completed^!
echo.
>nul timeout /nobreak /t 1

echo.^(^?^) Reload now^? ^(Enter or close^)
pause>nul

echo.^(^!^) Reboot^!
shutdown /r /t 5
>nul timeout /t 4
exit







:logo
title [MikronT] Suggestions Activator
color 0b
cls
echo.
echo.    [MikronT] ==^> Suggestions Activator
echo.
exit /b





:startAsAdmin
echo.Please, run as Admin!
>nul timeout /nobreak /t 3
exit