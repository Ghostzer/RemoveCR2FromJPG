@echo off
rem Configure your base path like K:\images:
set pathdest=K:\images

set current_path=%cd%

:menu
CLS
echo.
echo 1. Read-me
echo 2. Simple sort
echo 3. Advanced sort
echo 4. Exit
echo. 
 
:ifNotChoice
set choicemenu=
CHOICE /N /C:1234 /M "Your choice ? "%1
IF ERRORLEVEL 1 SET choicemenu=1
IF ERRORLEVEL 2 SET choicemenu=2
IF ERRORLEVEL 3 SET choicemenu=3
IF ERRORLEVEL 4 SET choicemenu=4

echo;

if %choicemenu%==1 goto readme
if %choicemenu%==2 goto simple
if %choicemenu%==3 goto advanced
if %choicemenu%==4 goto exit 
echo;

:exit
exit

:simple
for %%a in (*.cr2) do (
	if not exist "%%~na.jpg" ( 
	del "%%a" 
	echo Deleting %%a
	)
	echo Photo %%a is not orphan
)
echo;
echo Sort OK.
echo;
pause
goto exit

:advanced
echo;
echo Sorting in progress...
echo;
for %%a in (*.cr2) do (
	if not exist "%%~na.jpg" ( 
	del "%%a" 
	echo Deleting "%%a"
	)
	if exist "%%~na.jpg" ( 
	echo Photo %%a is not orphan
	)	
)
echo;
set pathname=
set /p pathname=Enter folder name : 
if "%pathname%"=="" goto ifNotEnterPath
goto ifFolderIsOk
:ifNotEnterPath
set pathname=
set /p pathname=A name is required : 
if "%pathname%"=="" goto ifNotEnterPath
if NOT "%pathname%"=="" goto ifFolderIsOk
goto ifFolderIsOk

:ifFolderIsOk
MKDIR "%pathdest%"\"%pathname%"
echo;
echo Copying to "%pathdest%\%pathname%" ...
Xcopy *.JPG "%pathdest%"\"%pathname%"
MKDIR "%pathdest%"\"%pathname%"\RAW
Xcopy *.CR2 "%pathdest%"\"%pathname%"\RAW
echo;
echo Copy OK.
explorer "%pathdest%"\"%pathname%"
echo;

pause

goto exit

:readme
echo;
echo "Simple sort" : Allows remove all CR2 orphan from deleted JPG.
echo;
echo;
echo "Advanced sort" : Like "Simple sort" allows remove all CR2 orphan from deleted JPG. 
echo After this, enter a path name when you want to copie your photos with pathdest\pathname like K:\photos\pathname. 
echo All JPG photos will be copied in K:\photos\pathname, and all CR2 photos K:\photos\pathname\RAW.
echo;
echo;
pause>nul|set/p =Enter any key for back to menu
goto menu


