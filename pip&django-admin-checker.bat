@echo off

:: Check if django-admin is installed
echo Checking for django-admin...
django-admin --version >nul 2>&1
if "%errorlevel%"=="0" (
    :: django-admin is installed, display version
    echo django-admin is installed!
    django-admin --version
) else (
    :: django-admin is not installed
    echo django-admin is NOT installed on this system.
)

:: Check if pip is installed
echo Checking for pip...
pip --version >nul 2>&1
if "%errorlevel%"=="0" (
    :: pip is installed, display version
    echo pip is installed!
    pip --version
) else (
    :: pip is not installed
    echo pip is NOT installed on this system.
)

:: Check if Django is installed
echo Checking for Django installation...
python -c "import django" >nul 2>&1
if "%errorlevel%"=="0" (
    echo Django is already installed.
    django-admin --version
) else (
    echo Django is NOT installed on this system.
    :: Automatically install Django if not found
    echo Installing Django...
    pip install django
    if "%errorlevel%"=="0" (
        echo Django was installed successfully!
        django-admin --version
    ) else (
        echo Failed to install Django. Please check the error messages above.
    )
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

