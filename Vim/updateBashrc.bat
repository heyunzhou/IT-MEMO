@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim

@REM .bashrc
xcopy \\wsl.localhost\Ubuntu-24.04\home\hyz\.bashrc %folder%\.bashrc /y

pause