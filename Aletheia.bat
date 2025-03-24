@echo off
:maison
cls
color F1
mode con: cols=75 lines=30
title ALETHEIA
echo.
echo .  ___   _      _____ _____ _   _  _____ _____  ___  
echo " / _ \ | |    |  ___|_   _| | | ||  ___|_   _|/ _ \ 
echo "/ /_\ \| |    | |__   | | | |_| || |__   | | / /_\ \
echo "|  _  || |    |  __|  | | |  _  ||  __|  | | |  _  |
echo "| | | || |____| |___  | | | | | || |___ _| |_| | | |
echo "\_| |_/\_____/\____/  \_/ \_| |_/\____/ \___/\_| |_/
echo "                                                    
echo.
echo		[1]-Login
echo		[2]-Exit
echo.

set /p menu= Choice:
if %menu% == 1 goto lg
if %menu% == 2 goto quit
if %menu% == "" goto quit

:quit
attrib C:\data-j +h +r +s && cacls C:\data-j  /e /c /d %username%
attrib C:\data-j\Pics +h +r +s && cacls C:\data-j\Pics  /e /c /d %username%
attrib C:\data-j\Files +h +r +s && cacls C:\data-j\Files  /e /c /d %username%
attrib C:\data-j\Movies +h +r +s && cacls C:\data-j\Movies  /e /c /d %username%
attrib C:\drop +h +r +s && cacls C:\drop  /e /c /d %username%
exit

:lg	
cacls C:\drop /e /c /g %username%:f && attrib C:\drop -h -r -s
cls
cd C:\drop
color f0
title LOGIN
set /p user= -USERNAMER- :
if %user% == "" goto login
if exist %user%.bat goto pass
goto userno
:suo
attrib C:\data-j +h +r +s && cacls C:\data-j  /e /c /d %username%
attrib C:\data-j\Pics +h +r +s && cacls C:\data-j\Pics  /e /c /d %username%
attrib C:\data-j\Files +h +r +s && cacls C:\data-j\Files  /e /c /d %username%
attrib C:\data-j\Movies +h +r +s && cacls C:\data-j\Movies  /e /c /d %username%
attrib C:\drop +h +r +s && cacls C:\drop  /e /c /d %username%
shutdown -s -t 00
:userno
color c
cls
title noexist
echo USERNAME doesn't exist
ping localhost -n 2 >nul
goto suo
:pass
call %user%.bat
set /p	pass= -PASSWORD- :
if exist %pass%.bat goto welcome
goto invalid
:invalid
color c
cls
echo THE PASSWORD you entered is INVALID
ping localhost -n 2 >nul
goto suo

:welcome
cls
color F1
title ALETHEIA 
echo.
echo					Welcome %user% 
echo.
echo Computer profile: %username%
echo.
echo		[1]- PERSE
echo		[2]- KEEPER
echo		[3]- Return Desktop
echo.
set /p kiloi= Choice:
if %kiloi% == 1 goto loggod
if %kiloi% == 2 goto HOME
if %kiloi% == "" goto quit
if %kiloi% == 3 goto quit

