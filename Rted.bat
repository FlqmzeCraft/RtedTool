@echo off
title Advanced Windows 11 Performance Tool v1.0
color 0A
setlocal enabledelayedexpansion

:: Function Definitions
:clearTemp
echo Clearing temporary files...
del /q "%temp%\*"
echo Temporary files cleared!
goto pauseMenu

:diskCleanup
echo Running Disk Cleanup...
cleanmgr /sagerun:1
echo Disk Cleanup completed!
goto pauseMenu

:optimizeNetwork
echo Optimizing network settings...
netsh int tcp set global autotuningle=normal >nul
netsh int tcp set global congestionprovider=ctcp >nul
echo Network optimization complete!
goto pauseMenu

:adjustVisuals
echo Adjusting visual effects for performance...
powershell -command "Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'VisualFX' -Value 2" >nul
echo Visual effects adjusted for performance!
goto pauseMenu

:checkHealth
echo Checking system health...
DISM /Online /Cleanup-Image /CheckHealth >nul
echo System health check complete!
goto pauseMenu

:restartSystem
echo Restarting the system...
shutdown /r /t 0
goto exitTool

:exitTool
echo Exiting the tool. Goodbye!
pause
exit

:pauseMenu
echo.
echo ================================
echo Press any key to return to the menu...
pause >nul
goto menu

:menu
cls
echo ================================
echo      Windows 11 Performance Tool
echo ================================
echo.
echo 1. Clear Temporary Files
echo 2. Run Disk Cleanup
echo 3. Optimize Network Settings
echo 4. Adjust Visual Effects
echo 5. Check System Health
echo 6. Restart System
echo 7. Exit
echo ================================
set /p choice="Choose an option (1-7): "

if "%choice%"=="1" (
    call :clearTemp
) else if "%choice%"=="2" (
    call :diskCleanup
) else if "%choice%"=="3" (
    call :optimizeNetwork
) else if "%choice%"=="4" (
    call :adjustVisuals
) else if "%choice%"=="5" (
    call :checkHealth
) else if "%choice%"=="6" (
    call :restartSystem
) else if "%choice%"=="7" (
    goto exitTool
) else (
    echo Invalid option, please try again.
    pause
    goto menu
)
