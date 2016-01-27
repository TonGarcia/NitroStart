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
