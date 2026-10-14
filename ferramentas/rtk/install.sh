#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew não encontrado."
  exit 1
fi

brew install rtk-ai/tap/rtk
rtk --version
rtk gain
