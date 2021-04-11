
//=================================================================
/* SELECT DE CONTAS*/

SELECT C.*,
		fn.nome as fornecedor
FROM DBO.contas C
INNER JOIN fornecedores FN ON FN.cod_fornecedor = C.cod_fornecedor
ORDER BY C.vencimento


//=================================================================
/* SELECT DE VENDAS*/
select * from vendas
SELECT v.*,
		c.nome as cliente
FROM vendas v

INNER JOIN clientes c ON c.cod_cliente = v.cod_cliente
ORDER BY v.num_venda
//==================================================================
/*SELECT  DE DESCONTOS DE VENDAS*/

SELECT d.cod_desconto,d.cod_itens_vendas,i.sub_total,d.descr,d.descp, sub_total - descr as total
FROM deescontos d
INNER JOIN itens_vendas i ON i.cod_itens_vendas = d.cod_itens_vendas 
ORDER BY d.total

//=================================================================
/* SELECT DE FORNECEDORES*/

select * from fornecedores

SELECT f.*,
		ci.nome as cidade
FROM fornecedores f

INNER JOIN cidades ci ON f.cod_cidade = ci.cod_cidade
ORDER BY f.nome

//=================================================================
/* SELECT DE PRODUTOS*/

select * from produtos
select * from unidades
select * from categorias
select * from marcas

SELECT p.*,
		u.descricao as unidade,
		c.descricao as categoria,
		m.nome as marca
FROM produtos p

INNER JOIN unidades u ON p.cod_unidade = u.cod_unidade
INNER JOIN categorias c ON p.cod_unidade = c.cod_categoria
INNER JOIN marcas m ON p.cod_marca = m.cod_marca

ORDER BY p.descricao

//=================================================================
/* SELECT DE REPAROS*/

select * from REPAROS

SELECT R.*,
		c.nome as cliente
FROM REPAROS r

INNER JOIN clientes c ON r.cod_cliente = c.cod_cliente
ORDER BY r.data_recebido