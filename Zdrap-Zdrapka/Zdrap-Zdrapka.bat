@echo off
title Zdrap-Zdrapka by Bartek Kansy (c)
mode con: lines=40

If NOT exist "Ustawienia.bat" (goto default-settings) ELSE (call "Ustawienia.bat") && goto start

:default-settings
(
echo set przegrane=0

echo set z5o=0
echo set z10o=0
echo set z25o=0
echo set z50o=0
echo set z100o=0

echo set z5=0
echo set z10=0
echo set z25=0
echo set z50=0
echo set z100=0

echo set Zdrapka5=0
echo set Zdrapka10=0
echo set Zdrapka25=0
echo set Zdrapka50=0
echo set Zdrapka100=0

echo set Urodziny=0
echo set Money=0
) > Ustawienia.bat
call Ustawienia.bat
goto start
::############################################################
:set-config
(
echo set przegrane=%przegrane%

echo set z5o=%z5o%
echo set z10o=%z10o%
echo set z25o=%z25o%
echo set z50o=%z50o%
echo set z100o=%z100o%

echo set z5=%z5%
echo set z10=%z10%
echo set z25=%z25%
echo set z50=%z50%
echo set z100=%z100%

echo set Zdrapka5=%Zdrapka5%
echo set Zdrapka10=%Zdrapka10%
echo set Zdrapka25=%Zdrapka25%
echo set Zdrapka50=%Zdrapka50%
echo set Zdrapka100=%Zdrapka100%

echo set Urodziny=%Urodziny%
echo set Money=%Money%
) > Ustawienia.bat
goto loop
::############################################################
:start
cls
set q= 1 
set w= 2 
set e= 3 
set r= 4 
set t= 5 
set y= 6 
set u= 7 
set i= 8 
set o= 9 

echo ***************************************
echo *  Zdrap-Zdrapka by Bartek Kansy (c)  *
echo *                                     *
echo * W tej grze mozesz zdrapywac zdrapki *
echo *       i zarabiac pieniadze          *
echo ***************************************
echo.
if %Urodziny%==0 ( goto start2 ) ELSE ( PING localhost -n 3 >NUL && goto loop )
::############################################################
:start2
echo Dostajesz na urodziny 100 zl. Mozesz wydac je na zdrapki
echo i stac sie milionerem, ale pamietaj gdy twoje konto
echo osiagnie 4 zl lub mniej, przegrywasz i zaczynasz od poczatku!
echo.
echo Gra polega na zdrapywniu pol i znalezieniu znaku.
echo Oczywiscie pod zdrapnym polem moze byc zero, ktore
echo daje nic, lub minus ktory odejmuje pieniadze.
echo.
echo Wcisnij dowolny przycisk, aby kontynuowac.
pause >nul
set Urodziny=1
set /a Money=%Money%+100
goto set-config
::############################################################
:loop
set q= 1 
set w= 2 
set e= 3 
set r= 4 
set t= 5 
set y= 6 
set u= 7 
set i= 8 
set o= 9 

set all=0
set malpa=0
set gwiazdka=0
set dolar=0
set minus=0
set jackpot=0
set qz=0
set wz=0
set ez=0
set rz=0
set tz=0
set yz=0
set uz=0
set iz=0
set oz=0
cls
echo Twoje pieniadze: %money% zl
echo.
echo ==================================
echo.
echo [1b] Kup zdrapke za 5 zl
echo [2b] Kup zdrapke za 10 zl
echo [3b] Kup zdrapke za 25 zl
echo [4b] Kup zdrapke za 50 zl
echo [5b] Kup zdrapke za 100 zl
echo.
echo ==================================
echo.
echo [1] Zdrap zdrapke za 5 zl    - Ilosc: %Zdrapka5%
echo [2] Zdrap zdrapke za 10 zl   - Ilosc: %Zdrapka10%
echo [3] Zdrap zdrapke za 25 zl   - Ilosc: %Zdrapka25%
echo [4] Zdrap zdrapke za 50 zl   - Ilosc: %Zdrapka50%
echo [5] Zdrap zdrapke za 100 zl  - Ilosc: %Zdrapka100%
echo.
echo ==================================
echo.
echo [0] Statystyki
echo.
set /p loop=Wybor:
if %loop%==1b goto 1b
if %loop%==2b goto 2b
if %loop%==3b goto 3b
if %loop%==4b goto 4b
if %loop%==5b goto 5b