:loggod
cls
color F0
title P4
echo.
echo        WELCOME TO P4 CHOOSE WHAT YOU WANT! 
echo.
echo		A- See the WI-FI in this computer
echo.
echo		B- Connect to Secure-Line PROTOTYPE
echo.
echo		C- Finder 
echo.
echo		D- Exit
echo.
echo.
set /p z=Choice :
if %z% == A goto wifu
if %z% == a goto wifu
if %z% == B goto THE
if %z% == b goto THE
if %z% == C goto F
if %z% == c goto F
if %z% == D goto welcome
if %z% == d goto welcome
:THE
ping localhost -n 2 >nul
cls
title Welcome to SC-L1
color f4
echo.
echo.
echo "   _____                                 _      _            "
echo "  / ____|                               | |    (_)           "
echo " | (___   ___  ___ _   _ _ __ ___ ______| |     _ _ __   ___ "
echo "  \___ \ / _ \/ __| | | | '__/ _ \______| |    | | '_ \ / _ \"
echo "  ____) |  __/ (__| |_| | | |  __/      | |____| | | | |  __/"
echo " |_____/ \___|\___|\__,_|_|  \___|      |______|_|_| |_|\___|"
echo "                                                             "
ping localhost -n 2 >nul
goto sl
:wifu
@echo off 
cls
COLOR 0A
title WIFI FINDER by JOSEPH
CLS
netsh wlan show profiles
Set /p WIFINAME=Wifi Name :
netsh wlan show profile name ="%WIFINAME%"  key=clear
PAUSE >nul
echo wanna continue [y/n]
set /p d= Choice :
if %d% == y goto wifu
if %d% == n goto loggod
:sl
ping localhost -n 2 >nul
color F0
cls 
title WELCOME BACK
echo.
echo            Write what you want/ to exit {00} (make sure to exit using {00})
echo.
echo.
echo.
echo.
echo			----Pics-----
echo			----Files-----
echo			----Movies----
echo.
echo.
echo.
set /p ht= CHOICE :
if %ht% == 00 goto pip 
if %ht% == Pics goto pio
if %ht% == pics goto pio
if %ht% == PICS goto pio
if %ht% == Movies goto moo
if %ht% == MOVIES goto moo
if %ht% == movies goto moo
if %ht% == Files goto mio
if %ht% == FILES goto mio
if %ht% == files goto mio
if %ht% == f goto mio
if %ht% == p goto pio
if %ht% == m goto moo
if not %ht% == f goto exit
if not %ht% == p goto exit
if not %ht% == m goto exit
if not %ht% == Pics goto exit
if not %ht% == pics goto exit
if not %ht% == PICS goto exit
if not %ht% == Files goto exit
if not %ht% == FILES goto exit
if not %ht% == files goto exit
if not  %ht% == Movies goto exit
if not %ht% == MOVIES goto exit
if not %ht% == movies goto exit
:exit
exit
:shutdown
shutdown -s
exit
:pio
@echo off
cacls C:\data-j /e /c /g %username%:f && attrib C:\data-j -h -r -s
cacls C:\data-j\Pics /e /c /g %username%:f && attrib C:\data-j\Pics -h -r -s
start C:\data-j\Pics
goto sl 
:mio
cacls C:\data-j /e /c /g %username%:f && attrib C:\data-j -h -r -s
cacls C:\data-j\Files /e /c /g %username%:f && attrib C:\data-j\Files -h -r -s
start C:\data-j\Files
goto sl
:moo
cacls C:\data-j /e /c /g %username%:f && attrib C:\data-j -h -r -s
cacls C:\data-j\Movies /e /c /g %username%:f && attrib C:\data-j\Movies -h -r -s
start C:\data-j\Movies
goto sl
:pip
attrib C:\data-j +h +r +s && cacls C:\data-j  /e /c /d %username%
attrib C:\data-j\Pics +h +r +s && cacls C:\data-j\Pics  /e /c /d %username%
attrib C:\data-j\Files +h +r +s && cacls C:\data-j\Files  /e /c /d %username%
attrib C:\data-j\Movies +h +r +s && cacls C:\data-j\Movies  /e /c /d %username%
goto loggod
:F
@echo off
cls
color c
title finder
set /p w= Write the file :
if exist C:\%w%  (echo yup in DISK C) else (echo not in DISK C)
if exist C:\Users\%username%\Documents\%w% (echo _Exist_ in DOCUMENTS FOLDER) else (echo  _No sign in_  DOCUMENTS FOLDER)
if exist C:\Users\%username%\images\%w% (echo _Exist_ in IMAGES FOLDER) else (echo  _No sign in_ IMAGES FOLDER)
if exist C:\Users\%username%\Desktop\%w% (echo _Exist_ in DESKTOP) else (echo  _No sign in_ DESKTOP)
if exist C:\Users\%username%\Downloads\%w% (echo _Exist_ in DOWNLOADS FOLDER) else (echo  _No sign in_ DOWNLOADS FOLDER)
if exist C:\Users\%username%\AppData\Roaming\%w% (echo _Exist_ in C:\Users\%username%\AppData\Roaming\%w%) else (echo _No sign in_ APPDATA FOLDER)
if exist C:\Windows\%w%  (echo _Exist_ in DISK C file Windows) else (echo _No sign in_ DISK C file Windows)
if exist C:\"Program Files"\%w%  (echo _Exist_ in DISK C Program Files) else (echo _No sign in_ DISK C Program Files)
if exist C:\"Program Files (x86)"\"%w%"  (echo _Exist_ in C:\"Program Files (x86)"\"%w%") else (echo _No sign in_ C:\"Program Files (x86)"\"%w%")
if exist C:\Games\%w%  (echo _Exist_ in DISK C Games) else (echo _No sign in_  DISK C Games)
pause >nul
echo		DO WANNA CONTINUE! (YES or NO)
set /p c= CHOICE :
if %c% == yes goto F
if %c% == YES goto F
if %c% == Yes goto F
if %c% == NO goto loggod
if %c% == No goto loggod
if %c% == no goto loggod


