USE ecommerce;

-- Script de Melhorias e Atualizações
ALTER TABLE vendedor_terceiro ADD COLUMN CPF char(11);
ALTER TABLE vendedor_terceiro ADD COLUMN CNPJ char(14);

-- Adicionando Coluna "Tamanho" para a tabela "Produto"
ALTER TABLE produto ADD COLUMN tamanho varchar(15);

-- CATEGORIAS ECOMMERCE
ALTER TABLE produto MODIFY COLUMN categoria ENUM('Calçados','Roupas','Acessórios',
                                                  'Suplementos','GAMES', 'Equipamentos',
												  'Promoções', 'Masculino','Feminino','Infantil');

-- TIPOS DE PAGAMENTOS
ALTER TABLE forma_pagamento MODIFY COLUMN tipo_nome ENUM('Boleto','Cartão de Crédito', 'Pix',
                                                          'Cartão de Débito','QR Code');
