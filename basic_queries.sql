use AdventureWorks2017;

-- SELECT 

SELECT * 
FROM Person.Person;

SELECT Title
FROM person.Person;

-- A equipe de marketing precisa fazer uma pesquisa sobre nomes mais comuns de seus clientes 
-- e precisa do nome e sobrenome de todos os cliente que est�o cadastrados no sistema.

SELECT FirstName, LastName
FROM Person.Person;
----------------------------------------------------------------------------------------------

-- DISTINCT

SELECT DISTINCT FirstName
FROM Person.Person

-- Quantos nomes sobrenomes �nicos temos em nossa tabela Person.Person?

SELECT DISTINCT LastName
FROM Person.Person
----------------------------------------------------------------------------------------------

-- WHERE

SELECT *
FROM Person.Person
WHERE LastName = 'Miller' AND FirstName = 'Anna';

/*
OPERADOR	-	DESCRI��O
=				IGUAL
>				MAIOR QUE
<				MENOR QUE
>=				MAIOR QUE OU IGUAL
<=				MENOR QUE OU IGUAL
<>				DIFERENTE DE
AND				OPERADOR L�GICO E
OR				OPERADOR L�GICO OU
*/

SELECT *
FROM Production.Product
WHERE Color = 'blue' OR Color = 'black';

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 AND ListPrice < 5000;

SELECT *
FROM Production.Product
WHERE Color <> 'red';


--  A equipe de produ��o de produtos precisa do nome de todas as pe�as que pesam 
-- mais que 500kg mas n�o mais que 700kg para inspe��o.

SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight < 700;

-- Foi pedido pelo Marketing uma rela��o de todos os empregados que s�o casados e s�o asalariados

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'M' AND SalariedFlag = '1'

-- Um usu�rio chamado Peter Krebs est� devendo um pagamento, consiga o email dele para que possamos 
-- enviar uma cobran�a!

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter' AND LastName = 'Krebs'

SELECT * 
FROM Person.EmailAddress
WHERE BusinessEntityID = 26
----------------------------------------------------------------------------------------------

-- COUNT

SELECT COUNT(*) 
FROM Person.Person

SELECT COUNT(Title)
FROM Person.Person

SELECT COUNT(DISTINCT Title)
FROM Person.Person

-- Eu quero saber quantos produtos temos cadastrados em nossa tabela de produtos

SELECT COUNT(*)
FROM Production.Product

-- Eu quero saber quantos tamanhos de produtos temos cadastrado em nossa tabela 

SELECT COUNT(Size)
FROM Production.Product

-- Eu quero saber quantos tamanhos diferentes de produtos eu tenho cadastrado em nossa tabela

SELECT COUNT(DISTINCT Size)
FROM Production.Product
----------------------------------------------------------------------------------------------

-- TOP

SELECT TOP 10 *
FROM Production.Product
----------------------------------------------------------------------------------------------

-- ORDER BY

SELECT *
FROM Person.Person
ORDER BY FirstName asc -- crescente

SELECT *
FROM Person.Person
ORDER BY FirstName desc -- decrescente

SELECT FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY MiddleName asc

-- Obter o ProductId dos 10 produtos mais caros cadastrados no sistema, listando
-- os mais caro para o mais barato

SELECT TOP 10 ProductID
FROM Production.Product 
ORDER BY ListPrice desc;

-- Obter o nome e numero do produto dos produtos que tem o ProductID entre 1~4

SELECT TOP 4 Name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc;
----------------------------------------------------------------------------------------------

-- BETWEEN
-- o between � usado para encontrar valor entre um valor m�nimo e valor m�ximo

SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 1000 and 1500;

SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 and 1500;

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate;
----------------------------------------------------------------------------------------------

-- IN
-- n�s usamos o operador IN junto com o WHERE
-- para verificar se um valor correspondem com qualquer valor passado na lista de valores

SELECT * 
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

SELECT * 
FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13)
----------------------------------------------------------------------------------------------

-- LIKE

SELECT *
FROM Person.Person
WHERE FirstName LIKE 'ovi%';

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%to';

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%essa%';

SELECT *
FROM Person.Person
WHERE FirstName LIKE '%ro_'

