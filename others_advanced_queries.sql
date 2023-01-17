CREATE DATABASE YoutubeLite;

USE YoutubeLite;

-- CREATE TABLE
-- principais restrições que podem ser aplicadas
-- NOT NULL - não permite nulos
-- UNIQUE - força que todos os valores em uma coluna sejam diferentes 
-- PRIMARY KEY - uma junção de NOT NULL e UNIQUE
-- FOREIGN KEY - identifica unicamente uma linha em outra tabela
-- CHECK - força uma condição específica em uma coluna
-- DEFAULT - força um valor padrão quando nenhum valor é passado

CREATE TABLE Canal (
	CanalID INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	ContagemInscritos INT DEFAULT 0,
	DataCriacao DATETIME NOT NULL
);

SELECT *
FROM Canal


CREATE TABLE Video (
	VideoID INT PRIMARY KEY,
	Nome VARCHAR(150) NOT NULL,
	Visualizacoes INT DEFAULT 0,
	Likes INT DEFAULT 0,
	Dislikes INT DEFAULT 0,
	Duracao INT NOT NULL, 
	CanalID INT FOREIGN KEY REFERENCES Canal(CanalID)
);

SELECT *
FROM Video

-- INSERT INTO

CREATE TABLE Aula (
	Id INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL
);

INSERT INTO Aula (Id, Nome) VALUES (1, 'Português');

INSERT INTO Aula (Id, Nome) VALUES (2, 'Matemática'), (3, 'Física'), (4, 'Química');

SELECT * INTO AulaNova FROM Aula

SELECT * FROM AulaNova

-- UPDATE

UPDATE Aula 
SET Nome = 'Biologia'
WHERE Id = 3

SELECT *
FROM Aula

-- DELETE

SELECT *
FROM Aula

DELETE FROM Aula
WHERE Id = 4

-- ALTER TABLE
-- Adicionar, remover ou alterar uma coluna
-- setar valores padrões para uma coluna
-- adicionar ou remover restrições de uma coluna
-- renomear uma tabela

CREATE TABLE Youtube (
	Id INT PRIMARY KEY, 
	Nome VARCHAR(150) NOT NULL UNIQUE, 
	Categoria VARCHAR(200) NOT NULL, 
	DataCriacao DATETIME NOT NULL
);

ALTER TABLE Youtube 
ADD Ativo BIT

SELECT * 
FROM Youtube

ALTER TABLE Youtube
ALTER COLUMN Categoria VARCHAR(300) NOT NULL

EXEC sp_rename 'Youtube.Nome', 'NomeCanal', 'COLUMN' -- procedure para alterar o nome de uma tabela

-- DROP TABLE 

DROP TABLE Youtube

-- TRUNCATE 

TRUNCATE TABLE AulaNova

SELECT *
FROM AulaNova


-- CHECK CONSTRAINT 

CREATE TABLE CarteiraMotorista (
	Id INT NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Idade INT CHECK (Idade >= 18)
);

INSERT INTO CarteiraMotorista (Id, Nome, Idade) VALUES (1, 'Larrisa', 18);

SELECT * 
FROM CarteiraMotorista

-- NOT NULL CONSTRAINT 

INSERT INTO CarteiraMotorista (Id, Nome, Idade) VALUES (2,, 20); -- erro
INSERT INTO CarteiraMotorista (Id, Nome, Idade) VALUES (2,'Alexandre', 20); 

-- UNIQUE CONSTRAINT 

DROP TABLE CarteiraMotorista

CREATE TABLE CarteiraMotorista (
	Id INT NOT NULL,
	Nome VARCHAR(255) NOT NULL,
	Idade INT CHECK (Idade >= 18),
	CodigoCNH INT NOT NULL UNIQUE
);

INSERT INTO CarteiraMotorista (Id, Nome, Idade, CodigoCNH) VALUES (1, 'Larrisa', 18, 1234);
INSERT INTO CarteiraMotorista (Id, Nome, Idade, CodigoCNH) VALUES (2, 'Alexandre', 20, 12345);

use AdventureWorks2017;

-- VIEWS

CREATE VIEW [Pessoas Simplificado] AS 
SELECT FirstName, MiddleName, LastName
FROM Person.Person
WHERE Title = 'Ms.'

SELECT * FROM [Pessoas Simplificado]