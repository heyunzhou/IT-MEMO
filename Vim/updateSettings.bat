@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim

@REM vscode
xcopy %userprofile%\AppData\Roaming\Code\User\settings.json %folder%\settings.json /y

pause