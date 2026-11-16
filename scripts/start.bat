@echo off
title LibreTranslate Server
echo =========================================
echo  Starting LibreTranslate (127.0.0.1:5000)
echo  Active Models: English and Hindi (en,hi)
echo =========================================

cd /d "%~dp0\.."
call .venv\Scripts\activate.bat
libretranslate --host 127.0.0.1 --port 5000 --load-only en,hi
pause
