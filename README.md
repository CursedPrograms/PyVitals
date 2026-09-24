[![Twitter: @NorowaretaGemu](https://img.shields.io/badge/X-@NorowaretaGemu-blue.svg?style=flat)](https://x.com/NorowaretaGemu)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
  
  <br>
<div align="center">
  <a href="https://ko-fi.com/cursedentertainment">
    <img src="https://ko-fi.com/img/githubbutton_sm.svg" alt="ko-fi" style="width: 20%;"/>
  </a>
</div>
  <br>

<div align="center">
  <img alt="Python" src="https://img.shields.io/badge/python%20-%23323330.svg?&style=for-the-badge&logo=python&logoColor=white"/>
</div>
<div align="center">
    <img alt="Git" src="https://img.shields.io/badge/git%20-%23323330.svg?&style=for-the-badge&logo=git&logoColor=white"/>
  <img alt="PowerShell" src="https://img.shields.io/badge/PowerShell-%23323330.svg?&style=for-the-badge&logo=powershell&logoColor=white"/>
  <img alt="Shell" src="https://img.shields.io/badge/Shell-%23323330.svg?&style=for-the-badge&logo=gnu-bash&logoColor=white"/>
  <img alt="Batch" src="https://img.shields.io/badge/Batch-%23323330.svg?&style=for-the-badge&logo=windows&logoColor=white"/>
  </div>
  <br>

# PyVitals

A lightweight, cross-platform system monitor written in Python. It shows live CPU, RAM, temperature and NVIDIA GPU stats in either the terminal or a small Tkinter window.

## Features

- **CPU usage:** overall utilisation, refreshed every 2 seconds
- **RAM usage:** percentage used and total installed memory
- **Temperatures:** hardware sensor readings where the OS exposes them (Linux)
- **NVIDIA GPU:** temperature, utilisation and memory used, via NVML (optional)
- **Two front ends:** a console monitor (`vitals.py`) and a Tkinter GUI (`vitals-tkinter.py`)
- **One-click launchers:** for Windows (`run.bat`, `run.ps1`) and Linux/macOS (`run.sh`)

<br>

## Quick Start

The launcher scripts create a virtual environment (`psdenv`), install the requirements and open the menu. Run the one for your system from the project folder.

**Windows**

```bat
run.bat
```

or in PowerShell:

```powershell
.\run.ps1
```

If PowerShell blocks the script, run it with `powershell -ExecutionPolicy Bypass -File .\run.ps1`.

**Linux / macOS**

```bash
chmod +x run.sh
./run.sh
```

On Debian/Ubuntu, first install the venv and Tkinter packages:

```bash
sudo apt update
sudo apt install python3-venv python3-tk
```

To set up the environment without launching, run `setup.bat`, `.\setup.ps1` or `./setup.sh`. `install_requirements.bat` does the same thing.

The menu then lets you pick:

| Option | Runs | Description |
| ------ | ---- | ----------- |
| `1` | `vitals.py` | Console system monitor (Ctrl+C to stop) |
| `2` | `vitals-tkinter.py` | Tkinter GUI system monitor |
| `00` | `scripts/install_dependencies.py` | Install the requirements |
| `q` | | Quit |

<br>

## Manual Setup

```bash
python -m venv venv

# Windows
venv\Scripts\activate
# Linux / macOS
source venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt
```

Then start the menu, or run a monitor directly:

```bash
python main.py             # menu
python vitals.py           # console monitor
python vitals-tkinter.py   # GUI monitor
```

> **Windows:** if `python` opens the Microsoft Store, install Python from [python.org](https://www.python.org/downloads/) with "Add python.exe to PATH" ticked, or use the `py` launcher instead (`py -m venv venv`).

<br>

## Requirements

- Python 3.9+
- [`psutil`](https://pypi.org/project/psutil/): CPU, RAM and sensor stats
- [`nvidia-ml-py`](https://pypi.org/project/nvidia-ml-py/): NVIDIA GPU stats (optional; without it or an NVIDIA GPU, the GPU line shows "Not available")
- `tkinter`: GUI only; ships with Python on Windows and macOS, and on Linux comes from `sudo apt install python3-tk`

> **Note:** `psutil` only reads temperature sensors on Linux (and some BSDs). On Windows and macOS the temperature line shows "Unsupported".

<br>

## Project Structure

```
PySysMonitor/
├── main.py                      # Script menu
├── vitals.py                    # Console monitor
├── vitals-tkinter.py            # Tkinter GUI monitor
├── config.json                  # App config
├── requirements.txt
├── scripts/
│   └── install_dependencies.py
├── tests/
│   └── test_vitals.py
├── run.bat / run.ps1 / run.sh   # Launchers
└── setup.bat / setup.ps1 / setup.sh
```

## Running Tests

```bash
pip install pytest
pytest
```

<br>
<div align="center">
© Cursed Entertainment 2026
</div>
<br>
<div align="center">
<a href="https://cursed-entertainment.itch.io/" target="_blank">
    <img src="https://github.com/CursedPrograms/cursedentertainment/raw/main/images/logos/logo-wide-grey.png"
        alt="CursedEntertainment Logo" style="width:250px;">
</a>
</div>
