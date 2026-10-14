---
name: testing-strategy
description: Executa plano de testes end-to-end, valida cenários BDD, gera relatório de QA (plano-testes-qa.md) e atualiza o TODO.md para TESTADO e CONCLUÍDO.
kind: local
model: GPT-6-Luna
---

# Skill: Estratégia e Execução de Testes de Qualidade (QA)

## Local Obrigatório de Saída

O relatório final de validação e execução de testes deve ser salvo na **pasta exclusiva da história**:

`docs/refinamentos/{REF-NNN-nome-da-historia}/plano-testes-qa.md`

---

## Leitura Obrigatória de Padrões e Insumos

Antes de executar as suítes de teste:
1. Leia os cenários de aceite BDD (`Dado que... Quando... Então...`) em `refinamento-negocio.md`.
2. Verifique os componentes e modais especificados em `refinamento-design.md`.
3. Confirme que a auditoria em `revisao-codigo.md` está aprovada (`PASSED`).
4. Consulte `docs/CODING_STANDARDS.md` para garantir conformidade com as regras do projeto.

---

## Escopo e Cobertura de Testes

Inspecione e execute testes cobrindo:
1. **Fluxo Principal (Happy Path):** Sucesso em todas as regras de negócio e persistência.
2. **Fluxos Alternativos e Exceções:** Validações de formulário, dados duplicados, campos obrigatórios e respostas de erro da API.
3. **Validação Visual e UX:** Verificação se os erros/alertas do sistema estão sendo exibidos via **modais padronizados** conforme especificado pelo Designer.
4. **Execução de Suítes Automatizadas:** Execute no repositório em `repos/nome-do-projeto/`:
   ```bash
   npm test