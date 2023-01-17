use AdventureWorks2017;

-- HAVING
-- O having é usado com o group by para filtrar resultados de um agrupamento
-- Diferença entre having e where -> é que o group by é aplicado depois que os dados já foram agrupados, enquanto o where é aplicado antes

SELECT FirstName, COUNT(FirstName) as 'Quantidade'
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

-- queremos saber quais nomes no sistema tem uma ocorrência maior que 10 vezes porém somente onde o título pe 'Mr.'

SELECT FirstName, COUNT(FirstName) as 'Quantidade'
FROM Person.Person
WHERE Title='Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

-- queremos saber quais produtos que no total de vendas estão entre 162k a 500k

SELECT ProductID, SUM(LineTotal) as 'Total'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000

-- Estamos querendo identificar as provincias (stateProvincedId) com o maior número de cadastros no nosso sistema 
-- então é preciso encontrar quais províncias estão registradas no banco de dados mais que 1000 vezes

SELECT *
FROM Person.Address

SELECT StateProvinceID, COUNT(StateProvinceID) as 'Provincia'
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

-- Sendo uma multinacional os gerentes querem saber quais produtos (productId) não estão trazendo em média no mínimo 1 milhão em total de vendas (line total)

SELECT *
FROM Sales.SalesOrderDetail

SELECT ProductID, AVG(LineTotal) AS 'Total Vendas'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000

-- AS

SELECT TOP 10 ListPrice AS 'Lista de Preço'
FROM Production.Product

SELECT TOP 10 AVG(ListPrice) AS 'Preço médio'
FROM Production.Product

-- Encontrar o FirstName e LastName person.person e trazer o nome dessas colunas em português

SELECT FirstName AS 'Nome', LastName AS 'Sobrenome'
FROM Person.Person

-- PorductNumer da tabela production.product "Numero do Produto"

SELECT ProductNumber AS 'Número do Produto'
FROM Production.Product

-- Sales.SalesOrderDetail unitPrice "Preço unitário"

SELECT UnitPrice AS 'Preço Unitário'
FROM Sales.SalesOrderDetail