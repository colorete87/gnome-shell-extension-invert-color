#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$(realpath "$0")")"

UUID="invert-window@colorete87"
DEST="$HOME/.local/share/gnome-shell/extensions/$UUID"

case "${1:-install}" in
  install)
    mkdir -p "$DEST/schemas"
    cp extension.js metadata.json "$DEST/"
    cp schemas/*.xml "$DEST/schemas/"
    glib-compile-schemas "$DEST/schemas/"
    echo "Installed to $DEST"
    echo "Enable with:  gnome-extensions enable $UUID"
    echo "Then restart GNOME Shell (log out/in on Wayland, or Alt+F2 → r on X11)."
    ;;
  uninstall)
    gnome-extensions disable "$UUID" 2>/dev/null || true
    rm -rf "$DEST"
    echo "Uninstalled $UUID"
    ;;
  *)
    echo "Usage: $0 [install|uninstall]"
    exit 1
    ;;
esac
