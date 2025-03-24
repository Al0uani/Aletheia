@echo off
title Aletheia_SIGN UP
color a
mode con: cols=60 lines=20
echo.
echo "  ____ ___ ____ _   _   _   _ ____  "
echo " / ___|_ _/ ___| \ | | | | | |  _ \ "
echo " \___ \| | |  _|  \| | | | | | |_) |"
echo "  ___) | | |_| | |\  | | |_| |  __/ "
echo " |____/___\____|_| \_|  \___/|_|    "
echo.
echo. 
ping localhost -n 1 >nul
md C:\data-j
md C:\data-j\Pics
md C:\data-j\Files
md C:\data-j\Movies
md C:\drop
attrib C:\data-j +h +r +s && cacls C:\data-j  /e /c /d %username%
attrib C:\data-j\Pics +h +r +s && cacls C:\data-j\Pics  /e /c /d %username%
attrib C:\data-j\Files +h +r +s && cacls C:\data-j\Files  /e /c /d %username%
attrib C:\data-j\Movies +h +r +s && cacls C:\data-j\Movies  /e /c /d %username%
cacls C:\drop /e /c /g %username%:f && attrib C:\drop -h -r -s 
cd C:\drop
color 7
title SIGNUP
cls
set /p nuser= NEW USERNAME :
if %nuser% == "" goto signuperror
if exist %nuser%.bat goto usertaken
goto npass
:usertaken
cls
echo USERNAME taken, please try another one
pause >nul
goto signup
:npass
set /p npass= NEW PASSWORD :
if %npass% == "" goto signuperror

goto signupc
:signupc
echo set "auser=%nuser%"> %nuser%.bat
echo set "apass=%npass%"> %npass%.bat
cls 
color a
echo Signup successful!
ping localhost -n 1 >nul
attrib C:\drop +h +r +s && cacls C:\drop  /e /c /d %username%
call Aletheia.bat
del %0

