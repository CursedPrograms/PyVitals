#!/bin/bash

# Run from the folder this script lives in
cd "$(dirname "$0")" || exit 1

VENV_DIR="psdenv"

# Create the virtual environment if it doesn't exist
# (try each interpreter until one actually runs; on Windows "python3" may be the Microsoft Store stub)
if [ ! -d "$VENV_DIR" ]; then
    for PY in python3 python py; do
        if "$PY" -c "import sys" >/dev/null 2>&1; then
            "$PY" -m venv "$VENV_DIR"
            break
        fi
    done
fi

# The venv's python lives in bin/ on Linux/macOS and Scripts/ on Windows (Git Bash)
if [ -x "$VENV_DIR/bin/python" ]; then
    VENV_PY="$VENV_DIR/bin/python"
elif [ -x "$VENV_DIR/Scripts/python.exe" ]; then
    VENV_PY="$VENV_DIR/Scripts/python.exe"
else
    echo "Could not create the virtual environment in $VENV_DIR (on Debian/Ubuntu: sudo apt install python3-venv)."
    exit 1
fi

# Install requirements and run
"$VENV_PY" -m pip install -q --disable-pip-version-check -r requirements.txt
"$VENV_PY" main.py

# Pause for user input before closing (optional)
read -r -p "Press Enter to continue..."
