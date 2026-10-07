@echo off
rem SEKAS sunucusunu kapatir
for /f "tokens=*" %%I in ('powershell -NoProfile -Command "Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like '*start-server.ps1*' } | ForEach-Object { $_.ProcessId }"') do taskkill /f /pid %%I >nul 2>&1
echo SEKAS sunucusu kapatildi.
timeout /t 2 >nul
