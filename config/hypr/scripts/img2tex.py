import argparse
import os
import pyperclip
import subprocess
from PIL import Image
from pix2tex.cli import LatexOCR


# screenshot using grim and slurp and save to /tmp
def screenshot():
    subprocess.run("notify-send 'Select an area to copy to clipboard.'")
    subprocess.run(["grim", "/tmp/screenshot.png"])


def main():
    screenshot()
    model = LatexOCR()
    img = Image.open("/tmp/screenshot.png")
    latex = model(img)
    print(latex)


if __name__ == "__main__":
    main()