if %loop%==1 goto zdrapka5-check
if %loop%==2 goto zdrapka10-check
if %loop%==3 goto zdrapka25-check
if %loop%==4 goto zdrapka50-check
if %loop%==5 goto zdrapka100-check

if %loop%==0 goto statystyki
goto loop
::############################################################
:statystyki
cls
echo Kupione zdrapki za:
echo 5 zl   - %z5%
echo 10 zl  - %z10%
echo 25 zl  - %z25%
echo 50 zl  - %z50%
echo 100 zl - %z100%
echo.
echo Otworzone zdrapki za:
echo 5 zl   - %z5o%
echo 10 zl  - %z10o%
echo 25 zl  - %z25o%
echo 50 zl  - %z50o%
echo 100 zl - %z100o%
echo.
echo Ilosc przegranych: %przegrane%
echo.
echo Wcisnij dowolny przycisk, aby kontynuowac.
pause >nul
goto loop
::############################################################
:przegrana-check
set przegrana=0
if %zdrapka5%==0 set /a przegrana=%przegrana%+1
if %zdrapka10%==0 set /a przegrana=%przegrana%+1
if %zdrapka25%==0 set /a przegrana=%przegrana%+1
if %zdrapka50%==0 set /a przegrana=%przegrana%+1
if %zdrapka100%==0 set /a przegrana=%przegrana%+1
if %przegrana%==5 ( goto przegrana ) else ( goto set-config )
::############################################################
:przegrana
cls
echo Niestety Twoje konto z pieniedzmi osiagnelo 4 zl lub mniej,
echo wiec przegrales/as :(
echo.
echo Twoje statystyki sie nie zresetuja, ale pieniadze tak.
echo.
echo Wcisnij dowolny przycisk, aby kontynuowac.
pause >NUL
set /a przegrane=%przegrane%+1
set urodziny=0
set Zdrapka5=0
set Zdrapka10=0
set Zdrapka25=0
set Zdrapka50=0
set Zdrapka100=0
set money=0
set urodziny=0
(
echo set przegrane=%przegrane%

echo set z5o=%z5o%
echo set z10o=%z10o%
echo set z25o=%z25o%
echo set z50o=%z50o%
echo set z100o=%z100o%

echo set z5=%z5%
echo set z10=%z10%
echo set z25=%z25%
echo set z50=%z50%
echo set z100=%z100%

echo set Zdrapka5=%Zdrapka5%
echo set Zdrapka10=%Zdrapka10%
echo set Zdrapka25=%Zdrapka25%
echo set Zdrapka50=%Zdrapka50%
echo set Zdrapka100=%Zdrapka100%

echo set Urodziny=%Urodziny%
echo set Money=%Money%
) > Ustawienia.bat
goto start
::############################################################
:1b
if NOT %Money% LSS 5 (
echo.
echo Pomyslnie kupiono zdrapke za 5 zl
set /a z5=%z5%+1
set /a Zdrapka5=%Zdrapka5%+1
set /a Money=%Money%-5
PING localhost -n 3 >nul
goto set-config
) ELSE if %Money% LSS 5 (
echo.
echo Nie masz wystarczajaco pieniedzy, aby kupic ta zdrapke!
PING localhost -n 3 >nul
goto loop
)
::############################################################
:2b
if NOT %Money% LSS 10 (
echo.
echo Pomyslnie kupiono zdrapke za 10 zl
set /a z10=%z10%+1
set /a Zdrapka10=%Zdrapka10%+1
set /a Money=%Money%-10
PING localhost -n 3 >nul
goto set-config
) ELSE if %Money% LSS 10 (
echo.
echo Nie masz wystarczajaco pieniedzy, aby kupic ta zdrapke!
PING localhost -n 3 >nul
goto loop
)
::############################################################
:3b
if NOT %Money% LSS 25 (
echo.
echo Pomyslnie kupiono zdrapke za 25 zl
set /a z25=%z25%+1
set /a Zdrapka25=%Zdrapka25%+1
set /a Money=%Money%-25
PING localhost -n 3 >nul
goto set-config
) ELSE if %Money% LSS 25 (
echo.
echo Nie masz wystarczajaco pieniedzy, aby kupic ta zdrapke!
PING localhost -n 3 >nul
goto loop
)
::############################################################
:4b
if NOT %Money% LSS 50 (
echo.
echo Pomyslnie kupiono zdrapke za 50 zl
set /a z50=%z50%+1
set /a Zdrapka50=%Zdrapka50%+1
set /a Money=%Money%-50
PING localhost -n 3 >nul
goto set-config
) ELSE if %Money% LSS 50 (
echo.
echo Nie masz wystarczajaco pieniedzy, aby kupic ta zdrapke!
PING localhost -n 3 >nul
goto loop
)
::############################################################
:5b
if NOT %Money% LSS 100 (
echo.
echo Pomyslnie kupiono zdrapke za 100 zl
set /a z100=%z100%+1
set /a Zdrapka100=%Zdrapka100%+1
set /a Money=%Money%-100
PING localhost -n 3 >nul
goto set-config
) ELSE if %Money% LSS 100 (
echo.
echo Nie masz wystarczajaco pieniedzy, aby kupic ta zdrapke!
PING localhost -n 3 >nul
goto loop
)
::############################################################
:zdrapka5-check
if NOT %Zdrapka5% LSS 1 (
set /a Zdrapka5=%Zdrapka5%-1
goto zdrapka5
) ELSE if %Zdrapka5%==0 (
echo. 
echo Nie masz zdrapek za 5 zl! 
PING localhost -n 3 >NUL 
goto loop
)
::############################################################
:zdrapka5
cls
echo Zdrapka za 5 zl:
echo.
echo ##############################
echo #     #     #     ############
echo # %q% # %w% # %e% ##"@=2zl" ##
echo #     #     #     ##        ##
echo ####################"*=3zl" ##
echo #     #     #     ##        ##
echo # %r% # %t% # %y% ##"$=5zl" ##
echo #     #     #     ############
echo ##############################
echo.
echo Zdrap:
echo.
echo [1] pole 1
echo [2] pole 2
echo [3] pole 3
echo [4] pole 4
echo [5] pole 5
echo [6] pole 6
echo.
echo [0] Zobacz wygrana
echo.
set /p zdrapka=Wybor:
if %zdrapka%==1 goto q
if %zdrapka%==2 goto w
if %zdrapka%==3 goto e
if %zdrapka%==4 goto r
if %zdrapka%==5 goto t
if %zdrapka%==6 goto y
if %zdrapka%==0 goto zdrapka5-zarobione
goto zdrapka5
::############################################################
:q
if %qz%==0 goto qz
if %qz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka5
:qz
set /a all=%all%+1
set /a qz=%qz%+1
set num=0
set /a num=%random% %%4 +1
if %num%==1 set q= 0 && goto zdrapka5
if %num%==2 set q= @ && set /a malpa=%malpa%+1 && goto zdrapka5
if %num%==3 set q= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka5
if %num%==4 set q= $ && set /a dolar=%dolar%+1 && goto zdrapka5
::############################################################
:w
if %wz%==0 goto wz
if %wz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka5
:wz
set /a all=%all%+1
set /a wz=%wz%+1
set num=0
set /a num=%random% %%4 +1
if %num%==1 set w= 0 && goto zdrapka5
if %num%==2 set w= @ && set /a malpa=%malpa%+1 && goto zdrapka5
if %num%==3 set w= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka5
if %num%==4 set w= $ && set /a dolar=%dolar%+1 && goto zdrapka5
::############################################################
:e
if %ez%==0 goto ez
if %ez%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka5
:ez
set /a all=%all%+1
set /a ez=%ez%+1
set num=0
set /a num=%random% %%4 +1
if %num%==1 set e= 0 && goto zdrapka5
if %num%==2 set e= @ && set /a malpa=%malpa%+1 && goto zdrapka5
if %num%==3 set e= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka5
if %num%==4 set e= $ && set /a dolar=%dolar%+1 && goto zdrapka5
::############################################################
:r
if %rz%==0 goto rz
if %rz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka5
:rz
set /a all=%all%+1
set /a rz=%rz%+1
set num=0
set /a num=%random% %%4 +1
if %num%==1 set r= 0 && goto zdrapka5
if %num%==2 set r= @ && set /a malpa=%malpa%+1 && goto zdrapka5
if %num%==3 set r= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka5
if %num%==4 set r= $ && set /a dolar=%dolar%+1 && goto zdrapka5
::############################################################
:t
if %tz%==0 goto tz
if %tz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka5
:tz
set /a all=%all%+1
set /a tz=%tz%+1
set num=0
set /a num=%random% %%4 +1
if %num%==1 set t= 0 && goto zdrapka5
if %num%==2 set t= @ && set /a malpa=%malpa%+1 && goto zdrapka5
if %num%==3 set t= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka5
if %num%==4 set t= $ && set /a dolar=%dolar%+1 && goto zdrapka5
::############################################################
:y
if %yz%==0 goto yz
if %yz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka5
:yz
set /a all=%all%+1
set /a yz=%yz%+1
set num=0
set /a num=%random% %%4 +1
if %num%==1 set y= 0 && goto zdrapka5
if %num%==2 set y= @ && set /a malpa=%malpa%+1 && goto zdrapka5
if %num%==3 set y= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka5
if %num%==4 set y= $ && set /a dolar=%dolar%+1 && goto zdrapka5
::############################################################
:zdrapka5-zarobione
if %all%==6 ( goto zdrapka5-zarobione2 ) ELSE (
echo.
echo Najpierw zdrap wszystkie pola!
ping localhost -n 3 >nul
goto zdrapka5
)
:zdrapka5-zarobione2
echo.
set zarobione=0
set /a zarobione=%zarobione%+%malpa%*2
set /a zarobione=%zarobione%+%gwiazdka%*3
set /a zarobione=%zarobione%+%dolar%*5

echo Twoje zarobione pieniadze to: %zarobione% zl!
ping localhost -n 3 >nul
set /a z5o=%z5o%+1
set /a money=%money%+%zarobione%
if %money% LSS 4 ( goto przegrana-check )
goto set-config







::############################################################
:zdrapka10-check
if NOT %Zdrapka10% LSS 1 (
set /a Zdrapka10=%Zdrapka10%-1
goto zdrapka10
) ELSE if %Zdrapka10%==0 (
echo. 
echo Nie masz zdrapek za 10 zl! 
PING localhost -n 3 >NUL 
goto loop
)
::############################################################
:zdrapka10
cls
echo Zdrapka za 10 zl:
echo.
echo ##############################
echo #     #     #     ############
echo # %q% # %w% # %e% ##"@=5zl" ##
echo #     #     #     ##        ##
echo ####################"*=7zl" ##
echo #     #     #     ##        ##
echo # %r% # %t% # %y% ##"$=10zl"##
echo #     #     #     ############
echo ##############################
echo.
echo Zdrap:
echo.
echo [1] pole 1
echo [2] pole 2
echo [3] pole 3
echo [4] pole 4
echo [5] pole 5
echo [6] pole 6
echo.
echo [0] Zobacz wygrana
echo.
set /p zdrapka=Wybor:
if %zdrapka%==1 goto q10
if %zdrapka%==2 goto w10
if %zdrapka%==3 goto e10
if %zdrapka%==4 goto r10
if %zdrapka%==5 goto t10
if %zdrapka%==6 goto y10
if %zdrapka%==0 goto zdrapka10-zarobione
goto zdrapka10
::############################################################
:q10
if %qz%==0 goto qz10
if %qz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka10
:qz10
set /a all=%all%+1
set /a qz=%qz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set q= - && set /a minus=%minus%+1 && goto zdrapka10
if %num%==2 set q= 0 && goto zdrapka10
if %num%==3 set q= @ && set /a malpa=%malpa%+1 && goto zdrapka10
if %num%==4 set q= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka10
if %num%==5 set q= $ && set /a dolar=%dolar%+1 && goto zdrapka10
::############################################################
:w10
if %wz%==0 goto wz10
if %wz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka10
:wz10
set /a all=%all%+1
set /a wz=%wz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set w= - && set /a minus=%minus%+1 && goto zdrapka10
if %num%==2 set w= 0 && goto zdrapka10
if %num%==3 set w= @ && set /a malpa=%malpa%+1 && goto zdrapka10
if %num%==4 set w= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka10
if %num%==5 set w= $ && set /a dolar=%dolar%+1 && goto zdrapka10
::############################################################
:e10
if %ez%==0 goto ez10
if %ez%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka10
:ez10
set /a all=%all%+1
set /a ez=%ez%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set e= - && set /a minus=%minus%+1 && goto zdrapka10
if %num%==2 set e= 0 && goto zdrapka10
if %num%==3 set e= @ && set /a malpa=%malpa%+1 && goto zdrapka10
if %num%==4 set e= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka10
if %num%==5 set e= $ && set /a dolar=%dolar%+1 && goto zdrapka10
::############################################################
:r10
if %rz%==0 goto rz10
if %rz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka10
:rz10
set /a all=%all%+1
set /a rz=%rz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set r= - && set /a minus=%minus%+1 && goto zdrapka10
if %num%==2 set r= 0 && goto zdrapka10
if %num%==3 set r= @ && set /a malpa=%malpa%+1 && goto zdrapka10
if %num%==4 set r= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka10
if %num%==5 set r= $ && set /a dolar=%dolar%+1 && goto zdrapka10
::############################################################
:t10
if %tz%==0 goto tz10
if %tz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka10
:tz10
set /a all=%all%+1
set /a tz=%tz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set t= - && set /a minus=%minus%+1 && goto zdrapka10
if %num%==2 set t= 0 && goto zdrapka10
if %num%==3 set t= @ && set /a malpa=%malpa%+1 && goto zdrapka10
if %num%==4 set t= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka10
if %num%==5 set t= $ && set /a dolar=%dolar%+1 && goto zdrapka10
::############################################################
:y10
if %yz%==0 goto yz10
if %yz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka10
:yz10
set /a all=%all%+1
set /a yz=%yz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set y= - && set /a minus=%minus%+1 && goto zdrapka10
if %num%==2 set y= 0 && goto zdrapka10
if %num%==3 set y= @ && set /a malpa=%malpa%+1 && goto zdrapka10
if %num%==4 set y= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka10
if %num%==5 set y= $ && set /a dolar=%dolar%+1 && goto zdrapka10
::############################################################
:zdrapka10-zarobione
if %all%==6 ( goto zdrapka10-zarobione2 ) ELSE (
echo.
echo Najpierw zdrap wszystkie pola!
ping localhost -n 3 >nul
goto zdrapka10
)
:zdrapka10-zarobione2
echo.
set zarobione=0
set /a zarobione=%zarobione%+%malpa%*5
set /a zarobione=%zarobione%+%gwiazdka%*7
set /a zarobione=%zarobione%+%dolar%*10
set /a zarobione=%zarobione%+%minus%*-10

echo Twoje zarobione pieniadze to: %zarobione% zl!
ping localhost -n 3 >nul
set /a z10o=%z10o%+1
set /a money=%money%+%zarobione%
if %money% LSS 4 ( goto przegrana-check )
goto set-config







::############################################################
:zdrapka25-check
if NOT %Zdrapka25% LSS 1 (
set /a Zdrapka25=%Zdrapka25%-1
goto zdrapka25
) ELSE if %Zdrapka25%==0 (
echo. 
echo Nie masz zdrapek za 25 zl! 
PING localhost -n 3 >NUL 
goto loop
)
::############################################################
:zdrapka25
cls
echo Zdrapka za 25 zl:
echo.
echo ##############################
echo #     #     #     ############
echo # %q% # %w% # %e% ##"@=12zl"##
echo #     #     #     ##        ##
echo ####################"*=18zl"##
echo #     #     #     ##        ##
echo # %r% # %t% # %y% ##"$=25zl"##
echo #     #     #     ############
echo ##############################
echo.
echo Zdrap:
echo.
echo [1] pole 1
echo [2] pole 2
echo [3] pole 3
echo [4] pole 4
echo [5] pole 5
echo [6] pole 6
echo.
echo [0] Zobacz wygrana
echo.
set /p zdrapka=Wybor:
if %zdrapka%==1 goto q25
if %zdrapka%==2 goto w25
if %zdrapka%==3 goto e25
if %zdrapka%==4 goto r25
if %zdrapka%==5 goto t25
if %zdrapka%==6 goto y25
if %zdrapka%==0 goto zdrapka25-zarobione
goto zdrapka25
::############################################################
:q25
if %qz%==0 goto qz25
if %qz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka25
:qz25
set /a all=%all%+1
set /a qz=%qz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set q= - && set /a minus=%minus%+1 && goto zdrapka25
if %num%==2 set q= 0 && goto zdrapka25
if %num%==3 set q= @ && set /a malpa=%malpa%+1 && goto zdrapka25
if %num%==4 set q= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka25
if %num%==5 set q= $ && set /a dolar=%dolar%+1 && goto zdrapka25
::############################################################
:w25
if %wz%==0 goto wz25
if %wz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka25
:wz25
set /a all=%all%+1
set /a wz=%wz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set w= - && set /a minus=%minus%+1 && goto zdrapka25
if %num%==2 set w= 0 && goto zdrapka25
if %num%==3 set w= @ && set /a malpa=%malpa%+1 && goto zdrapka25
if %num%==4 set w= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka25
if %num%==5 set w= $ && set /a dolar=%dolar%+1 && goto zdrapka25
::############################################################
:e25
if %ez%==0 goto ez25
if %ez%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka25
:ez25
set /a all=%all%+1
set /a ez=%ez%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set e= - && set /a minus=%minus%+1 && goto zdrapka25
if %num%==2 set e= 0 && goto zdrapka25
if %num%==3 set e= @ && set /a malpa=%malpa%+1 && goto zdrapka25
if %num%==4 set e= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka25
if %num%==5 set e= $ && set /a dolar=%dolar%+1 && goto zdrapka25
::############################################################
:r25
if %rz%==0 goto rz25
if %rz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka25
:rz25
set /a all=%all%+1
set /a rz=%rz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set r= - && set /a minus=%minus%+1 && goto zdrapka25
if %num%==2 set r= 0 && goto zdrapka25
if %num%==3 set r= @ && set /a malpa=%malpa%+1 && goto zdrapka25
if %num%==4 set r= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka25
if %num%==5 set r= $ && set /a dolar=%dolar%+1 && goto zdrapka25
::############################################################
:t25
if %tz%==0 goto tz25
if %tz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka25
:tz25
set /a all=%all%+1
set /a tz=%tz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set t= - && set /a minus=%minus%+1 && goto zdrapka25
if %num%==2 set t= 0 && goto zdrapka25
if %num%==3 set t= @ && set /a malpa=%malpa%+1 && goto zdrapka25
if %num%==4 set t= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka25
if %num%==5 set t= $ && set /a dolar=%dolar%+1 && goto zdrapka25
::############################################################
:y25
if %yz%==0 goto yz25
if %yz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka25
:yz25
set /a all=%all%+1
set /a yz=%yz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set y= - && set /a minus=%minus%+1 && goto zdrapka25
if %num%==2 set y= 0 && goto zdrapka25
if %num%==3 set y= @ && set /a malpa=%malpa%+1 && goto zdrapka25
if %num%==4 set y= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka25
if %num%==5 set y= $ && set /a dolar=%dolar%+1 && goto zdrapka25
::############################################################
:zdrapka25-zarobione
if %all%==6 ( goto zdrapka25-zarobione2 ) ELSE (
echo.
echo Najpierw zdrap wszystkie pola!
ping localhost -n 3 >nul
goto zdrapka25
)
:zdrapka25-zarobione2
echo.
set zarobione=0
set /a zarobione=%zarobione%+%malpa%*12
set /a zarobione=%zarobione%+%gwiazdka%*18
set /a zarobione=%zarobione%+%dolar%*25
set /a zarobione=%zarobione%+%minus%*-25

echo Twoje zarobione pieniadze to: %zarobione% zl!
ping localhost -n 3 >nul
set /a z25o=%z25o%+1
set /a money=%money%+%zarobione%
if %money% LSS 4 ( goto przegrana-check )
goto set-config







::############################################################
:zdrapka50-check
if NOT %Zdrapka50% LSS 1 (
set /a Zdrapka50=%Zdrapka50%-1
goto zdrapka50
) ELSE if %Zdrapka50%==0 (
echo. 
echo Nie masz zdrapek za 50 zl! 
PING localhost -n 3 >NUL 
goto loop
)
::############################################################
:zdrapka50
cls
echo Zdrapka za 50 zl:
echo.
echo ##############################
echo #     #     #     ############
echo # %q% # %w% # %e% ##        ##
echo #     #     #     ##"@=25zl"##
echo ####################        ##
echo #     #     #     ##        ##
echo # %r% # %t% # %y% ##"*=30zl"##
echo #     #     #     ##        ##
echo ####################        ##
echo #     #     #     ##"$=40zl"##
echo # %u% # %i% # %o% ##        ##
echo #     #     #     ############
echo ##############################
echo.
echo Zdrap:
echo.
echo [1] pole 1
echo [2] pole 2
echo [3] pole 3
echo [4] pole 4
echo [5] pole 5
echo [6] pole 6
echo [7] pole 7
echo [8] pole 8
echo [9] pole 9
echo.
echo [0] Zobacz wygrana
echo.
set /p zdrapka=Wybor:
if %zdrapka%==1 goto q50
if %zdrapka%==2 goto w50
if %zdrapka%==3 goto e50
if %zdrapka%==4 goto r50
if %zdrapka%==5 goto t50
if %zdrapka%==6 goto y50
if %zdrapka%==7 goto u50
if %zdrapka%==8 goto i50
if %zdrapka%==9 goto o50
if %zdrapka%==0 goto zdrapka50-zarobione
goto zdrapka50
::############################################################
:q50
if %qz%==0 goto qz50
if %qz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:qz50
set /a all=%all%+1
set /a qz=%qz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set q= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set q= 0 && goto zdrapka50
if %num%==3 set q= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set q= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set q= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:w50
if %wz%==0 goto wz50
if %wz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:wz50
set /a all=%all%+1
set /a wz=%wz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set w= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set w= 0 && goto zdrapka50
if %num%==3 set w= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set w= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set w= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:e50
if %ez%==0 goto ez50
if %ez%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:ez50
set /a all=%all%+1
set /a ez=%ez%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set e= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set e= 0 && goto zdrapka50
if %num%==3 set e= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set e= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set e= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:r50
if %rz%==0 goto rz50
if %rz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:rz50
set /a all=%all%+1
set /a rz=%rz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set r= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set r= 0 && goto zdrapka50
if %num%==3 set r= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set r= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set r= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:t50
if %tz%==0 goto tz50
if %tz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:tz50
set /a all=%all%+1
set /a tz=%tz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set t= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set t= 0 && goto zdrapka50
if %num%==3 set t= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set t= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set t= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:y50
if %yz%==0 goto yz50
if %yz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:yz50
set /a all=%all%+1
set /a yz=%yz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set y= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set y= 0 && goto zdrapka50
if %num%==3 set y= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set y= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set y= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:u50
if %uz%==0 goto uz50
if %uz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:uz50
set /a all=%all%+1
set /a uz=%uz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set u= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set u= 0 && goto zdrapka50
if %num%==3 set u= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set u= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set u= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:i50
if %iz%==0 goto iz50
if %iz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:iz50
set /a all=%all%+1
set /a iz=%iz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set i= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set i= 0 && goto zdrapka50
if %num%==3 set i= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set i= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set i= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:o50
if %oz%==0 goto oz50
if %oz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka50
:oz50
set /a all=%all%+1
set /a oz=%oz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set o= - && set /a minus=%minus%+1 && goto zdrapka50
if %num%==2 set o= 0 && goto zdrapka50
if %num%==3 set o= @ && set /a malpa=%malpa%+1 && goto zdrapka50
if %num%==4 set o= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka50
if %num%==5 set o= $ && set /a dolar=%dolar%+1 && goto zdrapka50
::############################################################
:zdrapka50-zarobione
if %all%==9 ( goto zdrapka50-zarobione2 ) ELSE (
echo.
echo Najpierw zdrap wszystkie pola!
ping localhost -n 3 >nul
goto zdrapka50
)
:zdrapka50-zarobione2
echo.
set zarobione=0
set /a zarobione=%zarobione%+%malpa%*25
set /a zarobione=%zarobione%+%gwiazdka%*30
set /a zarobione=%zarobione%+%dolar%*40
set /a zarobione=%zarobione%+%minus%*-50

echo Twoje zarobione pieniadze to: %zarobione% zl!
ping localhost -n 3 >nul
set /a z50o=%z50o%+1
set /a money=%money%+%zarobione%
if %money% LSS 4 ( goto przegrana-check )
goto set-config







::############################################################
:zdrapka100-check
if NOT %Zdrapka100% LSS 1 (
set /a Zdrapka100=%Zdrapka100%-1
goto zdrapka100
) ELSE if %Zdrapka100%==0 (
echo. 
echo Nie masz zdrapek za 100 zl! 
PING localhost -n 3 >NUL 
goto loop
)
::############################################################
:zdrapka100
cls
echo Zdrapka za 100 zl:
echo.
echo ####################################
echo #     #     #     ##################
echo # %q% # %w% # %e% ##              ##
echo #     #     #     ##    @=25zl    ##
echo ####################              ##
echo #     #     #     ##    *=37zl    ##
echo # %r% # %t% # %y% ##              ##
echo #     #     #     ##    $=60zl    ##
echo ####################              ##
echo #     #     #     ## 3x $$$=200zl ##
echo # %u% # %i% # %o% ##              ##
echo #     #     #     ##################
echo ####################################
echo.
echo Zdrap:
echo.
echo [1] pole 1
echo [2] pole 2
echo [3] pole 3
echo [4] pole 4
echo [5] pole 5
echo [6] pole 6
echo [7] pole 7
echo [8] pole 8
echo [9] pole 9
echo.
echo [0] Zobacz wygrana
echo.
set /p zdrapka=Wybor:
if %zdrapka%==1 goto q100
if %zdrapka%==2 goto w100
if %zdrapka%==3 goto e100
if %zdrapka%==4 goto r100
if %zdrapka%==5 goto t100
if %zdrapka%==6 goto y100
if %zdrapka%==7 goto u100
if %zdrapka%==8 goto i100
if %zdrapka%==9 goto o100
if %zdrapka%==0 goto zdrapka100-zarobione
goto zdrapka100
::############################################################
:q100
if %qz%==0 goto qz100
if %qz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:qz100
set /a all=%all%+1
set /a qz=%qz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set q= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set q= 0 && goto zdrapka100
if %num%==3 set q= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set q= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set q= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:w100
if %wz%==0 goto wz100
if %wz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:wz100
set /a all=%all%+1
set /a wz=%wz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set w= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set w= 0 && goto zdrapka100
if %num%==3 set w= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set w= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set w= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:e100
if %ez%==0 goto ez100
if %ez%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:ez100
set /a all=%all%+1
set /a ez=%ez%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set e= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set e= 0 && goto zdrapka100
if %num%==3 set e= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set e= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set e= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:r100
if %rz%==0 goto rz100
if %rz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:rz100
set /a all=%all%+1
set /a rz=%rz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set r= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set r= 0 && goto zdrapka100
if %num%==3 set r= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set r= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set r= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:t100
if %tz%==0 goto tz100
if %tz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:tz100
set /a all=%all%+1
set /a tz=%tz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set t= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set t= 0 && goto zdrapka100
if %num%==3 set t= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set t= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set t= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:y100
if %yz%==0 goto yz100
if %yz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:yz100
set /a all=%all%+1
set /a yz=%yz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set y= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set y= 0 && goto zdrapka100
if %num%==3 set y= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set y= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set y= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:u100
if %uz%==0 goto uz100
if %uz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:uz100
set /a all=%all%+1
set /a uz=%uz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set u= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set u= 0 && goto zdrapka100
if %num%==3 set u= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set u= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set u= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:i100
if %iz%==0 goto iz100
if %iz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:iz100
set /a all=%all%+1
set /a iz=%iz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set i= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set i= 0 && goto zdrapka100
if %num%==3 set i= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set i= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set i= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:o100
if %oz%==0 goto oz100
if %oz%==1 echo. && echo To pole jest juz zdrapane! && PING localhost -n 3 >NUL && goto zdrapka100
:oz100
set /a all=%all%+1
set /a oz=%oz%+1
set num=0
set /a num=%random% %%5 +1
if %num%==1 set o= - && set /a minus=%minus%+1 && goto zdrapka100
if %num%==2 set o= 0 && goto zdrapka100
if %num%==3 set o= @ && set /a malpa=%malpa%+1 && goto zdrapka100
if %num%==4 set o= * && set /a gwiazdka=%gwiazdka%+1 && goto zdrapka100
if %num%==5 set o= $ && set /a dolar=%dolar%+1 && goto zdrapka100
::############################################################
:zdrapka100-zarobione
if %all%==9 ( goto zdrapka100-zarobione2 ) ELSE (
echo.
echo Najpierw zdrap wszystkie pola!
ping localhost -n 3 >nul
goto zdrapka100
)
:zdrapka100-zarobione2
echo.
set zarobione=0
set /a zarobione=%zarobione%+%malpa%*25
set /a zarobione=%zarobione%+%gwiazdka%*37
set /a zarobione=%zarobione%+%dolar%*60
set /a zarobione=%zarobione%+%minus%*-100

echo Twoje zarobione pieniadze to: %zarobione% zl!
ping localhost -n 3 >nul
set /a z100o=%z100o%+1
set /a money=%money%+%zarobione%
if %money% LSS 4 ( goto przegrana-check )
goto set-config