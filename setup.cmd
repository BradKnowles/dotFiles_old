@ECHO OFF
SETLOCAL EnableExtensions EnableDelayedExpansion

SET home=%HOMEDRIVE%%HOMEPATH%

CLS
CALL install_win.cmd .gitconfig git\.gitconfig %home%\.gitconfig

