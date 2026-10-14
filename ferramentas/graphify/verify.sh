cat > ferramentas/graphify/verify.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

command -v graphify
graphify --help >/dev/null
echo "Graphify instalado e disponível no PATH."
EOF