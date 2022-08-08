@echo off 
cls 
echo.
set /p l=Drive onde esta instalado o sistema operacional (Ex.: C):
set /p c=Caminho do destino do backup (Ex.: E:\172520):
set /p q=Quantidade de usuarios para fazer backup:
set /p login=Login do usuario:
echo %login%; > "%l%:\users\usuarios.txt"
SETLOCAL EnableDelayedExpansion
FOR /L %%i IN (2 1 %q%) DO (
	set /p login=Login do proximo usuario:
	echo !login!; >> "%l%:\users\usuarios.txt"
)
mkdir %c%
cls

cd "%USERPROFILE%\.."
set profiles=%cd%

FOR /F "delims=;" %%G IN (usuarios.txt) DO (
	title Fazendo backup . . .
	robocopy "%l%:\users\%%G" "%c%\Users\%%G" /e /copyall /xjd /r:0 /w:0 /xD "AppData" "tihucam" "OneDrive - EBSERH" "OneDrive" "Google Drive" "Dropbox" /tee /np /bytes /unilog+:"%c%\logbackup.txt"
	if exist "%l%:\users\%%G\AppData\Roaming\Mozilla\Firefox" robocopy "%l%:\users\%%G\AppData\Roaming\Mozilla\Firefox" "%c%\Users\%%G\AppData\Roaming\Mozilla\Firefox" profiles.ini /copyall /xjd /r:0 /w:0
	if exist "%l%:\users\%%G\AppData\Roaming\Mozilla\Firefox\Profiles" robocopy "%l%:\users\%%G\AppData\Roaming\Mozilla\Firefox\Profiles" "%c%\Users\%%G\AppData\Roaming\Mozilla\Firefox\Profiles" key4.db logins.json places.sqlite /e /copyall /xjd /r:0 /w:0
	if exist "%l%:\users\%%G\AppData\Local\Google\Chrome\User Data\Default" robocopy "%l%:\users\%%G\AppData\Local\Google\Chrome\User Data\Default" "%c%\Users\%%G\AppData\Local\Google\Chrome\User Data\Default" Bookmarks "Login Data" /copyall /xjd /r:0 /w:0
)

pause
exit
