#!/usr/bin/env python3
"""Apply the Boxsmarchy logo while retaining the current Fastfetch modules."""

import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


def read_jsonc(path):
    text = path.read_text()
    # Match strings first so URLs and shell command strings survive comment removal.
    text = re.sub(
        r'"(?:\\.|[^"\\])*"|//[^\r\n]*|/\*[\s\S]*?\*/',
        lambda match: match[0] if match[0].startswith('"') else " ",
        text,
    )
    text = re.sub(
        r'"(?:\\.|[^"\\])*"|,\s*(?=[}\]])',
        lambda match: match[0] if match[0].startswith('"') else "",
        text,
    )
    data = json.loads(text)
    if not isinstance(data, dict):
        raise ValueError(f"Expected a config object in {path}")
    return data


def find_config():
    result = subprocess.run(
        ["fastfetch", "--list-config-paths"],
        check=True,
        capture_output=True,
        text=True,
    )
    for line in result.stdout.splitlines():
        directory = Path(line.removesuffix(" (*)").strip()).expanduser()
        for filename in ("config.jsonc", "config.json"):
            candidate = directory / filename
            if candidate.is_file():
                return candidate
    return None


def main():
    root = Path(__file__).resolve().parent.parent
    logo = json.loads((root / "fastfetch-logo.json").read_text())
    image = Path(logo["source"]).expanduser()
    if not image.is_file():
        raise SystemExit("Install the theme with bash tools/install.sh first.")

    source = find_config()
    data = read_jsonc(source) if source else {}
    destination = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config")) / "fastfetch/config.jsonc"
    if source == destination and data.get("logo") == logo:
        print(f"Fastfetch logo already configured: {destination}")
        return

    data["logo"] = logo

    if source:
        backup_root = Path.home() / ".local/state/omarchy/theme-backups"
        backup_root.mkdir(parents=True, exist_ok=True)
        backup = Path(tempfile.mkdtemp(prefix="fastfetch-", dir=backup_root)) / source.name
        shutil.copy2(source, backup)
        print(f"Previous Fastfetch config saved to {backup}")

    destination.parent.mkdir(parents=True, exist_ok=True)
    temporary = None
    try:
        with tempfile.NamedTemporaryFile("w", dir=destination.parent, delete=False) as handle:
            temporary = Path(handle.name)
            json.dump(data, handle, ensure_ascii=False, indent=2)
            handle.write("\n")
        temporary.replace(destination)
    finally:
        if temporary and temporary.exists():
            temporary.unlink()
    print(f"Fastfetch configured: {destination}")


if __name__ == "__main__":
    main()
