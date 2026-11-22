#!/usr/bin/env bash
set -euo pipefail

apply=true
case "${1:-}" in
  '') ;;
  --no-apply) apply=false ;;
  *) printf 'Usage: %s [--no-apply]\n' "$0" >&2; exit 2 ;;
esac

project_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
theme_dir="$HOME/.config/omarchy/themes/boxsmarchy"
files=(
  colors.toml icons.theme chromium.theme neovim.lua helix.toml vscode-theme.json
  shell.controls.toml shell.menu.toml shell.launcher.toml shell.popups.toml
  shell.notifications.toml
  preview.png unlock.png preview-unlock.png
)

for file in "${files[@]}" backgrounds/01-mrboxs-dark.png; do
  test -f "$project_root/$file" || {
    printf 'Missing theme file: %s\n' "$file" >&2
    exit 1
  }
done

staging_dir=$(mktemp -d)
trap 'rm -rf -- "$staging_dir"' EXIT
mkdir -p -- "$staging_dir/backgrounds"
for file in "${files[@]}"; do
  cp -- "$project_root/$file" "$staging_dir/$file"
done
cp -- "$project_root/backgrounds/01-mrboxs-dark.png" "$staging_dir/backgrounds/"

# A local copy keeps the author's Neovim config; repo installs filter Lua.
if [[ -e $theme_dir || -L $theme_dir ]]; then
  backup_root="$HOME/.local/state/omarchy/theme-backups"
  mkdir -p -- "$backup_root"
  backup_dir=$(mktemp -d "$backup_root/boxsmarchy-$(date +%Y%m%d-%H%M%S)-XXXXXX")
  mv -- "$theme_dir" "$backup_dir/theme"
  printf 'Previous Boxsmarchy saved to %s\n' "$backup_dir/theme"
fi

mkdir -p -- "$theme_dir"
cp -a -- "$staging_dir/." "$theme_dir/"
printf 'Installed Boxsmarchy to %s\n' "$theme_dir"

if $apply; then
  OMARCHY_THEME_WAIT=1 omarchy theme set boxsmarchy
fi
