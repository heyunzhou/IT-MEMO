@echo off

SET folder=D:\GoogleDrive\IT-MEMO\Vim

@REM intillj idea
xcopy %userprofile%\.ideavimrc %folder%\.ideavimrc /y

@REM eclipse
xcopy %userprofile%\.vrapperrc %folder%\.vrapperrc /y

@REM vscode
xcopy %userprofile%\AppData\Roaming\Code\User\settings.json %folder%\settings.json /y

@REM spaceVim
xcopy \\wsl.localhost\Ubuntu-20.04\home\heyunzhou\.SpaceVim.d %folder%\.SpaceVim.d /E /y

pause