import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))


def test_app_import():
    import app
    assert app is not None


def test_house_import():
    import house
    assert house is not None