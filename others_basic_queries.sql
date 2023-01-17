use AdventureWorks2017;

-- HAVING
-- O having � usado com o group by para filtrar resultados de um agrupamento
-- Diferen�a entre having e where -> � que o group by � aplicado depois que os dados j� foram agrupados, enquanto o where � aplicado antes

SELECT FirstName, COUNT(FirstName) as 'Quantidade'
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

-- queremos saber quais nomes no sistema tem uma ocorr�ncia maior que 10 vezes por�m somente onde o t�tulo pe 'Mr.'

SELECT FirstName, COUNT(FirstName) as 'Quantidade'
FROM Person.Person
WHERE Title='Mr.'
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

-- queremos saber quais produtos que no total de vendas est�o entre 162k a 500k

SELECT ProductID, SUM(LineTotal) as 'Total'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 AND 500000

-- Estamos querendo identificar as provincias (stateProvincedId) com o maior n�mero de cadastros no nosso sistema 
-- ent�o � preciso encontrar quais prov�ncias est�o registradas no banco de dados mais que 1000 vezes

SELECT *
FROM Person.Address

SELECT StateProvinceID, COUNT(StateProvinceID) as 'Provincia'
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

-- Sendo uma multinacional os gerentes querem saber quais produtos (productId) n�o est�o trazendo em m�dia no m�nimo 1 milh�o em total de vendas (line total)

SELECT *
FROM Sales.SalesOrderDetail

SELECT ProductID, AVG(LineTotal) AS 'Total Vendas'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) < 1000000

-- AS

SELECT TOP 10 ListPrice AS 'Lista de Pre�o'
FROM Production.Product

SELECT TOP 10 AVG(ListPrice) AS 'Pre�o m�dio'
FROM Production.Product

-- Encontrar o FirstName e LastName person.person e trazer o nome dessas colunas em portugu�s

SELECT FirstName AS 'Nome', LastName AS 'Sobrenome'
FROM Person.Person

-- PorductNumer da tabela production.product "Numero do Produto"

SELECT ProductNumber AS 'N�mero do Produto'
FROM Production.Product

-- Sales.SalesOrderDetail unitPrice "Pre�o unit�rio"

SELECT UnitPrice AS 'Pre�o Unit�rio'
FROM Sales.SalesOrderDetail