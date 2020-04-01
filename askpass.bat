@echo off
setlocal enabledelayedexpansion

REM ***** Modify as necessary for the string source. *****
set "_arg1=%1"
call set "_arg1=%%_arg1:~1,8%%
REM echo %_arg1% >> askpass.log

set "_UCASE=ABCDEFGHIJKLMNOPQRSTUVWXYZ"
set "_LCASE=abcdefghijklmnopqrstuvwxyz"

for /l %%a in (0,1,25) do (
   call set "_FROM=%%_UCASE:~%%a,1%%
   call set "_TO=%%_LCASE:~%%a,1%%
   call set "_arg1=%%_arg1:!_FROM!=!_TO!%%
)
echo %_arg1% >> askpass.log
if "%_arg1%"=="username" (
	REM echo %GIT_USERNAME% >> askpass.log
	echo %GIT_USERNAME%
	exit(0)
)
if "%_arg1%"=="password" (
	REM echo %GIT_PASSWORD% >> askpass.log
	echo %GIT_PASSWORD%
	exit(0)
)
endlocal
