use AdventureWorks2017;

-- INNER JOIN
-- Existem 3 tipos gerais de JOINS: INNER JOIN, OUTER JOIN E SELF-JOIN

SELECT tb1.BusinessEntityID, tb1.FirstName, tb1.LastName, tb2.EmailAddress
FROM Person.Person tb1
INNER JOIN Person.EmailAddress tb2 
ON tb1.BusinessEntityID = tb2.BusinessEntityID

-- vamo dizer que nós queremos os nomes dos produtos e as informações de suas subcategorias
-- ListPrice, Nome do Produto, Nome da Subcategoria

SELECT pr.ListPrice, pr.Name, pc.Name
FROM Production.Product pr
INNER JOIN Production.ProductSubcategory pc
ON pc.ProductCategoryID = pr.ProductSubcategoryID

-- produto cartesiano

SELECT TOP 10 *
FROM Person.BusinessEntityAddress ba
INNER JOIN Person.Address pa 
ON pa.AddressID = ba.AddressID

-- BussinessEntityID, Name, PhoneNumberTypeId, PhoneNumber

SELECT pp.BusinessEntityID, pn.Name, pp.PhoneNumberTypeID, pp.PhoneNumber
FROM Person.PersonPhone pp
INNER JOIN Person.PhoneNumberType pn
ON pp.PhoneNumberTypeID = pn.PhoneNumberTypeID

SELECT pp.BusinessEntityID, pp.FirstName, pn.PhoneNumberTypeID, pn.PhoneNumber
FROM Person.Person pp
INNER JOIN Person.PersonPhone pn
ON pp.BusinessEntityID = pn.BusinessEntityID

-- AddressId, City, StateProvinceId, Nome estado

SELECT pa.AddressID, pa.City, pa.StateProvinceID, ps.Name
FROM Person.Address pa
INNER JOIN Person.StateProvince ps
ON pa.StateProvinceID = ps.StateProvinceID

-- LEFT JOIN
-- quero descobrir quais pessoas tem um cartão de crédito registrado

SELECT * 
FROM Person.Person pp
INNER JOIN Sales.PersonCreditCard pc
ON pp.BusinessEntityID = pc.BusinessEntityID
-- INNER JOIN -> 19118

SELECT * 
FROM Person.Person pp
LEFT JOIN Sales.PersonCreditCard pc
ON pp.BusinessEntityID = pc.BusinessEntityID
-- LEFT JOIN -> 19972
 
SELECT 19972 - 19118

SELECT * 
FROM Person.Person pp
LEFT JOIN Sales.PersonCreditCard pc
ON pp.BusinessEntityID = pc.BusinessEntityID
WHERE pc.BusinessEntityID IS NULL


-- UNION 
-- combina dois ou mais resultados de um select em um resultado apenas

SELECT ProductId, Name, ProductNumber
	FROM Production.Product
	WHERE Name LIKE '%Chain%'
UNION
SELECT ProductId, Name, ProductNumber
	FROM Production.Product
	WHERE Name LIKE '%Decal%'


SELECT FirstName, Title
	FROM Person.Person
	WHERE Title = 'Mr.'
UNION 
SELECT FirstName, Title
	FROM Person.Person
	WHERE MiddleName = 'A'

