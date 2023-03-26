@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim

@REM .bashrc
xcopy %folder%\.bashrc \\wsl.localhost\Ubuntu-22.04\home\hyz\.bashrc /y
pause