---
name: quebra-de-tarefas
description: Converte os refinamentos técnico, visual e de SEO em um plano de tarefas ordenado (tarefas.md) na pasta da história e atualiza o TODO.md.
kind: local
model: GPT-5.5
---

# Skill: Quebra de Tarefas Técnicas

## Local Obrigatório de Saída

O plano de tarefas deve ser salvo na **pasta exclusiva da história**:

`docs/refinamentos/{REF-NNN-nome-da-historia}/tarefas.md`

---

## Leitura Obrigatória de Padrões (`docs/CODING_STANDARDS.md`)

Antes de decompor e categorizar as tarefas:
1. Consulte o arquivo `docs/CODING_STANDARDS.md`.
2. Certifique-se de prever tarefas para criação/reuso de classes utilitárias estáticas, componentes genéricos de UI e modais de feedback/notificação.

---

## Processo de Decomposição

1. **Análise dos Insumos da História:**
   - Leia `refinamento-negocio.md`, `refinamento-tecnico.md`, `refinamento-design.md` e `refinamento-seo.md`.
   - Inspecione o protótipo visual em `prototipo/prototipo-tela.png`.
2. **Decomposição Granular & Modular:**
   - Crie tarefas de escopo fechado e testáveis (Estrutura, Backend, Frontend, Contratos, SEO/Metadados, Testes).
   - Identifique oportunidades para isolar métodos puros em utilitários e extrair componentes genéricos (ex: Cards, Modais).
   - Estime o tamanho relativo (`P`, `M`, `G`) e atribua identificadores (`T-001`, `T-002`).
   - Mapeie dependências diretas entre as tarefas.

---

## Gestão de Status (`docs/TODO.md`)

Ao salvar o arquivo `tarefas.md`:
- **Estado Atual da História:** Mantém `PRONTO PARA DESENVOLVIMENTO`.
- **Situação Geral:** `PENDENTE`.
- **Próximo Agente:** `Desenvolvedor` (para início da implementação técnica).

---

## Formato Obrigatório do Arquivo (`tarefas.md`)

```markdown
# TAREFAS — Plano de Implementação: [Título da História]

- Refinamento Origem: docs/refinamentos/REF-NNN-nome-da-historia/
- Guia de Padrões: docs/CODING_STANDARDS.md
- Status: PRONTO PARA DESENVOLVIMENTO
- Estimativa Total: [Soma relativa: Ex: 2P, 3M]

## 1. Ordem Recomendada de Execução
1. T-001 (Backend / Contrato / Utilitários) -> 2. T-002 (Frontend / Componentes Genéricos) -> 3. T-003 (Integração, Modais & SEO) -> 4. T-004 (Testes)

## 2. Detalhamento das Tarefas

### T-001 — [Título da Tarefa]
- **Categoria:** [Backend / Frontend / Contrato / SEO / Testes]
- **Objetivo:** ...
- **Arquivos Afetados:** `repos/nome-do-projeto/...`
- **Critério de Aceite Técnico:** ...
- **Estimativa:** [P / M / G]

---

## 3. Cobertura de Testes e Requisitos
| Requisito / Critério de Aceite | Tarefa Técnica Relacionada | Tipo de Teste |
|---|---|---|
| RF-001 / CA-001 | T-001 | Unitário / Integração |