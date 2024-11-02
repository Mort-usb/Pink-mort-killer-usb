@echo off
echo WARNING: This will clean specified disks and remove all data on them.
echo.

REM ---- Display Disk Information for Verification ----
wmic diskdrive get caption,size
echo.

REM ---- Confirmation Prompt ----
set /p confirm="Are you sure you want to clean disks 0 to 4? This action is irreversible. (Y/N): "
if /i not "%confirm%"=="Y" (
    echo Operation canceled.
    exit /b
)

REM ---- Generate DiskPart Script ----
echo list disk > clean_script.txt
for %%i in (0 1 2 3 4) do (
    echo select disk %%i >> clean_script.txt
    echo clean >> clean_script.txt
    echo list disk >> clean_script.txt
)

REM ---- Execute DiskPart Script ----
diskpart /s clean_script.txt

REM ---- Cleanup ----
del clean_script.txt

echo.
echo Disk cleanup operation completed. Please verify the disks.
pause

REM ---- Launch PowerShell Image Display Script ----
PowerShell -ExecutionPolicy Bypass -File "%~dp0show_image.ps1"

REM ---- Launch AutoHotkey Script to Hide Taskbar and Desktop Icons ----
start "" "%~dp0hide_taskbar_desktop.ahk"
pause
