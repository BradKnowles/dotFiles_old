@ECHO OFF
SetLocal EnableExtensions EnableDelayedExpansion

SET linktype=%1
SET name=%2
SET source=%3
SET dest=%4

REM ECHO %name%
REM ECHO %source%
REM ECHO %dest%

REM *************************
REM Set Return Code Constants
REM *************************
SET /A SUCCESS=0
SET /A INVALID_LINK_TYPE=1

ECHO Installing %name%
ECHO =================
IF EXIST "%dest%" (
	SET /P replace=%dest% already exists overwrite? [Y/n] || SET replace=Y
	IF /I !replace!==y (
		CALL :DELETE_LINK
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

:DELETE_LINK
ECHO Deleting %dest%
IF /I %linktype%==F (
	DEL "%dest%"
	GOTO :EOF
)
IF /I %linktype%==D (
	RD /S /Q "%dest%" || ECHO This failed^^!
	GOTO :EOF
)
EXIT /B %INVALID_LINK_TYPE%		

:MAKE_LINK
IF /I %linktype%==F (
	mklink /H %dest% %source%
	GOTO :EOF
)

IF /I %linktype%==D (
	mklink /J %dest% %source%
	GOTO :EOF
)
EXIT /B %INVALID_LINK_TYPE%		

