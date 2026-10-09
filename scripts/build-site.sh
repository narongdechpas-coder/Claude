#!/usr/bin/env bash
# สร้างเว็บสำหรับ Netlify: ห่อ prototype/index.html (ซึ่งเขียนแบบไม่มี <head> สำหรับ Artifact) ให้เป็นเอกสาร HTML เต็ม
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist && mkdir -p dist
{
  printf '<!doctype html>\n<html lang="th">\n<head>\n<meta charset="utf-8">\n'
  printf '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
  printf '<style>:root{color-scheme:light}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  printf '</head>\n<body>\n'
  cat prototype/index.html
  printf '\n</body>\n</html>\n'
} > dist/index.html
cp -r samples dist/samples 2>/dev/null || true
echo "built dist/index.html ($(wc -c < dist/index.html) bytes)"
