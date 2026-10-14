cat > ferramentas/rtk/verify.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

command -v rtk
rtk --version
rtk gain
EOF