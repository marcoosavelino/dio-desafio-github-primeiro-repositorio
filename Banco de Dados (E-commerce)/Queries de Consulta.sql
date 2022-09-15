-- Quantos pedidos foram feitos por cada cliente?
SELECT Pnome, Sobrenome, COUNT(distinct id_pedido) as 'Quantidade de pedidos' FROM cliente c
JOIN pedido p 
ON c.id_cliente = p.fk_id_cliente
GROUP BY id_cliente;

/* Algum vendedor também é fornecedor? 
OBS: Visando encontrar um vendedor que também é vendedor,
Selecionei os atributos respectivos a uma empresa
*/
SELECT f.razao_social, f.endereco FROM fornecedor f
JOIN vendedor_terceiro vt
ON vt.CNPJ = f.CNPJ;

-- Relação de produtos fornecedores e quantidade em estoque do que tem maior estoque para o que tem menor estoque
SELECT p.descricao, p.categoria, f.razao_social, qtd.quantidade FROM produto p
JOIN fornecedor f
ON p.fk_id_fornecedor = f.id_fornecedor
JOIN qtd_produto_estoque qtd
ON qtd.fk_id_produto = p.id_produto
ORDER BY qtd.quantidade DESC;

-- Qual produto está em promoção?
SELECT p.descricao, p.categoria FROM produto p
WHERE p.categoria = 'Promoções';

-- Qual o pedido de menor valor?
SELECT MIN(valor_total) FROM pedido;

-- Qual cliente efetuou a compra de maior valor? OBS: O "LIMIT 1" é porque tem vendas duplicadas
SELECT c.id_cliente, CONCAT(c.Pnome, ' ', c.Sobrenome) as 'Cliente', p.valor_total as 'Valor Total do Pedido' FROM cliente c, pedido p
WHERE c.id_cliente = p.fk_id_cliente AND
p.valor_total = (SELECT MAX(valor_total) FROM pedido) LIMIT 1;

-- Formas de pagamento e quantas vezes foram utilizadas ordenado pelo mais utilizado
SELECT fp.tipo_nome as 'Forma de Pagamento', COUNT(*) as 'Número de Utilizações' FROM registro_compra rc
LEFT OUTER JOIN forma_pagamento fp
ON fp.id_forma_pagamento = rc.fk_id_forma_pagamento
GROUP BY fk_id_forma_pagamento
ORDER BY COUNT(*) DESC;


