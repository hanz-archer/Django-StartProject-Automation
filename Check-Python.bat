@echo off
:: Check if Python is installed
python --version >nul 2>&1
if "%errorlevel%"=="0" (
    :: Python is installed, display version and installation directory
    echo Python is installed!

    :: Display Python version
    python --version

    :: Display Python installation directory
    echo Python installation directory:
    where python

    :: Check if Python is in PATH
    echo Checking if Python is in PATH...
    setlocal enabledelayedexpansion
    set PythonInPath=No
    for /f "tokens=*" %%i in ('where python') do (
        set PythonPath=%%i
        echo Checking: !PythonPath!
        echo !PythonPath! | findstr /i "python" >nul
        if !errorlevel! == 0 (
            set PythonInPath=Yes
        )
    )
    if "%PythonInPath%"=="Yes" (
        echo Python is in the PATH environment variables.
    ) else (
        echo Python is NOT in the PATH environment variables.
    )
) else (
    :: Python is not installed
    echo Python is NOT installed on this system.
)

echo.
echo ****************************************************
echo *                                                  *
echo *     Created by: HANZ ARCHER                     *
echo *     Thank you for using this script!            *
echo *                                                  *
echo ****************************************************
echo.

pause
