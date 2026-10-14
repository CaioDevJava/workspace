#!/usr/bin/env bash
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
  echo "uv não encontrado. Instale com:"
  echo "brew install uv"
  exit 1
fi

uv tool install graphifyy
graphify install --platform gemini
graphify --help
