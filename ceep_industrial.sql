-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/08/2026 às 22:36
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ceep_industrial`
--
CREATE DATABASE ceep_industrial;
USE ceep_industrial;
-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `descricao`, `ativo`) VALUES
(1, 'Sensores', 'Dispositivos de medição física', 1),
(2, 'Atuadores', 'Dispositivos de controle físico', 1),
(3, 'Controladores', 'CLPs e computadores industriais', 1),
(4, 'Acessórios', 'Cabos, conectores e suportes', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_cliente`, `email`, `data_nascimento`) VALUES
(1, 'Carlos Almeida', 'carlos.almeida@email.com', '1990-05-15'),
(2, 'Ana Júlia Silva', 'ana.julia@email.com', '1995-09-20'),
(3, 'João Vitor Souza', 'joao.vitor@email.com', '1988-12-05'),
(4, 'Maria Eduarda Mendes', 'maria.eduarda@email.com', '2001-03-12'),
(5, 'Roberto Santos', 'roberto.santos@email.com', '1993-07-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamentos`
--

CREATE TABLE `equipamentos` (
  `id_equipamento` int(11) NOT NULL,
  `nome_equipamento` varchar(100) NOT NULL,
  `setor` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'Ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `equipamentos`
--

INSERT INTO `equipamentos` (`id_equipamento`, `nome_equipamento`, `setor`, `status`) VALUES
(1, 'Injetora Plástica 01', 'Produção 01', 'Ativo'),
(2, 'Esteira Transportadora', 'Logística', 'Ativo'),
(3, 'Caldeira de Vapor', 'Utilidades', 'Manutenção');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `razao_social` varchar(150) NOT NULL,
  `cnpj` varchar(18) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `razao_social`, `cnpj`, `telefone`) VALUES
(1, 'Automação Brasil Ltda', '12.345.678/0001-90', '(11) 4002-8922'),
(2, 'Tech Industrial S/A', '98.765.432/0001-10', '(41) 3333-4444'),
(3, 'EletroCom Componentes', '55.666.777/0002-33', '(21) 98888-7777');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_funcionario` int(11) NOT NULL,
  `nome_func` varchar(100) NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `data_admissao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id_funcionario`, `nome_func`, `matricula`, `salario`, `data_admissao`) VALUES
(1, 'Pedro Rocha', 'FNC-001', 3500.00, '2022-01-10'),
(2, 'Luciana Ribeiro', 'FNC-002', 4200.00, '2021-06-15'),
(3, 'Marcos Souza', 'FNC-003', 2800.00, '2023-03-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `itens_pedido`
--

INSERT INTO `itens_pedido` (`id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 120.50),
(1, 3, 1, 189.90),
(2, 4, 1, 1500.00),
(3, 5, 1, 45.00),
(4, 2, 1, 350.00),
(4, 3, 1, 189.90),
(5, 2, 2, 350.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `data_pedido` date NOT NULL,
  `valor_total` decimal(10,2) DEFAULT 0.00,
  `id_cliente` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `data_pedido`, `valor_total`, `id_cliente`, `id_funcionario`) VALUES
(1, '2024-03-01', 329.90, 1, 1),
(2, '2024-03-02', 1500.00, 2, 2),
(3, '2024-03-05', 45.00, 3, 1),
(4, '2024-03-10', 540.00, 4, 3),
(5, '2024-03-15', 700.00, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL DEFAULT 0,
  `id_categoria` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome_produto`, `preco`, `estoque`, `id_categoria`, `id_fornecedor`) VALUES
(1, 'Sensor de Temperatura PT100', 120.50, 45, 1, 1),
(2, 'Sensor de Pressão Digital', 350.00, 12, 1, 1),
(3, 'Válvula Solenoide 24V', 189.90, 25, 2, 2),
(4, 'CLP Siemens S7-1200', 1500.00, 5, 3, 2),
(5, 'Cabo Shieldado 5m', 45.00, 100, 4, 3),
(6, 'Sensor Termopar Tipo K', 85.00, 0, 1, 2),
(7, 'Pistão Pneumático Duplo', 270.00, 15, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sensores`
--

CREATE TABLE `sensores` (
  `id_sensor` int(11) NOT NULL,
  `tipo_sensor` varchar(50) NOT NULL,
  `leitura` decimal(10,2) NOT NULL,
  `data_leitura` datetime DEFAULT current_timestamp(),
  `id_equipamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sensores`
--

INSERT INTO `sensores` (`id_sensor`, `tipo_sensor`, `leitura`, `data_leitura`, `id_equipamento`) VALUES
(1, 'Temperatura', 85.30, '2024-03-20 08:00:00', 1),
(2, 'Pressão', 4.20, '2024-03-20 08:05:00', 1),
(3, 'Temperatura', 120.50, '2024-03-20 08:10:00', 3),
(4, 'Vibração', 1.50, '2024-03-20 08:15:00', 2),
(5, 'Temperatura', 84.90, '2024-03-20 08:20:00', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  ADD PRIMARY KEY (`id_equipamento`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_funcionario`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Índices de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_funcionario` (`id_funcionario`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- Índices de tabela `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`id_sensor`),
  ADD KEY `id_equipamento` (`id_equipamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `equipamentos`
--
ALTER TABLE `equipamentos`
  MODIFY `id_equipamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sensores`
--
ALTER TABLE `sensores`
  MODIFY `id_sensor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`);

--
-- Restrições para tabelas `sensores`
--
ALTER TABLE `sensores`
  ADD CONSTRAINT `sensores_ibfk_1` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamentos` (`id_equipamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
