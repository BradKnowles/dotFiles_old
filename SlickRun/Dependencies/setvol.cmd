@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

IF [%1] == [] EXIT /B

SET userSetting=%1
SET /A VolumeSetting=65536 * %userSetting%/100

nircmdc setsysvolume %VolumeSetting%

