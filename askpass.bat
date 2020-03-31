@echo off
setlocal enabledelayedexpansion

REM ***** Modify as necessary for the string source. *****
set "_arg1=%1"

set "_UCASE=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "_LCASE=abcdefghijklmnopqrstuvwxyz"

for /l %%a in (0,1,25) do (
   call set "_FROM=%%_UCASE:~%%a,1%%
   call set "_TO=%%_LCASE:~%%a,1%%
   call set "_arg1=%%_arg1:!_FROM!=!_TO!%%
)
if "%_arg1%"=="username" (
	echo %GIT_USERNAME%
	exit /b
)
if "%_arg1%"=="password" (
	echo %GIT_PASSWORD%
	exit /b
)
endlocal
