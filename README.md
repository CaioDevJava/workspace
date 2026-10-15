# Workspace de Desenvolvimento com IA

Workspace para organizar projetos full-stack, documentação, agentes especializados, skills e ferramentas auxiliares para desenvolvimento assistido por IA.

> Este workspace foi pensado para funcionar com Gemini CLI e Codex. O arquivo [GEMINI.md](GEMINI.md) continua sendo o guia específico do Gemini, enquanto este README serve como referência geral do projeto e do fluxo do workspace.

O fluxo principal é:

```text
Solicitação do cliente
        ↓
Product Owner
        ↓
Refinamento de negócio
        ↓
Arquiteto
        ↓
Refinamento técnico
        ↓
Designer
        ↓
Desenvolvedor
        ↓
QA
```

## Objetivos

Este workspace foi criado para:

- transformar ideias de clientes em requisitos claros;
- registrar regras de negócio e critérios de aceite;
- avaliar frontend e backend como partes de um único produto;
- escolher tecnologias com base no contexto real do projeto;
- apoiar decisões de arquitetura;
- criar interfaces consistentes e acessíveis;
- implementar funcionalidades end-to-end;
- validar entregas com testes e evidências;
- reduzir consumo de tokens com ferramentas auxiliares;
- manter rastreabilidade entre negócio, arquitetura, código e QA.

## Estrutura

```text
workspace/
├── .agents/
│   └── skills/
│       ├── workflow/
│       ├── refinamento-negocio/
│       ├── refinamento-tecnico/
│       ├── refinamento-design/
│       ├── refinamento-seo/
│       ├── documentation/
│       ├── git-commit/
│       ├── quebra-de-tarefas/
│       ├── testing-strategy/
│       ├── revisao-codigo/
│       └── execucao-desenvolvimento/
├── .gemini/
│   ├── agents/
│   ├── skills/
│   └── settings.json
├── .codex -> .gemini
├── docs/
│   ├── CODING_STANDARDS.md
│   ├── refinamentos/
│   └── TODO.md
├── ferramentas/
│   ├── rtk/
│   ├── graphify/
│   └── README.md
├── repos/
│   └── nome-do-projeto/
│       ├── frontend/
│       ├── backend/
│       ├── docs/
│       └── README.md
├── GEMINI.md
├── LICENSE
└── README.md
```

## Componentes principais

### `.gemini/agents/`

Contém os agentes especializados reutilizáveis do workspace:

- `product-owner.md`: refina solicitações no nível de negócio.
- `arquiteto.md`: realiza o refinamento técnico e decisões de arquitetura.
- `designer.md`: define UX, UI, componentes e acessibilidade.
- `desenvolvedor.md`: implementa código e testes.
- `qa.md`: valida critérios, fluxos e regressões.

Os agentes devem possuir frontmatter YAML válido no início do arquivo:

```markdown
---
name: nome-do-agente
description: Descrição do agente.
kind: local
---
```

### `.agents/skills/`

É a raiz canônica das skills do workspace. Essa pasta concentra as skills ativas e reconhecidas para a execução do fluxo local.

Skills presentes no workspace:

- `workflow`: orquestra a esteira completa do desenvolvimento.
- `refinamento-negocio`: transforma ideias vagas em requisitos, regras e critérios de aceite.
- `refinamento-tecnico`: transforma o refinamento de negócio em uma solução técnica.
- `refinamento-design`: define experiência visual e especificações de interface.
- `refinamento-seo`: define estratégia de SEO, metadados e copy.
- `documentation`: mantém a documentação do projeto.
- `git-commit`: organiza o commit semântico.
- `quebra-de-tarefas`: transforma a implementação em subtarefas.
- `testing-strategy`: define estratégia de testes e QA.
- `revisao-codigo`: revisa qualidade e riscos do código.
- `execucao-desenvolvimento`: coordena a execução do desenvolvimento.

Cada skill deve possuir o manifesto:

```text
.agents/skills/nome-da-skill/SKILL.md
```

