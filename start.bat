@echo off
rem SEKAS baslatici: sunucuyu arka planda calistirir, oyunu Chrome'da acar (yoksa varsayilan tarayicida)
setlocal
cd /d "%~dp0"
set PORT=8765
set URL=http://localhost:%PORT%/index.html

rem Sunucu arka planda, gizli pencerede
start "" /b powershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0start-server.ps1" -Port %PORT%
timeout /t 2 /nobreak >nul

rem Once Chrome'u dene
set CHROME=
for %%P in ("%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%LocalAppData%\Google\Chrome\Application\chrome.exe") do (
  if exist %%P set CHROME=%%~P
)
if not defined CHROME (
  for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe" /ve 2^>nul ^| find "REG_SZ"') do set CHROME=%%B
)
if defined CHROME (
  start "" "%CHROME%" "%URL%"
) else (
  rem Chrome yok: varsayilan tarayici
  start "" "%URL%"
)
endlocal
exit /b
