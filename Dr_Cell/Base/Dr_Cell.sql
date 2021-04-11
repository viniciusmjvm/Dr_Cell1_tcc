use master
go

create database Dr_Cell
go

use Dr_Cell
go

create table cidades (
	cod_cidade int not null identity(1,1) primary key,
	nome varchar(100) not null,
	uf char(2) not null default 'SP',
	cep_padrao char(8)
);

create table clientes (	
	cod_cliente	int not null identity(1,1) primary key,
	nome varchar(100) not null,
	cpf char(11) not null,
	rg varchar(18),
	data_nascimento datetime not null,
	sexo char(1),	
	endereco varchar(100),
	bairro varchar(100),
	cod_cidade int not null references cidades (cod_cidade),
	cep char(8),	
	telefone varchar(15),
	celular varchar(15) not null,
	email varchar(150)
);

create table unidades (
	cod_unidade	int not null identity(1,1) primary key,
	descricao	varchar(100) not null
);

create table fornecedores (
	cod_fornecedor int not null identity(1,1) primary key,
	nome varchar(100) not null,
	cnpj char(16),
	endereco varchar(100),
	bairro varchar(100),
	cod_cidade int not null references cidades (cod_cidade),
	cep char(8),
	telefone varchar(15),
	celular varchar(15) not null,
	email varchar(150)
);

create table categorias (
	cod_categoria int not null identity(1,1) primary key,
	descricao	varchar(100) not null
);

create table marcas (
	cod_marca int not null identity(1,1) primary key,
	nome	varchar(100) not null
);
create table produtos(
	cod_produto	int not null identity(1,1) primary key,	 
	descricao varchar(100) not null,
	cod_EAN int,
	preco_custo float not null,
	preco_venda float not null,
	cod_unidade int not null references unidades (cod_unidade),
	cod_categoria int not null references categorias (cod_categoria),
	cod_marca int not null references marcas (cod_marca),
	estoque_atual int null,
	estoque_minimo int null
);
create table contas (
	cod_conta int not null identity(1,1) primary key,
	num_conta int not null,
	tipo char(1),
	vencimento datetime,
	cod_categoria int not null references categorias (cod_categoria),
	cod_fornecedor int not null references fornecedores (cod_fornecedor),
	observacao text,
	pago_em datetime
);

create table itens_contas (
	cod_itens_contas int not null identity(1,1) primary key,
	cod_produto int not null references produtos (cod_produto),
	cod_conta int not null references contas (cod_conta),
	quantidade int null default null,
	valor float null default '0.00',
	sub_total float null default '0.00',
	descr float null default '0.00',
	total float null default '0.00'
);
create table vendas(
	cod_venda int not null identity(1,1) primary key,
	num_venda int not null,
	cod_cliente int not null references clientes (cod_cliente),
	observacao text,
	data datetime not null
);
create table itens_vendas (
	cod_itens_vendas int not null identity(1,1) primary key,
	cod_produto int null default null references produtos (cod_produto),
	cod_venda int null default null references vendas (cod_venda),
	quantidade int null default null,
	valor float null default '0.00',
	sub_total float null default '0.00',
	descr float null default '0.00',
	total float null default '0.00'
);
/*create table pagamentos(
	cod_pagamento int not null identity(1,1),	
	cod_itens_vendas int not null references itens_vendas (cod_itens_vendas),
	dinheiro float,
	credito float,
	debito float
);
create table pagamentos(
	cod_pagamento int not null identity(1,1),	
	cod_itens_vendas int not null references itens_vendas (cod_itens_vendas),
	forma_pagamento char(8)
);
*/

create table pecas (
	cod_peca int not null identity(1,1) primary key,
	descricao varchar(50) not null,
	valor float not null default '0.00',
	qntd int not null,
	estoque_atual int null,
	estoque_minimo int null
);
create table reparos (
	cod_reparo int not null identity(1,1) primary key,
	num_reparo int not null,
	cod_cliente int  references clientes (cod_cliente),	
	prob_citados text,
	prob_encontrados text,
	data_recebido datetime not null,
	data_entrega datetime,
	status char(1) not null
);

create table itens_reparos (
	cod_itens_reparos int not null identity(1,1) primary key,
	cod_peca int null default null references produtos (cod_produto),
	cod_reparo int null default null references vendas (cod_venda),
	quantidade int null default null,
	valor float null default '0.00',
	sub_total float null default '0.00',
	descr float null default '0.00',
	total float null default '0.00'
);
----------------------------------------------------------------------------------------------------------
select * from categorias
insert into categorias values('Fone'),('Bateria')
----------------------------------------------------------------------------------------------------------
select * from marcas
insert into marcas values('PMCELL'),('XIAOMI')
----------------------------------------------------------------------------------------------------------
select * from unidades
insert into unidades values('peça'),('tamanho')
----------------------------------------------------------------------------------------------------------
select * from produtos
insert into produtos values('Carregador sem fio',4850,12.40,15,1,2,2,3,1)
----------------------------------------------------------------------------------------------------------
select * from cidades
insert into cidades values('Adamantina','',17800000),('Rinopolis','',17740000)
----------------------------------------------------------------------------------------------------------
select * from clientes
insert into clientes values('vinicius',47496957852,526124829,11-30-1999,'m','','',2,17740000,'',18998029547,'')
----------------------------------------------------------------------------------------------------------
select * from fornecedores
insert into fornecedores values('vinicius martins',4447496957852,'','',1,'','',18998029547,'')
----------------------------------------------------------------------------------------------------------
select * from contas
insert into contas values(123,'',11-00-2020,2,1,'','')
----------------------------------------------------------------------------------------------------------
select * from vendas
insert into vendas values(333,1,'',11-00-2020)
----------------------------------------------------------------------------------------------------------
select * from pecas
insert into pecas values('tela moto g8 plus',487,2, 2, 1)
----------------------------------------------------------------------------------------------------------
select * from reparos
insert into reparos values(4581,1,'','',06-20-2020,'','')
----------------------------------------------------------------------------------------------------------

/*
create table usuarios (
	cod_usuario int not null identity(1,1) primary key,
	nome_completo varchar(150) not null,
	login varchar(50) not null,
	senha varchar(20) 
);
   alter table usuarios add administrador smallint not null default 0;
*/
