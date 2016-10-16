@ECHO OFF
SetLocal EnableExtensions EnableDelayedExpansion

SET name=%1
SET source=%2
SET dest=%3

REM ECHO %name%
REM ECHO %source%
REM ECHO %dest%

REM *************************
REM Set Return Code Constants
REM *************************
SET /A SUCCESS=0

ECHO Installing %name%
ECHO =================
IF EXIST "%dest%" (
	SET /P replace=%dest% already exists overwrite? [Y/n] || SET replace=Y
	IF /I !replace!==y (
		CALL :DELETE_FILE
		CALL :MAKE_LINK
	)
) ELSE (
	CALL :MAKE_LINK
)

ECHO[
ECHO Finished installing %name%
ECHO ===================

EndLocal
EXIT /B %SUCCESS%

:DELETE_FILE
ECHO Deleting %dest%
DEL "%dest%"
GOTO :EOF

:MAKE_LINK
mklink /H %dest% %source%
GOTO :EOF