-- Quantos produtos temos cadastrados no sistema qe custam mais que 1500 dolares?

SELECT COUNT(ListPrice)
FROM Production.Product
WHERE ListPrice >= 1500;

-- Quantas pessoas temos com o sobrenome que inicia com a letra P?

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'p%';

-- Em quantas cidades �nicas est�o cadastrados nossos clientes?

SELECT COUNT(DISTINCT City)
FROM Person.Address

-- Quais s�o as cidades �nicas que temos cadastrados em nosso sistema?

SELECT DISTINCT City
FROM Person.Address

-- Quantos produtos vermelhos tem o preco entre 500 a 1000 dolares?

SELECT COUNT(Name)
FROM Production.Product
WHERE ListPrice BETWEEN 500 AND 1000 
AND Color LIKE 'red'

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red'
AND ListPrice BETWEEN 500 AND 1000

-- Quantos produtos cadastrados tem a palavra 'road' no nome deles?

SELECT COUNT(*)
FROM Production.Product
WHERE Name LIKE '%road%';
----------------------------------------------------------------------------------------------

-- MIN MAX SUM AVG
-- fun��es de agrega��o basicamente agregam ou combinam dados de uma tabela em 1 resultado s� 

SELECT TOP 10 SUM(LineTotal) AS 'Soma das Vendas'
FROM Sales.SalesOrderDetail

SELECT TOP 10 MIN(LineTotal) AS 'Menor valor das Vendas'
FROM Sales.SalesOrderDetail

SELECT TOP 10 MAX(LineTotal) AS 'Maior valor das Vendas'
FROM Sales.SalesOrderDetail

SELECT TOP 10 AVG(LineTotal) AS 'M�dia valor das Vendas'
FROM Sales.SalesOrderDetail
----------------------------------------------------------------------------------------------

-- GROUP BY
-- basicamente divide o resultado da sua pesquisa em grupos

SELECT *
FROM Sales.SalesOrderDetail

SELECT SpecialOfferID, SUM(UnitPrice) AS 'Soma Pre�o Unit�rio'
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID

-- vamos dizer que eu quero saber quantos cada produto foi vendido at� hoje

SELECT ProductID, COUNT(ProductID) AS 'Contagem'
FROM Sales.SalesOrderDetail
GROUP BY ProductID

-- vamos dizer que eu quero saber quantos nomes de cada nome temos cadastrados em nosso banco de dados 

SELECT FirstName, COUNT(FirstName) AS 'Nomes'
FROM Person.Person
GROUP BY FirstName 


-- na tabela production.product eu quero saber a m�dia de pre�o para os produtos que s�o pratas (silver)

SELECT Name, AVG(ListPrice) AS 'M�dia pre�o'
FROM Production.Product
WHERE Color = 'silver'
GROUP BY Name 

SELECT color, AVG(ListPrice) AS 'Pre�o'
From Production.Product
WHERE Color = 'Silver'
GROUP BY Color

-- Eu preciso saber quantas pessoas tem o mesmo MiddleName aprupadas por o MiddleName

SELECT MiddleName, COUNT(*) AS 'Contagem'
FROM Person.Person
GROUP BY MiddleName

-- Eu preciso saber em m�dia qual � a quantidade (quantity) que cada produto � vendido na loja

SELECT ProductID, AVG(OrderQty) AS 'M�dia'
FROM Sales.SalesOrderDetail
GROUP BY ProductID


-- Eu quero saber qual forma as 10 vendas que no total tiveram os maiores valores de venda(line total)
-- por produto do maior valor para o menor

SELECT *
FROM Sales.SalesOrderDetail 

SELECT TOP 10 ProductID, SUM(linetotal) AS 'Soma'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY SUM(LineTotal) DESC;

-- Eu preciso saber quantos produtos e qual e quantidade media de produtos temos cadastrados nas nossas 
-- ordem de servi�o (WorkOrder), agrupados por ProductID

SELECT ProductID, COUNT(ProductID) AS 'Contagem', AVG(OrderQty) AS 'M�dia'
FROM Production.WorkOrder
GROUP BY ProductID
----------------------------------------------------------------------------------------------