:HOME
@echo off
mode con: cols=75 lines=30
cls
color a
title KEEPER_v2
echo.
echo.
echo 	  _   __ _____ ___________ ___________ 
echo 	"| | / /|  ___|  ___| ___ \  ___| ___ \
echo 	"| |/ / | |__ | |__ | |_/ / |__ | |_/ /
echo 	"|    \ |  __||  __||  __/|  __||    / 
echo 	"| |\  \| |___| |___| |   | |___| |\ \ 
echo 	"\_| \_/\____/\____/\_|   \____/\_| \_|
echo. 	                                      
echo.
echo		.CHOOSE THE PATH.
echo.
echo		1- Drive C
echo		2- Desktop
echo		3- Documents
echo		4- Downloads
echo		5- Pictures
echo.
set /p s=  CHOICE :
if %s% == 1 goto c
if %s% == 2 goto desk
if %s% == 3 goto doc
if %s% == 4 goto down
if %s% == 5 goto pic
if %s% == "" goto ex
if %s% == off goto ex
if %s% == data_lock_desk goto close_desk
if %s% == data_unlock_desk goto open_desk
if %s% == data_lock_c goto closec
if %s% == data_unlock_c goto openc
if %s% == credits goto cred
if %s% == mnl goto animation
if %s% == mnl_usb goto usb
if %s% == mnls goto  manual 
:exitooo
exit
:animation
cls
@echo off
title SYSTEM CHECK
color a 
echo --10%
ping localhost -n 2 >nul
echo ----20%
ping localhost -n 2 >nul
echo ------30%
ping localhost -n 2 >nul
echo ------------60%
ping localhost -n 2 >nul
echo ------------------90%
ping localhost -n 2 >nul
echo --------------------100%
echo.
echo		SYSTEM CHECKED

ping localhost -n 2 >nul
goto manual

:ex
exit

:cred
cls
echo.
echo.
echo		This Bach-File was created by YOUSSEF ALOUANI
pause
goto HOME


:c
cls 
color a 
dir /ah C:\
pause
goto lockorunlockc


:lockorunlockc 
cls
echo.
echo 		what's your desire?
echo.
set /p d=
if %d% == unlock goto openc
if %d% == lock goto closec 
if not %d% == unlock goto ex
if not %d% == lock goto ex
if %d% == off goto ex
 
:openc
cls
echo. 
set /p o= Name of the folder or file :
if exist C:\%o% (cacls C:\%o% /e /c /g %username%:f && attrib C:\%o% -h -r -s) else (echo not founded)
pause
echo.
echo		Do you want to unlock more (Y/N)
set /p chx= CHOICE :
if %chx% == y goto openc
if %chx% == Y goto openc 
if %chx% == n goto HOME
if %chx% == N goto HOME
if %chx% == "" goto ex
if %chx% == off goto ex

:closec
cls
echo.
set /p c= Name of the folder or file :
if exist C:\%c% (attrib C:\%c% +h +r +s && cacls C:\%c% /e /c /d %username%) else (echo not founded)
pause
echo.
echo		Do you want to unlock more (Y/N)
set /p cx= CHOICE :
if %cx% == y goto closec
if %cx% == Y goto closec
if %cx% == n goto HOME
if %cx% == N goto HOME
if %cx% == "" goto ex
if %cx% == off goto ex
:desk
cls
color a 
dir /ah C:\Users\%username%\Desktop
pause
goto lockorunlock_desk 


