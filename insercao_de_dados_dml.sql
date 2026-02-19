-- SCRIPT DE MANIPULAÇÃO (DML) - POVOAMENTO DA OFICINA
USE oficina_mecanica;

-- SCRIPT DE MANIPULAÇÃO (DML) - POVOAMENTO DA OFICINA
USE oficina_mecanica;

-- 1. CLIENTES
INSERT INTO Cliente (nome, identificacao, telefone, email, endereco, dataNascimento) VALUES
('Ana Maria Martins', '11122233344', '(11) 98888-1111', 'ana.martins@email.com', 'Rua das Flores, 123', '1985-05-15'),
('Carlos Ferreira Nascimento', '22233344455', '(21) 97777-2222', 'carlos.ferreira@email.com', 'Av. Brasil, 500', '1990-10-20');

-- 2. VEÍCULOS
INSERT INTO Veiculo (veiculo, marca, modelo, ano, combustivel, cor, idCliente) VALUES
('Civic', 'Honda', 'LXR 2.0', 2020, 'Flex', 'Prata', 1),        
('Passat', 'Volkswagen', 'Highline 2.0 TSI', 2019, 'Gasolina', 'Preto', 2);

-- 3. EQUIPES E MECÂNICOS
INSERT INTO Equipe () VALUES (), (); -- Cria duas equipes para o sistema

INSERT INTO Mecanico (nome, endereco, especialidade, equipe_Id) VALUES
('Roberto Alinhador', 'Rua A, 10', 'Suspensão', 1),
('Márcio Lanternagem', 'Rua C, 30', 'Funilaria', 2);

-- 4. CATÁLOGO DE PEÇAS E SERVIÇOS (TABELAS DE REFERÊNCIA)
INSERT INTO Peca (codigo, descricao, valor) VALUES 
('FILT-01', 'Filtro de Óleo', 45.00), 
('OLEO-5W30', 'Óleo Sintético 1L', 65.00);

-- Inserindo os serviços originais e os 4 novos tipos solicitados
INSERT INTO TabServico (tipo, valor) VALUES 
('Troca de Óleo', 100.00), 
('Alinhamento', 150.00),
('Revisão Geral', 300.00),
('Balanceamento de Rodas', 80.00),
('Limpeza de Sistema de Arrefecimento', 220.00),
('Higienização de Ar Condicionado', 120.00),
('Diagnóstico via Scanner', 180.00);

-- 5. ORDEM DE SERVIÇO (CONSOLIDADO)
-- OS 1: Status 2 (Aprovado), vinculada à Equipe 1 (Roberto Alinhador)
INSERT INTO OrdemdeServico (idVeiculo, valor, status, idEquipe, dataPrevisaoEntrega, descricaoDoServico) VALUES
(1, 450.00, 2, 1, '2026-02-25 10:00:00', 'Revisão e Troca de itens básicos.');

-- 6. DETALHAMENTO DA OS (VINCULANDO SERVIÇOS E PEÇAS)
-- Vinculando 1 'Revisão Geral' (id 3) à OS 1
INSERT INTO ServicoOS (idOrdemDeServico, idTabServico, quantidade, valorCobrado) 
VALUES (1, 3, 1, 300.00);

-- Vinculando 1 'Filtro de Óleo' (id 1) à OS 1
INSERT INTO PecaServico (idPeca, idOrdemDeServico, idVeiculo, quantidade) 
VALUES (1, 1, 1, 1);

-- 7. PAGAMENTO (FINALIZANDO O CICLO)
INSERT INTO Pagamento (valorPagamento, dataPagamento, formaPagamento, statusPagamento, idOrdemDeServico) VALUES
(450.00, '2026-02-18 16:30:00', 'Cartão de Crédito', 'Pago', 1);

-- 8. VINCULAÇÃO FINAL NA TABELA VEICULOEQUIPE
INSERT INTO VeiculoEquipe (IdCliente, idEquipe, idOrdemDeServico, idVeiculo)
VALUES (1, 1, 1, 1);ta