desc cliente;

-- Inserindo dados de clientes
INSERT INTO cliente (Pnome,NmeioInicial,Sobrenome,endereco) VALUES ('Marcos', 'M', 'Souza Avelino', 'Av. Antônio Carlos, 5400 - Cachoeirinha - BH/MG'); 
INSERT INTO cliente (Pnome,NmeioInicial,Sobrenome,endereco) VALUES ('Renato', 'P', 'Silva Ramos', 'Rua Hibisco, 35 - Chácara Boa Vista - Contagem/MG');
INSERT INTO cliente (Pnome,NmeioInicial,Sobrenome,endereco) VALUES ('Stefanini', 'IT', 'Solutions', 'Av. Deputado Cristovam Chiaradia, 670 - Buritis, BH/MG');
INSERT INTO cliente (Pnome,NmeioInicial,Sobrenome,endereco) VALUES ('Pottencial', '', 'Seguradora', ' Av. Raja Gabáglia, 1143 - 20º andar - Luxemburgo, BH/MG');
SELECT * FROM cliente;


-- Clientes Pessoa Física
INSERT INTO pFisica (cpf, data_nascimento, telefone_celular, fk_id_cliente) VALUES ('13287751190','1997-08-27','31982594655',1);
INSERT INTO pFisica (cpf, data_nascimento, telefone_celular, fk_id_cliente) VALUES ('14995582387','1991-03-23','31998457669',2);
SELECT * FROM pFisica;

-- Clientes Pessoa Jurídica
INSERT INTO pJuridica (razao_social, cnpj, inscricao_estadual, telefone_fixo, telefone_celular, fk_id_cliente) VALUES ('Stefanini IT Solutions', '12997341000142','123456789','3130253800','31988776655',4);
INSERT INTO pJuridica (razao_social, cnpj, inscricao_estadual, telefone_fixo, telefone_celular, fk_id_cliente) VALUES ('Pottencial Seguradora', '12331453000159','987654321','3121217777','319887767785',3);
SELECT * FROM pJuridica;


-- Inserindo dados de um vendedor
INSERT INTO vendedor_terceiro (nome, local_vendedor, CPF) VALUES ('Rogério Fernandes', 'CWK Coworking - Lourdes', '15517793388');
INSERT INTO vendedor_terceiro (razao_social, endereco, CNPJ) VALUES ('B2B Vendedores', 'Av. Mário Werneck, 3447 - Buritis - Belo Horizonte/MG', '15563867000199');
SELECT * FROM vendedor_terceiro;

-- Inserindo pedidos
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Em andamento', 'Lorem ipsum dolor sit amet', 34.9, 549.9, 1, 2); 
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Em andamento', 'Lorem ipsum dolor sit amet', 54.9, 988.7, 1, 1); 
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Em andamento', 'Lorem ipsum dolor sit amet', 54.9, 325.8, 2, 2);
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Processando', 'Lorem ipsum dolor sit amet', 25.8, 644.99, 2, 1);
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Enviado', 'Lorem ipsum dolor sit amet', 42.9, 1329.8, 3, 1);
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Enviado', 'Lorem ipsum dolor sit amet', 19.8, 863.9, 3, 2);
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Entregue', 'Lorem ipsum dolor sit amet', 32.5, 455.9, 4, 1);
INSERT INTO pedido (status_pedido, descricao, frete, valor_total, fk_id_cliente, fk_id_vendedor) VALUES ('Entregue', 'Lorem ipsum dolor sit amet', 25.8, 733.2, 4, 2);
SELECT * FROM pedido;


-- Inserindo entregas
INSERT INTO entrega (status_entrega, cod_rastreio, fk_id_pedido) VALUES ('Enviado', 572238, 2);
SELECT * FROM entrega;

-- Inserindo forma de pagamento
INSERT INTO forma_pagamento (tipo_nome, prazo_compensacao_, nome_cartao, numero_cartao) VALUES ('Cartão de Débito', 'Instantâneo', 'Renato Ribeiro Lemos', 93847563920);
UPDATE forma_pagamento SET numero_cartao = 38477236 WHERE id_forma_pagamento = 4;
SELECT * FROM forma_pagamento;

