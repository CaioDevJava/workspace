---
name: uso-lib-componentes
description: Guia e diretrizes para o agente desenvolvedor utilizar a biblioteca de componentes Angular (@workspace/component-library-angular) no desenvolvimento frontend.
kind: local
model: GPT-6-Luna
---

# Skill: Uso da Biblioteca de Componentes Angular (`@workspace/component-library-angular`)

## Objetivo

Orientar o agente desenvolvedor na correta importação, configuração e utilização dos componentes reutilizáveis do Design System em aplicações Angular 19 (como o projeto `loja-laticinios/frontend`).

## Regras Fundamentais

1. **Standalone Components**: Todos os componentes da biblioteca são *standalone*. Sempre importe explicitamente o componente desejado no array `imports` do seu componente Angular.
2. **Estilos Globais**: Certifique-se de que os estilos e design tokens da biblioteca estão importados no arquivo `styles.scss` da aplicação consumidora.
3. **Consistência de Estados**: Utilize as propriedades de `state` (`success`, `error`, `warning`) e `helperText` nos campos de formulário (`BaseInput`, `BaseSelect`) em vez de estilizações manuais isoladas.
4. **Acessibilidade (A11y)**: Respeite a estrutura semântica dos componentes, utilizando rótulos, botões de fechamento e atributos ARIA já embutidos.

---

## 📋 Catálogo de Componentes Disponíveis

| Componente | Seletor | Descrição Principal |
|---|---|---|
| `BaseButton` | `<base-button>` | Botões com variantes (`primary`, `success`, `warning`, `danger`, `ghost`) e `loading`. |
| `BaseInput` | `<base-input>` | Campo de texto com suporte a rótulo, validação de estado e `helperText`. |
| `BaseSelect` | `<base-select>` | Menu suspenso (*select*) com opções tipadas e estados visuais. |
| `BaseCard` | `<base-card>` | Contêiner genérico com título opcional, imagem de capa e efeito hover. |
| `BaseGrid` | `<base-grid>` | Layout em grade (*CSS Grid*) responsivo para organizar cards e outros elementos. |
| `BaseTab` | `<base-tab>` | Navegação por abas com suporte a múltiplos itens e conteúdo dinâmico. |
| `BaseToggle` | `<base-toggle>` | Switch acessível com suporte a estado ativado/desativado. |
| `BaseTitle` | `<base-title>` | Títulos tipográficos (`h1`–`h6`) com variações de gradiente. |
| `BaseCarousel`| `<base-carousel>`| Carrossel com autoplay (5s), setas de navegação, indicadores e cliques de redirecionamento. |
| `BaseModal` | `<base-modal>` | Janela modal com suporte a conteúdo arbitrário, ESC, backdrop e tamanhos (`sm`, `md`, `lg`). |
| `BaseToast` | `<base-toast>` | Notificações flutuantes temporárias com barra de progresso animada e bordas coloridas. |
| `BaseChip` | `<base-chip>` | Etiquetas (*pills*) arredondadas com suporte a texto, botão "x" de remoção e cores customizadas. |
| `BaseTooltip` | `<base-tooltip>`| Dicas flutuantes com quebra de linha (*multiline*) e limite de caracteres (*maxLength*). |
| `BaseCheckbox`| `<base-checkbox>`| Caixa de seleção com rótulo e acessibilidade. |
| `BaseDropdown`| `<base-dropdown>`| Menu suspenso flutuante com glassmorphism. |
| `BaseLink` | `<base-link>` | Hiperlinks estilizados. |
| `BaseIcon` | `<base-icon>` | Wrapper para ícones SVG. |
| `BaseTable` | `<base-table>` | Tabela de dados corporativa com cabeçalhos em caixa alta e estado vazio. |

---

## 💡 Exemplo de Uso Prático em um Componente Angular

```typescript
import { Component } from '@angular/core';
import { 
  BaseTitle, 
  BaseGrid, 
  BaseCard, 
  BaseInput, 
  BaseSelect, 
  BaseButton, 
  BaseToast, 
  BaseToggle,
  BaseTab
} from '@workspace/component-library-angular';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    BaseTitle, 
    BaseGrid, 
    BaseCard, 
    BaseInput, 
    BaseSelect, 
    BaseButton, 
    BaseToast, 
    BaseToggle,
    BaseTab
  ],
  template: \`
    <div style="padding: 2rem;">
      <base-title level="h1" text="Painel Administrativo" variant="gradient" />
      
      <base-grid [columns]="2" gap="1.5rem" style="margin-top: 1.5rem;">
        <base-card title="Configurações de Perfil">
          <base-input label="E-mail" placeholder="usuario@empresa.com" state="success" helperText="E-mail verificado" />
          <base-select label="Perfil" [options]="[{value: 'admin', label: 'Administrador'}, {value: 'user', label: 'Usuário'}]" />
          <div style="margin-top: 1rem;">
            <base-toggle label="Receber alertas por e-mail" [checked]="true" />
          </div>
          <div style="margin-top: 1rem;">
            <base-button label="Salvar Alterações" variant="primary" />
          </div>
        </base-card>
      </base-grid>

      <base-toast message="Dados atualizados com sucesso!" variant="success" [duration]="4000" />
    </div>
  \`
})
export class DashboardComponent {}
```
