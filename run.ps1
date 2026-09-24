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

# Install requirements and run (calls the venv's python directly, so no Activate.ps1 / execution policy issues)
& $VENV_PY -m pip install -q --disable-pip-version-check -r requirements.txt
& $VENV_PY main.py

# Pause for user input before closing (optional)
Read-Host "Press Enter to continue..."
