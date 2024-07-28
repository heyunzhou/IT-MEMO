@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim

@REM .bashrc
xcopy %folder%\.bashrc \\wsl.localhost\Ubuntu-24.04\home\hyz\.bashrc /y
pause