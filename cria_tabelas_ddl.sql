-- Projeto Oficina Mecânica
CREATE DATABASE IF NOT EXISTS oficina_mecanica;
USE oficina_mecanica;

-- 1. Tabelas Base (Sem dependências de FK)
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    identificacao VARCHAR(45) NOT NULL,
    telefone VARCHAR(45),
    email VARCHAR(45),
    endereco VARCHAR(255),
    dataNascimento DATE, 
    data_Cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- UNIQUE removido para evitar erro 1062
);

CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(45),
    descricao VARCHAR(250),
    valor DECIMAL(13,2)
);

CREATE TABLE TabServico (
    idTabServico INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(250),
    valor DECIMAL(13,2)
);

-- 2. Tabelas com Relacionamentos
CREATE TABLE Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    veiculo VARCHAR(45),
    marca VARCHAR(45),
    modelo VARCHAR(45),
    ano INT,
    combustivel VARCHAR(45),
    idCliente INT,
    cor VARCHAR(45),
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(255),
    especialidade VARCHAR(45),
    equipe_Id INT,
    CONSTRAINT fk_mecanico_equipe FOREIGN KEY (equipe_Id) REFERENCES Equipe(idEquipe)
);

CREATE TABLE OrdemdeServico (
    idOrdemDeServico INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT,
    dataDeEmissao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(13,2),
    status TINYINT, -- 0-orcamento, 1-aguardando aprovação, 2-aprovado, 3-reprovado
    idEquipe INT, -- Padronizado para camelCase
    dataPrevisaoEntrega DATETIME,
    dataConclusao DATETIME,
    descricaoDoServico TEXT,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo),
    CONSTRAINT fk_os_equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe) -- Ajustado para evitar Erro 1072
);

-- 3. Tabelas Associativas (N:M)
-- Resolve o relacionamento entre Peças e Ordem de Serviço
CREATE TABLE PecaServico (
    idPeca INT,
    idOrdemDeServico INT,
    idVeiculo INT,
    quantidade INT,
    PRIMARY KEY (idPeca, idOrdemDeServico),
    CONSTRAINT fk_peca_servico_peca FOREIGN KEY (idPeca) REFERENCES Peca(idPeca),
    CONSTRAINT fk_peca_servico_os FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemdeServico(idOrdemDeServico)
);

-- NOVA: Resolve o relacionamento entre a Tabela de Serviços e a Ordem de Serviço
CREATE TABLE ServicoOS (
    idOrdemDeServico INT,
    idTabServico INT,
    quantidade INT DEFAULT 1,
    valorCobrado DECIMAL(13,2), -- Salva o valor da tabela no momento da OS
    PRIMARY KEY (idOrdemDeServico, idTabServico),
    CONSTRAINT fk_sos_os FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemdeServico(idOrdemDeServico),
    CONSTRAINT fk_sos_tab FOREIGN KEY (idTabServico) REFERENCES TabServico(idTabServico)
);

-- 4. Tabelas de Fechamento e Vinculação Final
CREATE TABLE Pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    valorPagamento DECIMAL(13,2),
    dataPagamento DATETIME,
    formaPagamento VARCHAR(45),
    statusPagamento VARCHAR(45),
    idOrdemDeServico INT,
    CONSTRAINT fk_pagamento_os FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemdeServico(idOrdemDeServico)
);

CREATE TABLE VeiculoEquipe (
    IdCliente INT,
    idEquipe INT,
    idOrdemDeServico INT,
    idVeiculo INT,
    PRIMARY KEY (IdCliente, idEquipe, idOrdemDeServico, idVeiculo),
    CONSTRAINT fk_veq_cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_veq_equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe),
    CONSTRAINT fk_veq_os FOREIGN KEY (idOrdemDeServico) REFERENCES OrdemdeServico(idOrdemDeServico),
    CONSTRAINT fk_veq_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);