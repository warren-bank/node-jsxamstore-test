@echo off

call "%~dp0.\env.bat"

set url="https://github.com/lochidev/Expandroid/releases/download/v6.9.1/com.dingleinc.texttoolspro-armeabi-v7a.apk"
set dir="%~dp0..\data\01-apk"

wget --no-check-certificate -nv -nc -P %dir% %url%

echo.
pause
