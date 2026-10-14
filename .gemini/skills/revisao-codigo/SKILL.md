---
name: revisao-codigo
description: Audita código em repos/ usando padrões SonarQube e CODING_STANDARDS.md, gerando revisao-codigo.md e atualizando o TODO.md.
kind: local
model: GPT-5.6-Terra
---

# Skill: Revisão de Código e Quality Gate (SonarQube)

## Local Obrigatório de Saída

O relatório de auditoria deve ser salvo na **pasta exclusiva da história**:

`docs/refinamentos/{REF-NNN-nome-da-historia}/revisao-codigo.md`

---

## Matriz de Inspeção SonarQube (`Quality Gate`)

Avalie as alterações em `repos/` nos 5 eixos estratégicos do SonarQube:

1. **Reliability (Confiabilidade / Bugs):**
   - Identifique NullPointerExceptions potenciais, recursos não fechados, retornos ausentes e condições sempre verdadeiras/falsas.
2. **Security (Segurança & Hotspots):**
   - Garanta **zero** senhas/tokens hardcoded.
   - Verifique injeções (SQL/NoSQL/XSS), falta de sanitização e uso de algoritmos criptográficos fracos.
3. **Maintainability (Manutenibilidade & Code Smells):**
   - **Complexidade Ciclomática:** Métodos com muitos `if/else` ou laços aninhados devem ser simplificados.
   - **Tamanho Limite:** Métodos com mais de 20-30 linhas devem ser extraídos para **classes utilitárias estáticas** (`DateUtils`, `ValidationUtils`, etc.).
   - **Dead Code:** Identifique e solicite a remoção de variáveis, imports ou parâmetros não utilizados.
4. **Duplications (Código Duplicado):**
   - Reprove trechos de código idênticos ou redundantes que deveriam ser isolados em funções utilitárias ou componentes genéricos de frontend.
5. **Coverage & Testability (Testabilidade):**
   - Confirme a existência de testes unitários e de integração cobrindo fluxos principais e exceções.

---

## Leitura Obrigatória de Padrões (`docs/CODING_STANDARDS.md`)

Inspecione também a aderência às convenções internas do projeto:
- Nomenclaturas (`camelCase`, `PascalCase`, `kebab-case`).
- Notificações visuais no frontend sendo exibidas exclusivamente através de **modais/diálogos padronizados**.
- Componentes de interface genéricos e flexíveis (ex: Cards, Tabela).

---

## Processo de Revisão

1. **Mapeamento de Diff:** Inspecione os arquivos em `repos/nome-do-projeto/`.
2. **Classificação do Quality Gate:**
   - **`PASSED`:** Zero bugs graves, zero vulnerabilidades, alta manutenibilidade e conformidade com `CODING_STANDARDS.md`.
   - **`FAILED`:** Presença de bloqueadores (Security/Bugs/Code Smells graves) exigindo refatoração pelo Desenvolvedor.

---

## Gestão de Status (`docs/TODO.md`)

Ao salvar `revisao-codigo.md`:
- **Se PASSED:**
  - **Estado Atual:** `DISPONIVEL PARA TESTES`
  - **Situação Geral:** `PENDENTE`
  - **Próximo Agente:** `QA`
- **Se FAILED:**
  - **Estado Atual:** `DESENVOLVIDO` (Mantido em ajuste)
  - **Situação Geral:** `PENDENTE`
  - **Próximo Agente:** `Desenvolvedor`

---

## Formato Obrigatório do Arquivo (`revisao-codigo.md`)

```markdown
# AUDITORIA — Quality Gate & Revisão de Código: [Título da História]

- Refinamento Origem: docs/refinamentos/REF-NNN-nome-da-historia/
- Guia de Padrões Avaliado: docs/CODING_STANDARDS.md
- Veredito do Quality Gate (SonarQube): [PASSED / FAILED]
- Data: YYYY-MM-DD

## 1. Métricas SonarQube

| Eixo de Análise | Status | Problemas Encontrados |
|---|---|---|
| Confiabilidade (Bugs) | [OK / FAILED] | 0 NPK, 0 retornos ausentes |
| Segurança (Vulnerabilidades) | [OK / FAILED] | Sem tokens expostos |
| Manutenibilidade (Code Smells) | [OK / FAILED] | Complexidade ciclomática sob controle |
| Duplicações | [OK / FAILED] | Reuso de utilitários e componentes OK |
| Testabilidade | [OK / FAILED] | Testes cobrem exceções |

## 2. Aderência ao CODING_STANDARDS.md
- **Métodos Utilitários Estáticos:** [Conforme / PENDENTE]
- **Tamanho do Método (< 30 linhas):** [Conforme / PENDENTE]
- **Componentes Genéricos (Frontend):** [Conforme / PENDENTE]
- **Notificações por Modais:** [Conforme / PENDENTE]

## 3. Apontamentos SonarQube e Solicitações de Ajuste (Se FAILED)
1. **[Code Smell / Severidade: Alta]**
   - **Arquivo:** `repos/projeto/src/services/PaymentService.ts` (Linha 32)
   - **Violação:** Método com complexidade ciclomática elevada (14 rotas condicionais).
   - **Ação Requerida:** Extrair a validação para a classe utilitária estática `PaymentValidationUtils`.

## 4. Próximos Passos
> [Quality Gate PASSED. Código aprovado e enviado ao Agente QA / Quality Gate FAILED. Retornado ao Desenvolvedor para refatoração.]