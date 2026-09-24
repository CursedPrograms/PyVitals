# Run from the folder this script lives in
Set-Location -Path $PSScriptRoot

$VENV_DIR = "psdenv"
$VENV_PY = Join-Path $VENV_DIR "Scripts\python.exe"

# Create the virtual environment (prefer the py launcher; "python" may be the Microsoft Store stub)
if (-Not (Test-Path $VENV_PY)) {
    if (Get-Command py -ErrorAction SilentlyContinue) {
        py -3 -m venv $VENV_DIR
    } else {
        python -m venv $VENV_DIR
    }
}

if (-Not (Test-Path $VENV_PY)) {
    Write-Host "Could not create the virtual environment. Install Python from https://www.python.org and tick 'Add python.exe to PATH'."
    Read-Host "Press Enter to continue..."
    exit 1
}

# Install requirements
& $VENV_PY -m pip install --upgrade --disable-pip-version-check pip
& $VENV_PY -m pip install --disable-pip-version-check -r requirements.txt

Write-Host ""
Write-Host "Setup complete. Start PySysMonitor with .\run.ps1"
Read-Host "Press Enter to continue..."
