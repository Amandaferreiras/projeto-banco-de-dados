# Sistema de Gerenciamento de Vendas

Este projeto tem como objetivo modelar e implementar um banco de dados relacional para um sistema de gerenciamento de vendas. A solução abrange o controle de funcionários, clientes, fornecedores, produtos, vendas e itens das vendas, possibilitando uma estrutura robusta e consistente para armazenamento e consulta de dados comerciais.

## Estrutura do Projeto

O banco de dados é composto pelas seguintes entidades principais:

- **Funcionários**: responsáveis por realizar as vendas.
- **Clientes**: realizam compras no sistema.
- **Fornecedores**: fornecem os produtos vendidos.
- **Produtos**: itens disponíveis para venda.
- **Vendas**: transações realizadas pelos clientes.
- **Itens da Venda**: produtos específicos associados a cada venda.

## Diagrama MER e DER

### Modelo Entidade-Relacionamento (MER)

![MER](./01f00a7b-3b24-4099-bd2e-ca323cd88223.png)

### Diagrama Entidade-Relacionamento (DER)

![DER](./e0d52afb-3a45-4aa0-8714-1775cb002dca.png)

## Estrutura de Tabelas

O script `scriptAmanda_.sql` cria e popula as seguintes tabelas:

- `Funcionarios`
- `Clientes`
- `Fornecedores`
- `Produtos`
- `Vendas`
- `Itens_da_Venda`

O script também inclui comandos de `SELECT`, `UPDATE` e `DELETE` para manipulação e análise dos dados.

## Tecnologias Utilizadas

- **SGBD**: MySQL
- **Ferramentas de modelagem**:
  - MySQL Workbench
  - Draw.io (diagrams.net)
- **Linguagem SQL**: para criação e manipulação das tabelas e registros

## Como Executar Localmente

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
