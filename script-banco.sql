-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para desafiovnw
CREATE DATABASE IF NOT EXISTS `desafiovnw` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `desafiovnw`;

-- Copiando estrutura para tabela desafiovnw.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(25) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela desafiovnw.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT IGNORE INTO `cliente` (`id_cliente`, `nome`, `telefone`, `email`) VALUES
	(1, 'Paulo Vaz', '38 998828159', 'paulovaz38034@gmail.com'),
	(2, 'João Geraldo', '6122322781', 'joaogeraldo770@gmail.com'),
	(3, 'Vitor Junior', '9928354923', 'vitorjunior@gmail.com'),
	(4, 'Luiz Henrique', '4722425162', 'luzhenrique@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela desafiovnw.item_pedido
CREATE TABLE IF NOT EXISTS `item_pedido` (
  `id_item` int(25) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(25) NOT NULL,
  `id_produto` int(25) NOT NULL,
  `quantidade` int(100) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_pedidos` (`id_pedido`),
  KEY `fk_produtos` (`id_produto`),
  CONSTRAINT `fk_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_produtos` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela desafiovnw.item_pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela desafiovnw.pagamento
CREATE TABLE IF NOT EXISTS `pagamento` (
  `id_pagamento` int(25) NOT NULL AUTO_INCREMENT,
  `idPedido` int(25) DEFAULT NULL,
  `forma_pagamento` varchar(100) NOT NULL,
  `valor_pagamento` decimal(10,2) NOT NULL,
  `data_pagamento` datetime DEFAULT current_timestamp(),
  `status_pagamento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`) USING BTREE,
  KEY `fk_pagamento` (`idPedido`),
  CONSTRAINT `fk_pagamento` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela desafiovnw.pagamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;

-- Copiando estrutura para tabela desafiovnw.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(25) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(25) DEFAULT NULL,
  `nome_pedido` varchar(100) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status_pedido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`) USING BTREE,
  KEY `fk_pedido` (`id_cliente`),
  CONSTRAINT `fk_pedido` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela desafiovnw.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT IGNORE INTO `pedido` (`id_pedido`, `id_cliente`, `nome_pedido`, `data_pedido`, `valor_total`, `status_pedido`) VALUES
	(1, 4, 'Sanduiche', '2026-03-27 23:10:59', 25.00, 'Pronto Pra Entrega'),
	(2, 2, 'pastel', '2026-03-27 23:10:59', 10.00, 'Fazendo'),
	(3, 1, 'Coxinha', '2026-03-27 23:10:59', 20.00, 'pendente');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela desafiovnw.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id_produto` int(25) NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `estoque` int(100) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela desafiovnw.produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
