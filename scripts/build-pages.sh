#!/bin/sh
# Wrap app/index.html (written for the claude.ai Artifact skeleton) in a full
# HTML document for GitHub Pages: doctype, viewport, and the same small reset.
set -e
out="${1:-_site}"
mkdir -p "$out"
{
  printf '%s\n' '<!doctype html>'
  printf '%s\n' '<html lang="zh-Hant">'
  printf '%s\n' '<head>'
  printf '%s\n' '<meta charset="utf-8">'
  printf '%s\n' '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  printf '%s\n' '<meta name="apple-mobile-web-app-capable" content="yes">'
  printf '%s\n' '<meta name="apple-mobile-web-app-title" content="薪水本">'
  printf '%s\n' '<style>:root{color-scheme:light;box-sizing:border-box;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}html{scroll-padding-top:env(safe-area-inset-top,0px)}body{margin:0;padding:0;font:14px -apple-system,BlinkMacSystemFont,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>'
  printf '%s\n' '</head>'
  printf '%s\n' '<body>'
  cat app/index.html
  printf '\n%s\n' '</body>'
  printf '%s\n' '</html>'
} > "$out/index.html"
echo "built $out/index.html"
