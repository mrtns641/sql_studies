use Northwind;

-- SELF JOIN
-- quero todos os clientes que moram na mesma região

SELECT A.ContactName, A.Region, B.ContactName, B.Region
FROM Customers A, Customers B
WHERE A.Region = B.Region

-- quero encontrar nome e data de contratação de todos os funcionários que
-- foram contratados no mesmo ano

SELECT A.FirstName, A.HireDate, B.FirstName, B.HireDate 
FROM Employees A, Employees B
WHERE DATEPART(YEAR, A.HireDate) = DATEPART(YEAR, B.HireDate)

-- eu quero saber na tabela detalhe do pedido [Order Details] quais produtos 
-- tem o mesmo percentual de desconto

SELECT A.ProductID, A.Discount, B.ProductID, B.Discount
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount

use AdventureWorks2017;

-- SUBQUERY
-- Monte um relatório para mim de todos os produtos cadastrados que tem o preço de venda acima de média

SELECT *
FROM Production.Product

SELECT AVG(ListPrice)
FROM Production.Product

SELECT * 
FROM Production.Product
WHERE ListPrice > 438.66

SELECT * 
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)

-- Eu quero saber o nome dos meus funcionários que tem o cargo de 'Design Engineer'

SELECT * 
FROM Person.Person

SELECT *
FROM HumanResources.Employee

SELECT FirstName 
FROM Person.Person
WHERE BusinessEntityID IN (
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'Design Engineer'
)

-- ou com join

SELECT FirstName
FROM Person.Person P
INNER JOIN HumanResources.Employee E 
ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer'

-- encontre todos os endereços que estão no estado de 'Alberta', traga todas as informações

SELECT *
FROM Person.Address

SELECT * 
FROM Person.StateProvince

SELECT *
FROM Person.Address
WHERE StateProvinceID IN (
SELECT StateProvinceID FROM Person.StateProvince 
WHERE Name = 'Alberta')

-- DATEPART

SELECT *
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART(MONTH, OrderDate) AS 'Mês'
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART(DAY, OrderDate) AS 'Dia'
FROM Sales.SalesOrderHeader

SELECT SalesOrderID, DATEPART(YEAR, OrderDate) AS 'Ano'
FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue) AS 'Média', DATEPART(MONTH, OrderDate) AS 'Mês'
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY 'Mês'

-- OPERAÇÕES EM STRING

SELECT *
FROM Person.Person

SELECT CONCAT(FirstName,' ', LastName) AS 'Clientes'
FROM Person.Person

SELECT UPPER(FirstName) AS 'Nomes'
FROM Person.Person

SELECT LOWER(FirstName) AS 'Nomes'
FROM Person.Person

SELECT FirstName, LEN(FirstName) AS 'Contagem'
FROM Person.Person

SELECT FirstName, SUBSTRING(FirstName, 1,3)
FROM Person.Person

SELECT productNumber, REPLACE(ProductNumber, '-', '#') AS 'Troca'
FROM Production.Product

-- FUNÇÕES MATEMÁTICAS

SELECT UnitPrice + LineTotal AS 'SOMA'
FROM Sales.SalesOrderDetail

SELECT UnitPrice - LineTotal AS 'SUBTRAÇÃO'
FROM Sales.SalesOrderDetail

SELECT UnitPrice * LineTotal AS 'MULTIPICAÇÃO'
FROM Sales.SalesOrderDetail

SELECT UnitPrice / LineTotal AS 'DIVISÃO'
FROM Sales.SalesOrderDetail

SELECT AVG(LineTotal) AS 'MÉDIA'
FROM Sales.SalesOrderDetail

SELECT SUM(LineTotal) AS 'SOMA'
FROM Sales.SalesOrderDetail

SELECT MIN(LineTotal) AS 'VALOR MÍNIMO'
FROM Sales.SalesOrderDetail

SELECT MAX(LineTotal) AS 'VALOR MÁXIMO'
FROM Sales.SalesOrderDetail

SELECT ROUND(LineTotal, 2) AS 'ARREDONDAMENTO'
FROM Sales.SalesOrderDetail

SELECT SQRT(LineTotal) AS 'RAIZ QUADRADA'
FROM Sales.SalesOrderDetail
