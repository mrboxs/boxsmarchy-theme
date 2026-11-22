#!/usr/bin/env bash
set -euo pipefail

project_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
cd -- "$project_root"

command -v rsvg-convert >/dev/null
command -v magick >/dev/null

mkdir -p backgrounds
rsvg-convert sources/mrboxs-dark.svg -o backgrounds/01-mrboxs-dark.png
rsvg-convert -w 960 -h 540 sources/mrboxs-dark.svg -o preview.png
rsvg-convert -w 640 assets/brand/mrboxs-horizontal.svg -o unlock.png

# Match Omarchy's Plymouth preview layout without opening an image viewer.
plymouth_assets="${OMARCHY_PATH:-/usr/share/omarchy}/default/plymouth"
staging_dir=$(mktemp -d)
trap 'rm -rf -- "$staging_dir"' EXIT
for asset in entry lock bullet; do
  magick "$plymouth_assets/$asset.png" -channel RGB \
    +level-colors '#fafafa','#fafafa' "$staging_dir/$asset.png"
done

logo_h=$(magick identify -format '%h' unlock.png)
entry_w=$(magick identify -format '%w' "$staging_dir/entry.png")
entry_h=$(magick identify -format '%h' "$staging_dir/entry.png")
logo_y=$(( (1080 - logo_h) / 2 ))
entry_x=$(( (1920 - entry_w) / 2 ))
entry_y=$(( logo_y + logo_h + 40 ))
lock_h=$(( entry_h * 8 / 10 ))
lock_w=$(( 84 * lock_h / 96 ))
lock_x=$(( entry_x - lock_w - 15 ))
lock_y=$(( entry_y + entry_h / 2 - lock_h / 2 ))
bullet_y=$(( entry_y + entry_h / 2 - 4 ))
bullet_args=()
for i in 0 1 2 3; do
  bullet_x=$(( entry_x + 20 + i * 12 ))
  bullet_args+=( '(' "$staging_dir/bullet.png" -resize 7x7 ')' \
    -geometry "+${bullet_x}+${bullet_y}" -composite )
done

magick -size 1920x1080 'xc:#09090b' \
  unlock.png -geometry "+640+${logo_y}" -composite \
  "$staging_dir/entry.png" -geometry "+${entry_x}+${entry_y}" -composite \
  '(' "$staging_dir/lock.png" -resize "${lock_w}x${lock_h}" ')' \
  -geometry "+${lock_x}+${lock_y}" -composite \
  "${bullet_args[@]}" preview-unlock.png
