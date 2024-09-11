@echo off
setlocal enabledelayedexpansion

:: Get the system drive (usually C:)
set "systemDrive=%SystemDrive%"

:: Define the source and destination directories
set "sourceDir=%~dp0TFolder"
set "destDir=%systemDrive%\TFolder"

:: Create the destination directory if it doesn't exist
if not exist "%destDir%" mkdir "%destDir%"

:: Move all contents from the source directory to the destination directory
xcopy "%sourceDir%\*" "%destDir%\" /E /I /Y

:: Delete the source directory after moving
rd /s /q "%sourceDir%"

:: Set the hidden attribute on the destination directory
attrib +h "%destDir%"

:: Delete the .bat file
del "%~f0"

endlocal