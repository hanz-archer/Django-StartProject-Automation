@echo off
:: Check Python version
echo Checking Python version...
python --version >nul 2>&1
if not "%errorlevel%"=="0" (
    echo Python is not installed or not added to PATH. Please fix this before proceeding.
    pause
    exit /b
)

:: Prompt for project name
set /p ProjectName=Enter the Django project name: 
if "%ProjectName%"=="" (
    echo You must enter a project name. Exiting...
    pause
    exit /b
)

:: Create the Django project
echo Creating Django project "%ProjectName%"...
django-admin startproject %ProjectName%
if not "%errorlevel%"=="0" (
    echo Failed to create the Django project. Exiting...
    pause
    exit /b
)
echo Django project "%ProjectName%" created successfully!

:: Prompt for app name
set /p AppName=Enter the Django app name: 
if "%AppName%"=="" (
    echo You must enter an app name. Exiting...
    pause
    exit /b
)

:: Navigate to the project and create the app
cd %ProjectName%
echo Creating Django app "%AppName%"...
python manage.py startapp %AppName%
if not "%errorlevel%"=="0" (
    echo Failed to create the Django app. Exiting...
    pause
    exit /b
)
echo Django app "%AppName%" created successfully!

echo.
echo ****************************************************
echo *                                                  *
echo *     Created by: HANZ ARCHER                     *
echo *     Thank you for using this script!            *
echo *                                                  *
echo ****************************************************
echo.
pause