### `.gemini/skills/` e `.codex`

Esses diretórios existem como compatibilidade de runtime. Eles podem funcionar como espelho do conjunto de skills, mas não devem ser a fonte de verdade do workspace. A convenção oficial do projeto é manter a skill ativa em `.agents/skills`.

### `repos/`

Contém os projetos reais. Cada projeto deve ser tratado como um produto completo, mesmo quando possui frontend e backend separados.

Exemplo:

```text
repos/loja-laticinios/
├── frontend/
├── backend/
└── docs/
```

### `ferramentas/`

Contém scripts de instalação, verificação e documentação de ferramentas auxiliares.

Ferramentas previstas:

- RTK: reduz saída de comandos do terminal e ajuda a economizar tokens.
- Graphify: gera um mapa consultável da estrutura e das relações do projeto.

As ferramentas são instaladas globalmente no Mac; a pasta apenas mantém o setup reproduzível.

## Fluxo de refinamento

### 1. Refinamento de negócio

O Product Owner recebe a solicitação bruta do cliente e utiliza a skill `refinamento-negocio`.

A skill deve perguntar interativamente quando faltar informação. As perguntas devem:

- ser feitas no momento em que a dúvida surgir;
- tratar de negócio, não de tecnologia;
- apresentar de 2 a 4 opções sugeridas;
- permitir resposta personalizada;
- registrar decisões e pendências;
- produzir requisitos, regras e critérios de aceite.

O documento deve ser salvo em:

```text
docs/produtos/refinamento/REF-NNN-descricao-curta.md
```

O documento só deve receber o status `Refinado em negócio` depois que as dúvidas críticas forem resolvidas e o usuário confirmar o salvamento.

### 2. Refinamento técnico

O Arquiteto lê o refinamento validado e utiliza a skill `refinamento-tecnico`.

O refinamento técnico deve analisar:

- frontend;
- backend;
- contrato entre as camadas;
- dados e persistência;
- integrações;
- autenticação e autorização;
- segurança;
- performance;
- SEO;
- acessibilidade;
- infraestrutura;
- custos;
- observabilidade;
- testes;
- manutenção.

O Arquiteto deve comparar tecnologias quando necessário, como:

- Java/Spring Boot versus Node.js/NestJS;
- Angular versus React;
- SSR, SSG, CSR ou estratégia híbrida.

Nenhuma tecnologia deve ser escolhida automaticamente por preferência pessoal. A decisão precisa considerar requisitos, complexidade, custo, equipe, desempenho, segurança e manutenção.

O documento deve ser salvo em:

```text
docs/arquitetura/refinamento/TECH-NNN-descricao-curta.md
```

### 3. Design

O Designer lê os refinamentos de negócio e técnico e cria a especificação visual e de experiência.

Deve definir:

- fluxo do usuário;
- mapa de telas;
- hierarquia da informação;
- direção visual;
- design tokens;
- componentes;
- estados de carregamento, vazio, erro e sucesso;
- responsividade;
- acessibilidade;
- SEO quando aplicável;
- performance visual;
- critérios de aceite visual.

O documento deve ser salvo em:

```text
docs/design/DESIGN-NNN-descricao-curta.md
```

### 4. Implementação

O Desenvolvedor lê os documentos aprovados e implementa a solução.

A implementação pode abranger frontend e backend quando necessário para entregar o fluxo completo.

Antes de alterar arquivos, o Desenvolvedor deve:

1. Ler o `GEMINI.md` do projeto.
2. Ler o refinamento de negócio.
3. Ler o refinamento técnico.
4. Ler a especificação de design, quando existir.
5. Inspecionar padrões e componentes existentes.
6. Informar o plano e os arquivos afetados.

### 5. QA

O QA valida a implementação contra:

- requisitos de negócio;
- regras de negócio;
- critérios de aceite;
- refinamento técnico;
- especificação de design;
- testes automatizados;
- comportamento end-to-end.

Os achados devem informar severidade, passos para reprodução, resultado esperado, resultado obtido e evidências.