-- Inserindo dados de registros de compra
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (5,2,1,28,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (5,3,1,11,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (4,4,2,12,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (4,5,2,13,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (3,6,3,14,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (3,7,3,15,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (2,8,4,16,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (2,9,4,17,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (1,10,1,18,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (1,11,1,19,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (1,12,2,20,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (1,13,2,21,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (2,14,3,22,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (2,15,3,23,2);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (2,16,4,25,1);
INSERT INTO registro_compra (fk_id_forma_pagamento, fk_id_pedido, fk_id_cliente, fk_id_entrega, fk_id_vendedor) VALUES (2,17,4,26,2);
SELECT * FROM registro_compra;


-- Inserindo fornecedores
INSERT INTO fornecedor (razao_social, cnpj, endereco, email, telefone) VALUES ('B2B Vendedores' , '15563867000199', 'Av. Mário Werneck, 3447 - Buritis - Belo Horizonte/MG', 'b2bvendedores@gmvendedor_terceiroail.com', '313299-6228');
INSERT INTO fornecedor (razao_social, cnpj, endereco, email, telefone) VALUES ('Cia. Hering', '78876950015950', 'RUA JOSE PAULINO, 569-73 - BOM RETIRO - SÃO PAULO/SP', 'fiscal@ciahering.com.br', '473321-3544');
INSERT INTO fornecedor (razao_social, cnpj, endereco, email, telefone) VALUES ('NIKE DO BRASIL COMERCIO E PARTICIPACOES LTDA','59546515000134','R WERNER SIEMENS, 111 (PREDIO 1 PAVMTO1 E 2) - LAPA DE BAIXO - SÃO PAULO/SP', 'bra.saopaulo.fiscal@nike.com', '112739-6453');
SELECT * FROM fornecedor;


-- Inserindo produtos
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Calçados','Nike Air Max', 399.99, '4,8','41 BR',9);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Roupas', 'Calça Jeans', 129.90, '4,7', '44',7);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Acessórios', 'Óculos de Sol - Chilli Beans', 199.90, '4,9', 'haste: 14,5cm',6);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('GAMES', 'Headset Gamer JBL Quantum 800', 1109.9, '4,9','Tamanho Padrão',6);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Equipamentos', 'Caixa de Som Amvox 550W Rms Aca 550 Strondo II', 559.0, '4,6','Altura: 55 cm', 6);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Promoções', 'Jaqueta Moletom Nike Sportswear Club Fleece Capuz Masculino', 332.99, '5,0', 'GG', 9);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Masculino', 'Ecobag Unissex Estampado Em Sarja - Off White', 19.90, '4,8', 'Alça: 70,00cm', 7);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Feminino', 'Macacão Midi Em Tecido De Algodão - Verde', 99.99, '4,7', '36', 7);
INSERT INTO produto (categoria, descricao, valor_unit, avaliacao, tamanho, fk_id_fornecedor) VALUES ('Infantil','Boné Infantil Nike Aba Curva Featherlight', 149.99, '4.5', '54cm circunf.',9);
SELECT * FROM produto;


-- Inserindo relação de produtos por pedido
INSERT INTO relacao_produto_pedido (fk_id_produto, fk_id_pedido, quantidade) VALUES (9, 17, 3),
																					 (8, 17, 1),
                                                                                     (2, 16, 4),
                                                                                     (5, 16, 1),
                                                                                     (3, 15, 2),
                                                                                     (6, 15, 1),
                                                                                     (1, 14, 2),
                                                                                     (7, 14 ,5),
                                                                                     (8, 13, 2),
                                                                                     (3, 13, 1),
                                                                                     (9, 12, 4),
                                                                                     (2, 11, 2),
                                                                                     (8, 10, 3),
                                                                                     (7, 10, 1),
                                                                                     (5, 9, 6),
                                                                                     (2, 9, 2),
                                                                                     (7, 9, 3),
                                                                                     (1, 8, 1),
                                                                                     (5, 7, 2),
                                                                                     (1, 7, 4),
                                                                                     (9, 6, 1),
                                                                                     (6, 6, 3),
																					 (2, 6, 1),
                                                                                     (1, 5, 1),
                                                                                     (6, 4, 2),
                                                                                     (9, 4, 3),
                                                                                     (7, 3, 1),
                                                                                     (8, 2, 2),
                                                                                     (3, 2, 5),
                                                                                     (1, 2, 1);
SELECT * FROM relacao_produto_pedido;

-- Inserindo o estoque/galpão/armazém
INSERT INTO estoque (local_estoque) VALUES ('Belo Horizonte - Centro');
INSERT INTO estoque (local_estoque) VALUES ('Rio de Janeiro - Ramos');
SELECT * FROM estoque;

-- Quantidade de produto em estoque
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (1, 2, 60);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (2, 1, 80);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (3, 1, 100);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (4, 1, 30);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (5, 2, 100);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (6, 2, 40);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (7, 2, 70);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (8, 1, 200);
INSERT INTO qtd_produto_estoque (fk_id_produto, fk_id_estoque, quantidade) VALUES (9, 1, 150);
SELECT * FROM qtd_produto_estoque;


