--  Scripts DQL para o Deafio do Projeto - Consultas

-- 1: Quais são os serviços mais caros do catalogo de serviços
SELECT tipo, valor 
    FROM TabServico
    WHERE valor > (SELECT AVG(valor) FROM TabServico)--  a subquery verifica a media e o resultado da consulta e um valor maior que o medio
    ORDER BY valor DESC;

-- 2: Pergunta: Listar todos os serviços em ordem alfabética para facilitar a busca.
SELECT tipo,valor
    FROM TabServico
    ORDER BY tipo ASC;


-- 3: listar os clientes cadastrados nome, email e telefone
SELECT nome, telefone, email 
    FROM Cliente 
    ORDER BY nome ASC;


-- 4:  Pergunta: Quem são nossos clientes e há quanto tempo (em anos) estão conosco?
SELECT 
    nome AS Cliente, 
    data_Cadastro AS Data_De_Cadastro,
    TIMESTAMPDIFF(YEAR, data_Cadastro, CURDATE()) AS Tempo_De_Cadastro
    FROM Cliente
    ORDER BY Tempo_De_Cadastro DESC, nome ASC;
     
-- 5:  Pergunta: Quais os detalhes do serviço realizado para Ana Maria Martins?
SELECT 
    C.nome AS Cliente,
    V.modelo AS Carro,
    OS.descricaoDoServico AS Detalhe_Tecnico,
    OS.valor AS Valor_Servico,
    P.statusPagamento AS Situacao_Financeira
    FROM Cliente C
    INNER JOIN Veiculo V ON C.idCliente = V.idCliente
    INNER JOIN OrdemdeServico OS ON V.idVeiculo = OS.idVeiculo
    INNER JOIN Pagamento P ON OS.idOrdemDeServico = P.idOrdemDeServico
    WHERE C.nome = 'Ana Maria Martins' 
    AND V.modelo = 'LXR 2.0';


-- 6: Pergunta: Qual o valor da comissão (5%) da equipe pelo serviço da Ana Maria Martins?
SELECT 
    C.nome AS Cliente,
    V.modelo AS Carro,
    OS.idEquipe AS Equipe_Responsavel,
    OS.valor AS Valor_Total_OS,
    ROUND(OS.valor * 0.05, 2) AS Valor_Comissao_Equipe
    FROM Cliente C
    INNER JOIN Veiculo V ON C.idCliente = V.idCliente
    INNER JOIN OrdemdeServico OS ON V.idVeiculo = OS.idVeiculo
    INNER JOIN Pagamento P ON OS.idOrdemDeServico = P.idOrdemDeServico
    WHERE C.nome = 'Ana Maria Martins' 
    AND V.modelo = 'LXR 2.0'
    AND P.statusPagamento = 'Pago';
  
-- 7:  Listar Cliente,Carro e equie responsavel pela manutençação 

SELECT C.nome AS Cliente, V.veiculo AS Carro, OS.idEquipe AS Equipe
    FROM Cliente C
    JOIN Veiculo V ON C.idCliente = V.idCliente
    JOIN OrdemdeServico OS ON V.idVeiculo = OS.idVeiculo;

-- 8:  Listar quais equipes possuem um volume de serviços aprovados acima de R$ 500,00

SELECT idEquipe, SUM(valor) AS total_produzido
    FROM OrdemdeServico
    WHERE status = 2
    GROUP BY idEquipe
HAVING total_produzido > 500.00;


-- 9: Qual o serviço mais realizado na oficina?

SELECT 
    TS.tipo AS Servico, 
    COUNT(SOS.idTabServico) AS Quantidade_Realizada
    FROM TabServico TS
    JOIN ServicoOS SOS ON TS.idTabServico = SOS.idTabServico
    GROUP BY TS.tipo
    ORDER BY Quantidade_Realizada DESC;
    
    