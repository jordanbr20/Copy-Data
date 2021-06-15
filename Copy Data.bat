@ECHO OFF
REM General
set windows=Windows 10
set ProductName=Copy Data
set version=v1

:mainmenu 
cls
COLOR 0f
echo.
title %ProductName% %version%
echo Created by Jordan Riley
echo %windows%
echo %ProductName% %version%
echo RUN AS ADMINISTRATOR
set /p OldProfile= "What is the old profile name? "
set /p drive= "What is the drive letter for the old drive? "
set log=C:\Temp\CopyData\%OldProfile%.txt
cls

IF NOT EXIST "%drive%:\users\%OldProfile%" (
COLOR cf
echo Old Profile: %OldProfile%
echo Drive: %drive%
echo Invalid Old Profile Name or Invalid Drive.
echo Old Profile: %OldProfile%>%log%
echo Drive: %drive%>>%log%
echo Invalid Old Profile Name or Invalid Drive.>>%log%
pause
GOTO :mainmenu
) ELSE (
goto :StartSetup
)
pause

:StartSetup
md C:\Temp\CopyData\
set log=C:\Temp\CopyData\%OldProfile%.txt
echo %windows%>%log%
echo %ProductName% %version% >>%log%
echo Customers Old Profile Name: %OldProfile% >>%log%
echo Old Drive: %drive% >>%log%
echo.>>%log%
cls

set newfolder = C:\Users\Public\Backup\
echo Copying data to %newfolder%%OldProfile%
echo Creating Directory %newfolder%%OldProfile%
md %newfolder%%OldProfile%
echo Directory Created.
echo Created %newfolder%%OldProfile%, Copying Data to %newfolder%%OldProfile%. >>%log%
pause
goto :startdatatransfer
)

:startdatatransfer

REM Log paths
echo. >>%log%
set newpathde = %newfolder%%OldProfile%
echo Path locations >>%log%
echo Old Folder: %oldpath% >>%log%
echo New Folder: %newpathde% >>%log%
echo Log File: %log% >>%log%
echo. >>%log%
REM End Log paths

REM Copy Start
REM ROBOCOPY %oldpath%\3D Objects %newpathde%3D Objects /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
REM ROBOCOPY %oldpath%\Downloads %newpathde%Downloads /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
REM ROBOCOPY %oldpath%\Music %newpathde%Music /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Contacts %newpathde%Contacts /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Desktop %newpathde%Desktop /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Documents %newpathde%Documents /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Favorites %newpathde%Favorites /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Links %newpathde%Links /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Pictures %newpathde%Pictures /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%Videos %newpathde%Videos /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\ %newpathde%AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState\ /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath%AppData\Local\Microsoft\OneNote\ %newpathde%AppData\Local\Microsoft\OneNote\ /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir /XD %oldpath%AppData\Local\Microsoft\OneNote\16.0\cache
ROBOCOPY %oldpath%AppData\Roaming\Microsoft\OneNote\ %newpathde%AppData\Roaming\Microsoft\OneNote\ /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir
ROBOCOPY %oldpath% %newpathde% /E /COPYALL /256 /R:3 /log+:%log% /TEE /ETA /mir /XD "%oldpath%3D Objects" /XD %oldpath%Contacts /XD %oldpath%Desktop /XD %oldpath%Documents /XD %oldpath%Downloads /XD %oldpath%Favorites /XD %oldpath%Links /XD %oldpath%Music /XD %oldpath%Pictures /XD %oldpath%Videos /XD %oldpath%Appdata /XD "%oldpath%Saved Games" /XD %oldpath%Searches


REM Change color to green to make it noticeable from a distance that it is completed.
COLOR af

pause
cls
echo.
echo Data has finished moving.
echo Data has finished moving.>>%log%
echo.
echo.>>%log%
echo Data Location - %newpathde%
echo Data Location - %newpathde%>>%log%
echo.
echo.>>%log%
echo Log File Location - %log%
echo Log File Location - %log%>>%log%
echo.
echo.>>%log%
pause

:anotherprofile
cls
COLOR 0f
echo.
set /P anotherprofilerun=Would you like to copy another profile?[Y/N]
echo Would you like to copy another profile? %anotherprofilerun% >>%log%
echo.>>%log%
echo ===========================Below will show if customer has copied data over===========================>>%log%
echo.>>%log%
if /I "%anotherprofilerun%" EQU "Y" goto :mainmenu
if /I "%anotherprofilerun%" EQU "N" goto :exit
REM End Another profile