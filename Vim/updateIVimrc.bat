@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim


@REM vim
xcopy \\wsl.localhost\Ubuntu-20.04\home\hyz\.vimrc %folder%\.vimrc /y


pause