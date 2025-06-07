@echo off
powershell -NoProfile -ExecutionPolicy Bypass -NoExit -Command "& { $path = '%~dp0Restart-I2CHIDAndSendKey.ps1'; $s = Get-Content -Raw -LiteralPath $path -Encoding UTF8; Invoke-Expression $s }"
pause
