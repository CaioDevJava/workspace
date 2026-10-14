# Guia de Nomenclatura e Boas Práticas de Código

## 1. Nomenclaturas Gerais
- **Variáveis e Funções:** `camelCase` (ex: `calculateTotal`, `userId`).
- **Classes, Interfaces e Tipos:** `PascalCase` (ex: `UserService`, `CreateUserDto`).
- **Arquivos e Pastas:** `kebab-case` (ex: `user-service.ts`, `create-user.dto.ts`).
- **Constantes:** `UPPER_SNAKE_CASE` (ex: `MAX_RETRY_COUNT`).
- **Tabelas e Colunas de Banco:** `snake_case` (ex: `user_account`, `created_at`).

## 2. Padrões de Projeto & Arquitetura
- **Estrutura:** Clean Architecture / Layered Architecture (Controller -> Service -> Repository).
- **Injeção de Dependência:** Sempre via construtor.
- **Tratamento de Erros:** Não use `try/catch` genéricos sem log ou re-throw. Use exceções de domínio customizadas ou filtros globais de exceção.
- **Código Limpo (SOLID):**
  - Funções pequenas e com responsabilidade única (máximo 20-30 linhas por método).
  - Evite *magic numbers/strings*; use enums ou constantes.

## 3. APIs e Contratos REST
- **Rotas:** Sempre no plural e `kebab-case` (ex: `GET /api/v1/user-accounts`).
- **Respostas de Erro:** Padrão RFC 7807 / DTO de erro único contendo `{ statusCode, message, timestamp, path }`.

## 4. Testes
- **Nomenclatura de Arquivos de Teste:** `{nome-do-arquivo}.spec.ts` ou `{nome-do-arquivo}.test.ts`.
- **Estrutura BDD/AAA:** Arrange, Act, Assert (ou `describe / it`).

## 5. Arquitetura de Código e Componentização

### Backend & Lógica Reutilizável
- **Funções Utilitárias Puramente Lógicas:** Sempre que uma função/método não depender do estado da classe e for reutilizável em múltiplos pontos, implemente-a como uma **classe utilitária com métodos estáticos** (ex: `DateUtils.formatToIso()`, `StringUtils.sanitizeCpf()`).
- **Tamanho Limite:** Métodos não devem ultrapassar 20-30 linhas de código. Funções extensas devem ser refatoradas e divididas respeitando o Princípio da Responsabilidade Única (SRP).
- **Legibilidade:** Priorize código legível, autoexplicativo e bem estruturado sobre soluções complexas/obscuras em uma única linha.

### Frontend & Componentes Genéricos
- **Atomicidade e Reutilização:** Componentes de interface devem ser genéricos, desacoplados e flexíveis a mudanças (ex: `Card`, `Modal`, `DataGrid`).
  - *Exemplo:* Um `Card` não deve conter lógica rígida de um produto específico; ele deve receber conteúdos e ações via *slots*, *children* ou *props* flexíveis, permitindo seu reuso em qualquer página do sistema.
- **Notificações e Modais:** Feedbacks visuais do sistema (mensagens de sucesso, erro, confirmação e alertas) **devem obrigatoriamente ser exibidos através de modais/diálogos padronizados** (ex: `FeedbackModal`), em vez de mensagens estáticas ou alert nativo do navegador.