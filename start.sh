#!/bin/sh
# SEKAS baslatici (Mac/Linux): sunucu arka planda, once Chrome, yoksa varsayilan tarayici
cd "$(dirname "$0")"
PORT=8765; URL="http://localhost:$PORT/index.html"
if ! (curl -s -o /dev/null "$URL" 2>/dev/null); then
  if command -v python3 >/dev/null; then nohup python3 -m http.server $PORT >/dev/null 2>&1 &
  elif command -v npx >/dev/null; then nohup npx --yes http-server -p $PORT >/dev/null 2>&1 &
  else echo "python3 veya node gerekli"; exit 1; fi
  sleep 1
fi
if [ "$(uname)" = "Darwin" ]; then open -a "Google Chrome" "$URL" 2>/dev/null || open "$URL"
else (google-chrome "$URL" || google-chrome-stable "$URL" || chromium "$URL" || xdg-open "$URL") >/dev/null 2>&1 &
fi
