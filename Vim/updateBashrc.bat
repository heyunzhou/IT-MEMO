@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim

@REM .bashrc
xcopy \\wsl.localhost\Ubuntu-22.04\home\hyz\.bashrc %folder%\.bashrc /y

pause