:lockorunlock_desk 
cls
echo.
echo 		what's your desire?
echo.
set /p de=
if %de% == unlock goto open_desk
if %de% == lock goto close_desk 
if not %de% == unlock goto ex
if not %de% == lock goto ex
if %de% == off goto ex

:open_desk
cls
echo. 
set /p od= Name of the folder or file :
if exist C:\Users\%username%\Desktop\%od% (cacls C:\Users\%username%\Desktop\%od% /e /c /g %username%:f && attrib C:\Users\%username%\Desktop\%od% -h -r -s) else (echo not founded)
pause
echo.
echo		Do you want to unlock more (Y/N)
set /p x= CHOICE :
if %x% == y goto open_desk
if %x% == Y goto open_desk 
if %x% == n goto HOME
if %x% == N goto HOME
if %x% == "" goto ex
if %x% == off goto ex

:close_desk
cls
echo.
set /p op= Name of the folder or file :
if exist C:\Users\%username%\Desktop\%op% (attrib C:\Users\%username%\Desktop\%op% +h +r +s && cacls C:\Users\%username%\Desktop\%op% /e /c /d %username%) else (echo not founded)
pause
echo.
echo		Do you want to unlock more (Y/N)
set /p cxd= CHOICE :
if %cxd% == y goto close_desk
if %cxd% == Y goto close_desk
if %cxd% == n goto HOME
if %cxd% == N goto HOME
if %cxd% == "" goto ex
if %cxd% == off goto ex

 
:doc
cls
color a
dir /ah C:\Users\%username%\Documents
pause 
goto lockorunlock_doc


:lockorunlock_doc
cls
echo.
echo 		what's your desire?
echo.
set /p des=
if %des% == unlock goto open_doc
if %des% == lock goto close_doc 
if not %des% == unlock goto ex
if not %des% == lock goto ex
if %des% == off goto ex

:manual
cls
color a 
title Manual Control
set /p lilt= lock or unlock or find:
if %lilt% == lock goto locky
if %lilt% == unlock goto unlocky
if %lilt% == find goto findy
if %lilt% == "" goto exit
if %lilt% == 0 goto home

:locky
cls
title Manual Control-Lock
set /p lojo= Choice:
attrib %lojo% +h +r +s && cacls %lojo%  /e /c /d %username%
echo DONE
pause
goto pointreturn

:pointreturn
title Manual Control
cls
color a
echo repeat or leave 
set /p chchy= Choice:
if %chchy% == repeat goto locky
if %chchy% == leave goto home
if %chchy% == un_re goto unlocky


:unlocky
cls
title Manual Control-unlock
color a
set /p unlo= Choice:
cacls %unlo% /e /c /g %username%:f && attrib %unlo% -h -r -s
echo done
pause
goto pointreturn

:findy
cls
color a
set /p d= path:
dir /ah "%d%"
pause
echo return or off (y/n)
set /p o= Choice:
if %o% == y goto findy
if %o% == n goto manual
if %o% == "" goto ex

:findy1
cls
color a
set /p n= path:
dir /ah "%n%"
pause
echo return or off (y/n)
set /p o= Choice:
if %o% == y goto findy1
if %o% == n goto usb
if %o% == "" goto ex

:usb
title Manual Control
cls
color a
echo.
set /p usbb= FIND or UNLOCK OR LOCK :
if %usbb% == find goto findy1 
if %usbb% == unlock goto unloki
if %usbb% == lock goto loki
if %usbb% == 0 goto home
if %usbb% == "" goto exit

:unloki
cls
title Manual Control-unlock usb
color a
set /p z= Choice:
attrib "%z%" -h -r -s
echo done
pause 
goto usb

:loki
cls
title Manual Control-Lock USB
color a
set /p l= Choice:
attrib "%l%" +h +r +s
echo done
pause
goto usb
