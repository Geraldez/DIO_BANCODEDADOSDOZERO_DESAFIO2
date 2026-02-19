# Sistema de Gerenciamento de Oficina Mecânica 

Este projeto consiste na modelagem e implementação de um banco de dados relacional para o controle operacional de uma oficina mecânica, cobrindo desde o cadastro de clientes até a finalização do pagamento das Ordens de Serviço (OS).

##  Estrutura de Arquivos

Para garantir as boas práticas de desenvolvimento, o projeto foi segmentado nos seguintes arquivos:

1.  **`cria_tabelas_ddl.sql`**: Contém o script de **Data Definition Language**. Define toda a estrutura do banco, incluindo tabelas, chaves primárias, chaves estrangeiras e restrições de integridade.
2.  **`insercao_de_dados_dml.sql`**: Contém o script de **Data Manipulation Language**. Realiza o povoamento das tabelas com dados realistas para testes de fluxo de negócio.
3.  **`consulta_dql.sql`**: Contém o script de **Data Query Language**. Reúne as consultas complexas desenvolvidas para atender aos requisitos do desafio e gerar relatórios gerenciais.

##  Destaques da Modelagem: A Tabela `ServicoOS`

Um dos pontos centrais desta modelagem foi a criação da tabela **`ServicoOS`**. Ela atua como uma tabela associativa (N:M) entre a Ordem de Serviço e o catálogo de serviços (`TabServico`).

**Por que essa tabela é importante?**
- **Flexibilidade**: Permite que uma única Ordem de Serviço tenha múltiplos tipos de serviços vinculados (ex: Alinhamento + Troca de Óleo).
- **Histórico de Preços**: Armazena o `valorCobrado` no momento da execução, garantindo que, se o preço no catálogo (`TabServico`) mudar no futuro, o valor registrado na OS histórica permaneça intacto.



##  Requisitos Técnicos Implementados

O arquivo **`consulta_dql.sql`** demonstra o domínio das seguintes funcionalidades:
- **Agrupamentos**: `GROUP BY` para métricas de produtividade por equipe.
- **Ordenação**: `ORDER BY` para organizar o catálogo de serviços por valor e nome.
- **Filtros de Grupo**: `HAVING` para identificar equipes com faturamento acima da meta.
- **Subqueries**: Consultas avançadas para identificar serviços com valor acima da média.
- **Junções**: `JOIN` múltiplo entre Cliente, Veículo, OS e Serviços para visão 360º do atendimento.

##  Como Executar o Projeto
1. Crie o schema utilizando o arquivo `cria_tabelas_ddl.sql`.
2. Popule o banco com o arquivo `insercao_de_dados_dml.sql`.
3. Execute as análises contidas em `consulta_dql.sql`.

---
*Projeto desenvolvido como parte do desafio de formação em Banco de Dados da DIO.*
