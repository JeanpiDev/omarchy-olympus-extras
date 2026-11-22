#!/bin/bash
# Installs the Olympus theme-set hook: while Olympus is active, Omarchy's About
# screen and screensaver show the Olympus temple. The art ships with the theme.
set -euo pipefail

DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
THEME="$HOME/.config/omarchy/themes/olympus"

if [[ ! -f $THEME/extras/about.txt ]]; then
  echo "Install the Olympus theme first:" >&2
  echo "  omarchy theme install https://github.com/JeanpiDev/omarchy-olympus-theme" >&2
  exit 1
fi

omarchy hook install theme-set "$DIR/olympus-branding.sh"
bash "$HOME/.config/omarchy/hooks/theme-set.d/olympus-branding.sh" "$(cat "$HOME/.local/state/omarchy/current/theme.name" 2>/dev/null || true)"

echo "Olympus extras installed. Open About (fastfetch) or the screensaver to see them."
echo "Optional boot/login logo (asks for your password):"
echo "  omarchy plymouth set-by-theme olympus"
