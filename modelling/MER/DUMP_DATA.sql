-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: nitro_start_development
-- ------------------------------------------------------
-- Server version 5.7.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_infos`
--
LOCK TABLES `businesses` WRITE;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
INSERT INTO `businesses` VALUES (1,'FIAT, Wolksvagem','Venda direta para os Consumidores, sem intermediação de Concessionárias','Carros mais confortáveis','- Só vendemos carros Completos;\r\n- Preço de Carro Popular por um Corss-Over;\r\n- Itens exclusivos de Tecnologia;\r\n- Não trabalhamos com motores mais fracos (1.0, 1.4...);\r\n- Nossas revisões da garantia são em parceiros e não em concessionárias','- Não temos carros à pronta entrega (leva entre 15 a 60 dias);\r\n- Cobramos por Test-Drive (como não temos concessionárias os tests são em locadoras);\r\n- Nossa garantia é curta (por enquanto somente).','Chegou bem antes do que esperava!',1,1,NULL,'2016-01-21 00:01:17','2016-01-21 00:01:17', 0);
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--


LOCK TABLES `competitors` WRITE;
/*!40000 ALTER TABLE `competitors` DISABLE KEYS */;
INSERT INTO `competitors` VALUES (1,'Hiunday',44000.00,14700000000.00,291411,'Preço bem em conta e Garantia Extensa','Muito fraco os motores e de tecnologia de conforto','- Motor Melhor;\r\n- Melhores itens de conforto;\r\n- Nosso Cross-Over é mais barato que o HB20 Completo\r\n- Temos itens exclusivos de Conforto',1,1,NULL,'2016-01-21 00:04:14','2016-01-21 00:04:14');
/*!40000 ALTER TABLE `competitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financials`
--

LOCK TABLES `financials` WRITE;
/*!40000 ALTER TABLE `financials` DISABLE KEYS */;
INSERT INTO `financials` VALUES (1,317,2,90000.00,45000.00,50.00,25,1,1,NULL,'2016-01-21 00:02:27','2016-01-21 12:35:04');
/*!40000 ALTER TABLE `financials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideas`
--

LOCK TABLES `ideas` WRITE;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` VALUES (1,'Os itens de conforto nos carros não são acessíveis','Só no Brasil existe o carro na versão \"pelado\"','Paga-se muito caro para ter estes acessórios','Qualidade BMW pelo preço JAC','C&A dos Carros','Página do Face',1,1,NULL,'2016-01-20 23:57:04','2016-01-20 23:57:04');
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `investments` WRITE;
/*!40000 ALTER TABLE `investments` DISABLE KEYS */;
/*!40000 ALTER TABLE `investments` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `markets` WRITE;
/*!40000 ALTER TABLE `markets` DISABLE KEYS */;
INSERT INTO `markets` VALUES (1,'Automotivo',986,8760000000,200000,'Dispositivos e Sensores Eletrônicos','Classes B, C e D',1,1,NULL,'2016-01-21 00:01:52','2016-01-21 00:01:52');
/*!40000 ALTER TABLE `markets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pitches`
--

LOCK TABLES `pitches` WRITE;
/*!40000 ALTER TABLE `pitches` DISABLE KEYS */;
INSERT INTO `pitches` VALUES (1,'Luz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',4,'2016-01-20 23:56:30','2016-01-20 23:56:30');
/*!40000 ALTER TABLE `pitches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--


LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,4,NULL,NULL,NULL,NULL,0,1,1,1,NULL,'2016-01-21 00:01:29','2016-01-21 12:31:01');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--


LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
INSERT INTO `providers` VALUES (1,'Ex-Troller','Automotivo','Know how de fornecedores','Venda de Influência',1,NULL,'2016-01-21 00:11:09','2016-01-21 00:11:09');
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--


LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151215150323'),('20151215150543'),('20151215150707'),('20151215150716'),('20151228140340'),('20151228141805'),('20151228141824'),('20151228141944'),('20151228142707'),('20151228142708'),('20151229192120'),('20151229192727'),('20151229192728'),('20151229194128'),('20151229201132'),('20151231174352'),('20151231174618'),('20151231174758'),('20160106185851'),('20160116204010'),('20160116204025'),('20160120190913'),('20160121001306');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_sessions`
--

LOCK TABLES `tractions` WRITE;
/*!40000 ALTER TABLE `tractions` DISABLE KEYS */;
INSERT INTO `tractions` VALUES (1,'Indique um Amigo & Test-Drive em Lojas de Aluguel de Carro',0.50,1.95,70,1200,'Facebook, Twitter & Blog',1,1,NULL,'2016-01-21 00:02:09','2016-01-21 00:02:09');
/*!40000 ALTER TABLE `tractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Ilton Garcia dos Santos Silveira',2,'ton.garcia.jr@gmail.com',NULL,'pt-BR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2a$10$zSUFtZLp37reClJAEvlSx.y8jlmqx//HTOmSXrCwo5lJphxbbM8x6',NULL,NULL,NULL,2,'2016-01-21 12:30:31','2016-01-20 23:55:31','127.0.0.1','127.0.0.1',0,NULL,NULL,'wrtuaUu-N_kyQoea9sfa','2016-01-20 23:55:21','2016-01-20 23:55:09',NULL,'2016-01-20 23:55:09','2016-01-21 12:30:31',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-21 11:05:53
