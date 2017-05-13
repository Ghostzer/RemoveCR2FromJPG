@echo off
rem Configuration du répertoire de destination dans pathdest de type K:\images:
set pathdest=K:\images

set current_path=%cd%

:menu
CLS
echo.
echo 1. Lisez-moi
echo 2. Trie simple
echo 3. Trie avanc‚e
echo 4. Quitter
echo. 
 
:ifNotChoice
set choicemenu=
CHOICE /N /C:1234 /M "Quel choix ? "%1
IF ERRORLEVEL 1 SET choicemenu=1
IF ERRORLEVEL 2 SET choicemenu=2
IF ERRORLEVEL 3 SET choicemenu=3
IF ERRORLEVEL 4 SET choicemenu=4
rem set choicemenu=
rem set /p choicemenu=Votre choix ? 
echo;

if %choicemenu%==1 goto readme
if %choicemenu%==2 goto simple
if %choicemenu%==3 goto avancee
if %choicemenu%==4 goto exit 
echo;

:exit
exit

:simple
for %%a in (*.cr2) do (
	if not exist "%%~na.jpg" ( 
	del "%%a" 
	echo Supression de %%a
	)
	echo La photo %%a n'est pas orpheline
)
echo;
echo Trie OK.
echo;
pause
goto exit

:avancee
echo;
echo Triage en cours...
echo;
for %%a in (*.cr2) do (
	if not exist "%%~na.jpg" ( 
	del "%%a" 
	echo supression de "%%a"
	)
	if exist "%%~na.jpg" ( 
	echo La photo %%a n'est pas orpheline
	)	
)
echo;
set pathname=
set /p pathname=Entrer un nom de dossier : 
if "%pathname%"=="" goto ifNotEnterPath
goto ifFolderIsOk
:ifNotEnterPath
set pathname=
set /p pathname=Un nom de dossier est requis : 
if "%pathname%"=="" goto ifNotEnterPath
if NOT "%pathname%"=="" goto ifFolderIsOk
goto ifFolderIsOk

:ifFolderIsOk
MKDIR "%pathdest%"\"%pathname%"
echo;
echo Copie des fichiers vers "%pathdest%\%pathname%" ...
Xcopy *.JPG "%pathdest%"\"%pathname%"
MKDIR "%pathdest%"\"%pathname%"\RAW
Xcopy *.CR2 "%pathdest%"\"%pathname%"\RAW
echo;
echo Copie OK.
explorer "%pathdest%"\"%pathname%"
echo;

pause

goto exit

:readme
echo;
echo La fonction "Trie simple" permet simplement de supprimer les photos RAW orphelines en les comparant avec leur soeurs JPG. Si une photo JPG n'existe pas/plus, alors la CR2 n'a plus raison d'ˆtre !
echo;
echo;
echo La fonctione "Trie avanc‚e" similaire au Trie Simple, efface les photos CR2 orpheline et permets ‚galement de copier les photos dans le repertoire voulu. Le nom du repertoire de base est … configurer dans le code (ligne 3) et un nom de dossier sera demand‚ apres le trie. Les fichiers CR2 seront quand … eux copie dans un dossier RAW a la racine du nouveau dossier.
echo;
echo;
pause>nul|set/p =Appuyez sur une touche pour revenir au menu 
goto menu


