---
name: git-commit
description: Analisa o status do git em repos/, aplica Conventional Commits atrelados ao ID da história e solicita confirmação via terminal antes de commitar/push.
kind: local
model: GPT-6-Luna
---

# Skill: Versionamento Semântico e Git Commit

## Diretrizes de Versionamento (`Conventional Commits`)

Toda mensagem de commit gerada por esta skill DEVE seguir rigorosamente o padrão semântico:

`<tipo>(<escopo>): <descrição em português no imperativo> [REF-NNN]`

### Tipos Permitidos:
- **`feat`**: Nova funcionalidade ou recurso para a aplicação.
- **`fix`**: Correção de bug/defeito.
- **`docs`**: Alterações exclusivamente em arquivos de documentação (`docs/`).
- **`style`**: Ajustes de formatação, lint ou espaçamento que não alteram lógica.
- **`refactor`**: Mudança no código que não corrige bug nem adiciona funcionalidade (ex: extração de métodos utilitários estáticos).
- **`test`**: Adição ou correção de suítes de teste.
- **`chore`**: Atualização de dependências, builds ou configurações de ambiente.

---

## Leitura Obrigatória de Padrões (`docs/CODING_STANDARDS.md`)

1. Verifique se o arquivo `docs/CODING_STANDARDS.md` especifica alguma regra adicional de prefixo ou branch (ex: `feature/REF-001-cadastro-cliente`).
2. Garanta que o escopo e o título do commit referenciem o ID correto da história contido no diretório `docs/refinamentos/REF-NNN/`.

---

## Regra de Branch para Nova História

Toda nova história deve iniciar em uma branch criada a partir de `develop`.

- Regra obrigatória: nunca criar nova branch a partir de `main`, `master` ou outra feature em andamento.
- Fluxo obrigatório:
  ```bash
  git checkout develop
  git pull --ff-only origin develop
  git checkout -b feature/REF-001-nome-da-historia
  ```
- Convenção de nomenclatura recomendada:
  - `feature/REF-001-cadastro-cliente`
  - `feature/REF-023-refinamento-login`
- Se a branch atual não estiver baseada em `develop`, o fluxo deve corrigir isso antes de continuar.

## Processo de Execução

1. **Inspeção de Alterações no Git:**
   - Acesse o diretório do projeto em `repos/nome-do-projeto/`.
   - Execute a verificação das alterações pendentes:
     ```bash
     git status
     git diff --staged
     ```
2. **Classificação das Mudanças:**
   - Mapeie os arquivos modificados/criados em `repos/` e em `docs/refinamentos/REF-NNN/`.
   - Sugira o tipo (`feat`, `fix`, `docs`, etc.) e elabore o resumo claro em português.

3. **Sugestão do Comando Executável:**
   - Monte os comandos exatos que serão executados:
     ```bash
     git add .
     git commit -m "feat(cadastro): implementa fluxo de cadastro de cliente [REF-001]"
     ```

---

## Validação Interativa no Terminal

Antes de executar qualquer comando `git add` ou `git commit` no repositório, interrompa a geração e exiba a prévia no terminal:

```text
=========================================
PREPARO DE GIT COMMIT
=========================================
História: [REF-NNN-nome-da-historia]
Branch Atual: [nome-da-branch]

Arquivos Detectados:
- [Lista dos arquivos alterados em repos/ e docs/]

Mensagem Sugerida:
> feat(escopo): descrição da alteração [REF-NNN]

Como deseja prosseguir?
[1] Sim (Executar git add, git commit com a mensagem acima e atualizar TODO.md)
[2] Não (Cancelar operação de commit)
[3] Outro (Digite abaixo uma nova mensagem de commit ou ajustes nos arquivos)

> Aguardando sua resposta...