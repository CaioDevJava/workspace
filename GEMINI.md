# Workspace de Desenvolvimento Automatizado

> Este arquivo é específico para o Gemini CLI. Para a visão geral do workspace, incluindo a compatibilidade com Codex, consulte [README.md](README.md).

## Objetivo

Este workspace organiza projetos de software full-stack e fornece um fluxo de trabalho automatizado e encadeado baseado em agentes e skills especializados:

1. Product Owner: refinamento funcional de negócio (BDD).
2. Arquiteto: refinamento técnico, stack e estrutura do projeto.
3. Designer: protótipo visual (prototipo-tela.png) e especificações de UI/UX.
4. SEO Specialist: palavras-chave, metadados, Schema.org e copy.
5. Desenvolvedor: quebra de tarefas e implementação full-stack em `repos/`.
6. Code Reviewer: auditoria de código e Quality Gate (SonarQube).
7. QA Engineer: validação de BDD, testes automatizados e regressão.
8. Encerramento: atualização do README.md do projeto e Conventional Commit.

O workspace favorece clareza, rastreabilidade, baixo acoplamento e execução encadeada orientada por estado (`docs/TODO.md`).

---

## Organização do Workspace

```text
workspace/
├── .agents/
│   └── skills/                   <-- Fonte canônica das skills ativas do workspace
├── .gemini/
│   ├── agents/                   <-- Agentes leitores/roteadores leves
│   ├── skills/                   <-- Compatibilidade de runtime e espelho do workspace
│   └── settings.json
├── .codex -> .gemini             <-- Compatibilidade para runtime do Codex
├── docs/
│   ├── CODING_STANDARDS.md       <-- Padrões de Clean Code, Utilitários e Modais
│   ├── TODO.md                   <-- Dashboard de controle de estado da esteira
│   └── refinamentos/             <-- Artefatos concentrados por história
│       └── REF-NNN-nome-da-historia/
│           ├── refinamento-negocio.md
│           ├── refinamento-tecnico.md
│           ├── refinamento-design.md
│           ├── refinamento-seo.md
│           ├── tarefas.md
│           ├── revisao-codigo.md
│           ├── plano-testes-qa.md
│           └── prototipo/
│               └── prototipo-tela.png
├── repos/                        <-- Código-fonte dos projetos (Java, React, etc.)
│   └── nome-do-projeto/
│       ├── src/
│       └── README.md
├── ferramentas/                  <-- Ferramentas auxiliares (RTK, Graphify)
└── GEMINI.md                     <-- Diretrizes gerais deste workspace