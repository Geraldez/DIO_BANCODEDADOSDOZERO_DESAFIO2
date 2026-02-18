# Sistema de Gerenciamento de Oficina Mecânica 🚗🔧

Este projeto consiste na modelagem e implementação de um banco de dados para controle de ordens de serviço em uma oficina mecânica. O desafio faz parte da formação em Banco de Dados, focando em conceitos de modelagem lógica, scripts DDL, DML e consultas complexas (DQL).

## 🚀 Estrutura do Projeto

O projeto foi organizado em arquivos separados para facilitar a manutenção e leitura:
1.  **`cria_tabelas_ddl.sql`**: Contém a definição de todas as tabelas, chaves primárias e estrangeiras.
2.  **`insercao_de_dados_dml.sql`**: Script para o povoamento do banco com dados de teste.
3.  **`consulta_dql.sql`**: Consultas SQL que respondem a perguntas de negócio e atendem aos requisitos do desafio.

## 🛠️ Refinamentos e Decisões Técnicas

Durante o desenvolvimento, foram aplicados os seguintes refinamentos:
- **Padronização CamelCase**: Todas as colunas foram nomeadas seguindo o padrão `idCliente`, `idEquipe`, etc., garantindo consistência visual e técnica.
- **Correção de Relacionamentos**: Ajuste na tabela `OrdemdeServico` para alinhar a coluna `idEquipe` com sua respectiva Constraint, resolvendo o erro de referência de chave estrangeira.
- **Flexibilidade no Cadastro**: Remoção da restrição `UNIQUE` na data de cadastro para evitar erros de inserção simultânea (Erro 1062).

## 📊 Requisitos Atendidos (DQL)

As consultas criadas cobrem todos os tópicos exigidos no desafio:
- **Recuperações Simples**: Listagem geral de clientes e veículos.
- **Filtros (WHERE)**: Busca por marcas específicas e status de serviços.
- **Atributos Derivados**: Cálculo automático de comissões (5%) e taxas administrativas (10%) sobre o valor dos serviços.
- **Ordenações (ORDER BY)**: Organização de dados por nome, ano e valor.
- **Junções (JOIN)**: Consultas complexas unindo Cliente, Veículo, Ordem de Serviço e Pagamento para fornecer um histórico detalhado.
- **Agrupamentos e Filtros de Grupo (HAVING)**: Identificação de faturamento total por equipe técnica.

## 📋 Como executar
1. Execute o script `cria_tabelas_ddl.sql` para gerar a estrutura.
2. Execute o script `insercao_de_dados_dml.sql` para popular as tabelas.
3. Utilize as queries em `consulta_dql.sql` para visualizar os resultados.

---
Projeto desenvolvido como parte do desafio de formação em Banco de Dados.
