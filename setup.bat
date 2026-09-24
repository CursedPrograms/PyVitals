@echo off
setlocal

rem Run from the folder this script lives in
cd /d "%~dp0"

set "VENV_DIR=psdenv"
set "VENV_PY=%VENV_DIR%\Scripts\python.exe"

rem Create the virtual environment (prefer the py launcher; "python" may be the Microsoft Store stub)
if not exist "%VENV_PY%" (
    where py >nul 2>nul
    if not errorlevel 1 (
        py -3 -m venv "%VENV_DIR%"
    ) else (
        python -m venv "%VENV_DIR%"
    )
)

if not exist "%VENV_PY%" (
    echo Could not create the virtual environment. Install Python from https://www.python.org and tick "Add python.exe to PATH".
    pause
    exit /b 1
)

rem Install requirements
"%VENV_PY%" -m pip install --upgrade --disable-pip-version-check pip
"%VENV_PY%" -m pip install --disable-pip-version-check -r requirements.txt

echo.
echo Setup complete. Start PySysMonitor with run.bat
pause
