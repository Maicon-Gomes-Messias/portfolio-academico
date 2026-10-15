-- Esse arquivo contém as instruções das questões de 1 a 10 e a criação das Views 

-- 1) junção de 3 ou mais tabelas, com ORDER BY;
-- Ordenar por preço todos os produtos do carrinho de compras de um usuário, mostrando o nome do produto, o seu preço e a sua descrição.
SELECT
	P.NAME,
	P.price,
	P.description 
FROM
	users AS U
	INNER JOIN cart_items AS CI ON U.id = CI.user_id
	INNER JOIN products AS P ON P.id = CI.product_id 
ORDER BY
	P.price 

-- 2) junção de 3 ou mais tabelas, com ORDER BY e filtros na cláusula WHERE;
-- Ordenar por preço todos os produtos do carrinho de compras de um usuário, mostrando o nome do produto, o seu preço e a sua descrição quando o tamanho do produto for pequeno “P”.
SELECT
	P.NAME,
	P.price,
	P.description 
FROM
	users AS U
	INNER JOIN cart_items AS CI ON U.id = CI.user_id
	INNER JOIN products AS P ON P.id = CI.product_id 
WHERE
	P.size = 'P' 
ORDER BY
	P.price 

-- 3) junção de 3 ou mais tabelas, usando os operadores LIKE e BETWEEN;
-- Ordenar por preço todos os produtos do carrinho de compras de um usuário, mostrando o nome do produto, o seu preço, sua descrição e seu tamanho quando o seu nome começar por “Tortinha” e seu preço esteja entre R$0,00 e R$25,00.
SELECT
	P.NAME,
	P.price,
	P.size,
	P.description 
FROM
	users AS U
	INNER JOIN cart_items AS CI ON U.id = CI.user_id
	INNER JOIN products AS P ON P.id = CI.product_id 
WHERE
	P.NAME LIKE 'Tortinha%' 
	AND P.price BETWEEN 0 
	AND 25 
ORDER BY
	P.price

-- 4) junção de 3 ou mais tabelas, usando os operadores IN/NOT IN e IS NULL/IS NOT NULL;
-- Mostrar o nome, tamanho e sabor dos produtos que não tenham o preço nulo e que não estejam na categoria de “Salgados”.
SELECT
	P.NAME,
	P.SIZE,
	P.TASTE
FROM
	products AS P 
WHERE
	P.price IS NOT NULL 
	AND P.id NOT IN (
	SELECT
		P.id 
	FROM
		users AS U
		INNER JOIN cart_items AS CI ON U.id = CI.user_id
		INNER JOIN products AS P ON P.id = CI.product_id
		INNER JOIN categories AS C ON P.category_id = C.id 
	WHERE
	C.NAME = 'Salgados' 
	)

-- 5) junção de 2 ou mais tabelas com GROUP BY, sem HAVING, usando uma função agregada qualquer (MIN, MAX, AVG, SUM, COUNT). Use ORDER BY;
-- selecionar todos os usuario que possuem itens no carrinho e qual o valor total dos itens do mesmo
SELECT
	u.id,
	u.name,
	sum( p.price ) 
FROM
	categories AS c
	INNER JOIN products AS p ON p.category_id = c.id
	INNER JOIN cart_items AS ci ON ci.product_id = p.id
	INNER JOIN users AS u ON u.id = ci.user_id 
GROUP BY
	ci.user_id
	
-- 6) junção de 2 ou mais tabelas com GROUP BY e HAVING, usando uma função agregada qualquer (MIN, MAX, AVG, SUM, COUNT);
 -- selecionar todos os usuario que possuem itens no carrinho com valor maior que 20 reais
SELECT
	ci.user_id,
	sum( p.price ) 
FROM
	categories AS c
	INNER JOIN products AS p ON p.category_id = c.id
	INNER JOIN cart_items AS ci ON ci.product_id = p.id
	INNER JOIN users AS u ON u.id = ci.user_id 
GROUP BY
	ci.user_id 
HAVING
	sum( p.price ) > 50;

-- 7) subselect sem correlação;
-- seleciona todos os produtos que possuem a categoria que começa com "Doces"
SELECT
	P.NAME,
	P.SIZE,
	P.TASTE 
FROM
	products AS P 
WHERE
	P.price IS NOT NULL 
	AND P.category_id IN (
	SELECT
		id 
	FROM
		categories 
	WHERE
	NAME LIKE "Doces%" 
	)

-- 8) subselect com correlação;
-- Mostrar o nome, tamanho e sabor dos produtos que não tenham o preço nulo e que não estejam nas categorias que comecem com “Doces”.
SELECT
	P.NAME,
	P.SIZE,
	P.TASTE
FROM
	products AS P 
WHERE
	P.price IS NOT NULL 
	AND P.id NOT IN (
	SELECT
		P.id 
	FROM
		users AS U
		INNER JOIN cart_items AS CI ON U.id = CI.user_id
		INNER JOIN products AS P ON P.id = CI.product_id
		INNER JOIN categories AS C ON P.category_id = C.id 
	WHERE
	C.NAME LIKE 'Doces%' 
	)


-- 9) subselect com EXISTS;
-- Mostrar todos os produtos e os preços deles quando existir produtos da categoria “Salgados” e o preço for maior do que R$3,00.
SELECT
	P.NAME,
	P.taste,
	P.SIZE,
	P.price 
FROM
	products AS P 
WHERE
	EXISTS (
	SELECT
		P.id 
	FROM
		users AS U
		INNER JOIN cart_items AS CI ON U.id = CI.user_id
		INNER JOIN products AS P ON P.id = CI.product_id
		INNER JOIN categories AS C ON P.category_id = C.id 
	WHERE
		C.NAME = 'Salgados' 
	AND P.price > 3 
	)


-- 10) junção de 2 ou mais tabelas com GROUP BY, HAVING e ALL.
-- selecionar TODOS (ALL) os usuario que possuem itens no carrinho com valor maior que 20 reais
SELECT ALL
	ci.user_id,
	sum( p.price ) 
FROM
	categories AS c
	INNER JOIN products AS p ON p.category_id = c.id
	INNER JOIN cart_items AS ci ON ci.product_id = p.id
	INNER JOIN users AS u ON u.id = ci.user_id 
GROUP BY
	ci.user_id 
HAVING
	sum( p.price ) > 50;


-- criação das views

-- cart total value: exibe todos os usuario que possuem itens no carrinho e qual o valor total dos itens do mesmo
CREATE VIEW cart_total_value AS
SELECT
	u.id,
	u.name,
	sum( p.price ) 
FROM
	categories AS c
	INNER JOIN products AS p ON p.category_id = c.id
	INNER JOIN cart_items AS ci ON ci.product_id = p.id
	INNER JOIN users AS u ON u.id = ci.user_id 
GROUP BY
	ci.user_id

-- products_not_in_salgados: Mostrar o nome, tamanho e sabor dos produtos que não tenham o preço nulo e que não estejam na categoria de “Salgados”.
CREATE VIEW products_not_in_salgados AS
SELECT
	P.NAME,
	P.SIZE,
	P.TASTE
FROM
	products AS P 
WHERE
	P.price IS NOT NULL 
	AND P.id NOT IN (
	SELECT
		P.id 
	FROM
		users AS U
		INNER JOIN cart_items AS CI ON U.id = CI.user_id
		INNER JOIN products AS P ON P.id = CI.product_id
		INNER JOIN categories AS C ON P.category_id = C.id 
	WHERE
	C.NAME = 'Salgados' 
	)