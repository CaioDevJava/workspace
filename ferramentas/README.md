cat > ferramentas/README.md <<'EOF'
# Ferramentas do workspace

Esta pasta guarda scripts e documentação para ferramentas utilizadas pelo
workspace de desenvolvimento.

## Ferramentas

### RTK

Objetivo: reduzir a quantidade de saída de comandos enviada ao agente,
economizando tokens.

Instalação:

```bash
./rtk/install.sh
```

Verificação:

```bash
./rtk/verify.sh
```

### Graphify

Objetivo: gerar um mapa consultável do código, documentação, configurações
e outros artefatos do projeto para auxiliar agentes de desenvolvimento.

Pré-requisito:

```bash
brew install uv
```

Instalação:

```bash
./graphify/install.sh
```

Verificação:

```bash
./graphify/verify.sh
```

## Observações

- As ferramentas são instaladas globalmente no Mac.
- Os scripts apenas automatizam instalação e verificação.
- API keys e tokens não devem ser armazenados nesta pasta.
- A instalação do Graphify deve ser registrada para o Gemini CLI.
EOF