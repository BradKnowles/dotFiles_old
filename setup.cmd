@ECHO OFF
SETLOCAL EnableExtensions EnableDelayedExpansion

SET home=%HOMEDRIVE%%HOMEPATH%

CLS
CALL install_win.cmd F .gitconfig git\.gitconfig %home%\.gitconfig
CALL install_win.cmd D "SlickRun Settings" SlickRun %AppData%\SlickRun
CALL install_win.cmd f .vimrc vim\.vimrc %home%\.vimrc

