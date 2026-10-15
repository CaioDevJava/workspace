---
name: execucao-desenvolvimento
description: Executa a implementação do código full-stack em repos/, cria testes unitários e de integração, aplica os padrões de CODING_STANDARDS.md e atualiza os status no TODO.md.
kind: local
model: GPT-5.5
---

# Skill: Execução de Desenvolvimento e Testes

## Diretrizes Mandatórias de Código (`docs/CODING_STANDARDS.md`)

Ao escrever ou refatorar qualquer arquivo dentro de `repos/`, você DEVE seguir rigorosamente:

1. **Classes e Métodos Utilitários Estáticos:**
   - Métodos puros, formatações de data/moeda, máscaras e validações sem estado interno devem ser isolados em **classes utilitárias com métodos estáticos** (ex: `DateUtils.formatToIso()`, `CpfValidator.isValid()`).
2. **Componentização Genérica e Flexível (Frontend):**
   - Crie componentes visuais (ex: `Card`, `DataGrid`, `CustomTable`) totalmente desacoplados da lógica de domínio.
   - Utilize props, slots ou children flexíveis para que os componentes possam ser reutilizados em qualquer outra tela do sistema.
3. **Feedbacks Exclusivamente por Modais:**
   - Todas as notificações de sucesso, erro de validação/integração, alertas e confirmações de ação devem ser exibidas através de **modais/diálogos reaproveitáveis** (ex: `FeedbackModal`), eliminando mensagens soltas no layout ou `alert()` nativo.
4. **Clean Code e Limite de Tamanho:**
   - Funções e métodos devem ter responsabilidade única e tamanho máximo de 20 a 30 linhas. Refatore métodos grandes em submétodos privados ou utilitários estáticos.

---

## Processo Executivo de Desenvolvimento

1. **Leitura e Contexto:**
   - Acesse a pasta da história `docs/refinamentos/{REF-NNN-nome-da-historia}/`.
   - Leia o plano de tarefas `tarefas.md`, a especificação técnica `refinamento-tecnico.md`, a especificação de design `refinamento-design.md` e as tags SEO em `refinamento-seo.md`.
   - Inspecione a imagem do protótipo visual em `prototipo/prototipo-tela.png`.

2. **Implementação em `repos/`:**
   - **Backend:** Implemente controladores, DTOs, regras de negócio e integrações conforme contratos de API definidos pelo Arquiteto.
   - **Frontend:** Construa a interface alinhada ao protótipo visual, conecte os componentes genéricos aos contratos do backend e garanta a inclusão dos metadados/SEO no `<head>`.

3. **Criação e Execução de Testes:**
   - Escreva suítes de testes unitários e de integração para cobrir fluxos principais e exceções.
   - Execute a validação local do repositório:
     ```bash
     npm test
     npm run lint
     npm run build
     ```
   - *(Ajuste para Maven/Gradle em projetos Java/Spring Boot quando aplicável).*

---

## Gestão de Status e Atualização do Painel (`docs/TODO.md`)

Ao finalizar o código e confirmar a aprovação de todos os testes locais:
1. Atualize o campo `Status` no arquivo `docs/refinamentos/{REF-NNN-nome-da-historia}/refinamento-negocio.md` para **`DESENVOLVIDO`** (ou `DISPONIVEL PARA TESTES`).
2. Atualize o painel central `docs/TODO.md`:
   - **Estado Atual:** `DESENVOLVIDO` (ou `DISPONIVEL PARA TESTES`)
   - **Situação Geral:** Mantenha **`PENDENTE`** (só passa a `CONCLUÍDO` após a etapa de QA/Testado).
   - **Próximo Agente:** `QA`

---

## Validação Interativa no Terminal

Antes de confirmar a alteração no `TODO.md` e encerrar a execução, exiba o menu de validação no terminal:

```text
=========================================
IMPLEMENTAÇÃO E TESTES CONCLUÍDOS
=========================================
A história [REF-NNN-nome-da-historia] foi implementada em repos/ e validada.

Resumo da Execução:
- Arquivos Alterados/Criados: [Lista dos principais arquivos em repos/]
- Padrões Aplicados: Utilitários estáticos, componentes genéricos e modais de feedback.
- Suíte de Testes: Todos os testes passaram com sucesso (0 falhas).

Como deseja prosseguir?
[1] Sim (Aprovar implementação, atualizar status para DESENVOLVIMENTO/DISPONIVEL PARA TESTES e atualizar TODO.md)
[2] Não (Desfazer alterações do código)
[3] Outro (Digite abaixo correções, refatorações ou ajustes necessários no código)

> Aguardando sua resposta...