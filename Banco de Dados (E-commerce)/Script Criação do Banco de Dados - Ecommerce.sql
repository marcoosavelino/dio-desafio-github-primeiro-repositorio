CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE cliente(
	id_cliente int primary key auto_increment not null,
    Pnome varchar(10),
    NmeioInicial char,
    Sobrenome varchar(20),
    endereco varchar(45)
);

CREATE TABLE pFisica(
	id_pfisica int primary key auto_increment not null,
    cpf char(11) unique not null,
    data_nascimento DATE not null,
    telefone_celular varchar(14) unique not null,
    fk_id_cliente int not null,
    foreign key (fk_id_cliente) references cliente (id_cliente)
);

CREATE TABLE pJuridica(
	id_pjuridica int primary key auto_increment not null,
    razao_social varchar(50) not null,
    cnpj char(14) unique not null,
    inscricao_estadual char(9) unique not null,
    fk_id_cliente int not null,
    foreign key (fk_id_cliente) references cliente (id_cliente)
);

CREATE TABLE pedido(
	id_pedido int primary key auto_increment not null,
    status_pedido enum('Em andamento','Processando','Enviado','Entregue') not null default 'Em andamento',
    descricao text,
    frete float,
    fk_id_cliente int not null,
    foreign key (fk_id_cliente) references cliente (id_cliente)
);

CREATE TABLE entrega(
	id_entrega int primary key auto_increment not null,
    status_entrega varchar(30) not null,
    cod_rastreio int unique not null,
    fk_id_pedido int not null,
    foreign key (fk_id_pedido) references pedido (id_pedido)
);

CREATE TABLE forma_pagamento(
	id_forma_pagamento int primary key auto_increment not null,
    tipo_nome varchar(20) not null,
    prazo_compensacao_ varchar(20),
    nome_cartao varchar(45),
    numero_cartao int
);

CREATE TABLE registro_compra(
	id_registro_compra int primary key auto_increment not null,
	fk_id_forma_pagamento int not null,
    foreign key (fk_id_forma_pagamento) references forma_pagamento (id_forma_pagamento),
    fk_id_pedido int not null,
    foreign key (fk_id_pedido) references pedido (id_pedido),
    fk_id_cliente int not null,
    foreign key (fk_id_cliente) references cliente (id_cliente),
    fk_id_entrega int not null,
    foreign key (fk_id_entrega) references entrega (id_entrega)
);

CREATE TABLE vendedor_terceiro(
	id_vendedor int primary key auto_increment not null,
    nome varchar(50),
    razao_social varchar(50),
    local_vendedor varchar(50),
    endereco varchar(100)
);

CREATE TABLE produto(
	id_produto int primary key auto_increment not null,
    categoria varchar(20),
    descricao text,
    valor_unit float
);

CREATE TABLE relacao_produto_pedido(
	fk_id_produto int not null,
    foreign key (fk_id_produto) references produto (id_produto),
    fk_id_pedido int not null,
    foreign key (fk_id_pedido) references pedido (id_pedido),
    quantidade int
);

CREATE TABLE fornecedor(
	id_fornecedor int primary key auto_increment not null,
    razao_social varchar(50),
    cnpj char(14) unique not null,
    endereco varchar(100),
    email varchar(50) unique,
    telefone char(14) unique
);

-- Tiveram outras alterações de tabela adicionando as Foreigns key necessárias
ALTER TABLE produto ADD COLUMN fk_id_fornecedor int not null;
ALTER TABLE produto ADD CONSTRAINT fk_id_fornecedor
FOREIGN KEY (fk_id_fornecedor) REFERENCES fornecedor (id_fornecedor);
desc produto;

CREATE TABLE estoque(
	id_estoque int primary key auto_increment not null,
    local_estoque varchar(50)
);

CREATE TABLE qtd_produto_estoque(
	fk_id_produto int not null,
    foreign key (fk_id_produto) references produto (id_produto),
    fk_id_estoque int not null,
    foreign key (fk_id_estoque) references estoque (id_estoque),
    quantidade int not null default 0
);