## Política de modelos

Use os modelos disponíveis de acordo com a complexidade da atividade.

| Atividade | Modelo recomendado |
|---|---|
| Product Owner | `gemini-3.1-flash-lite` |
| Refinamento de negócio | `gemini-3.1-flash-lite` |
| Documentação simples | `gemini-3.1-flash-lite` |
| Design e UX/UI | `gemini-3.1-flash-preview` |
| Desenvolvimento comum | `gemini-3.5-flash` |
| QA e testes | `gemini-3.5-flash` |
| Graphify | `gemini-3.1-flash-lite` |
| Arquiteto | `gemini-3.1-pro-preview` |
| Refinamento técnico | `gemini-3.1-pro-preview` |
| Segurança complexa | `gemini-3.1-pro-preview` |
| Refatoração ampla | `gemini-3.1-pro-preview` |

### Iniciar uma sessão

Refinamento de negócio:

```bash
gemini --model gemini-3.1-flash-lite
```

Refinamento técnico:

```bash
gemini --model gemini-3.1-pro-preview
```

Design:

```bash
gemini --model gemini-3.1-flash-preview
```

Desenvolvimento:

```bash
gemini --model gemini-3.5-flash
```

QA:

```bash
gemini --model gemini-3.5-flash
```

Use o Pro somente quando a tarefa exigir decisão arquitetural, análise complexa, segurança, performance ou investigação difícil.

## Múltiplos agentes

Múltiplos agentes podem ser utilizados quando as responsabilidades estiverem bem separadas.

Regras:

- não permita que dois agentes editem o mesmo arquivo simultaneamente;
- defina o escopo de cada agente;
- compartilhe o contrato entre frontend e backend;
- use um agente coordenador para integrar o resultado;
- execute testes integrados depois da combinação;
- resolva conflitos antes de considerar a tarefa concluída.

Use um único agente full-stack quando a funcionalidade for pequena ou possuir forte acoplamento entre frontend e backend.

## Documentação

A documentação deve permanecer próxima do projeto ao qual pertence.

- negócio: `docs/produtos/`;
- arquitetura: `docs/arquitetura/`;
- design: `docs/design/`;
- API: `docs/api/`;
- testes: `docs/testes/`;
- operações: `docs/operacoes/`.

Não sobrescreva documentos anteriores. Use versionamento, referências e histórico de decisões quando necessário.

## Segurança

Nunca:

- inclua API keys no código;
- salve tokens em `settings.json`;
- versione arquivos `.env` com segredos;
- exponha credenciais em documentos;
- execute comandos destrutivos sem confirmação;
- altere arquivos fora do escopo;
- faça deploy sem autorização.

Use variáveis de ambiente e mantenha arquivos sensíveis no `.gitignore`.

## Comandos úteis

Listar agentes:

```text
/agents
```

Listar skills:

```text
/skills
```

Recarregar skills, quando suportado:

```text
/skills reload
```

Selecionar modelo:

```text
/model
```

Gerar mapa do projeto com Graphify:

```text
/graphify .
```

Verificar RTK:

```bash
rtk --version
rtk gain
```

## Critério de conclusão

Uma tarefa está concluída somente quando:

- o requisito foi atendido;
- os critérios de aceite foram verificados;
- frontend e backend estão compatíveis;
- testes relevantes foram executados;
- documentação necessária foi atualizada;
- pendências críticas foram informadas;
- arquivos alterados foram listados;
- comandos executados foram informados;
- riscos conhecidos foram registrados.

## Comunicação

Responda em português, salvo solicitação contrária.

Diferencie sempre:

- fato encontrado;
- recomendação;
- hipótese;
- decisão aprovada;
- pendência;
- risco.

Quando houver ambiguidade, faça uma pergunta objetiva, sugira opções e permita uma resposta personalizada.

Se uma ação puder alterar arquivos, executar comandos destrutivos, modificar infraestrutura ou gerar cobrança, peça confirmação antes de executá-la.
