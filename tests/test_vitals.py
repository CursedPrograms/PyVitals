import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import vitals  # noqa: E402


def test_cpu_info():
    assert vitals.get_cpu_info().startswith("CPU Usage:")


def test_ram_info():
    assert vitals.get_ram_info().startswith("RAM Usage:")


def test_temp_info():
    assert isinstance(vitals.get_temp_info(), str)


def test_gpu_info():
    assert vitals.get_gpu_info().startswith("GPU")
