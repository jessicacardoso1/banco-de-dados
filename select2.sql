select * from tbl_Livro
ORDER BY Nome_Livro desc

SELECT DISTINCT Nome_Livro from tbl_Livro

SELECT DISTINCT ID_Autor from tbl_livro

SELECT Nome_Livro from tbl_Livro WHERE Nome_Livro = 'Windos Server'

SELECT * FROM tbl_Livro
WHERE ID_livro > 101 or ID_Autor < 3

-- SELECT TOP
SELECT TOP 10 PERCENT Nome_Livro FROM tbl_livro

SELECT TOP 3 Nome_Livro FROM tbl_Livro

-- ALIAS (�lias)
SELECT Nome_Livro AS Livro From tbl_Livro

SELECT Nome_Livro AS Livro, ID_autor Autor From tbl_Livro

-- Operador UNION
-- Une os id's dos autores e n�o repete
SELECT ID_Autor from tbl_autores
UNION
SELECT ID_Autor from tbl_Livro

-- Une os id's dos autores e repete
SELECT ID_Autor from tbl_autores
UNION ALL
SELECT ID_Autor from tbl_Livro

SELECT Nome_Autor from tbl_autores
UNION ALL
SELECT Nome_Livro from tbl_Livro

--SELECT INTO
--Seleciona os dados de umma ou mais tabelas e os insere em uma tabela diferente.
--Pode ser usada para criar c�pias de backup de tabelas
SELECT ID_Livro,Nome_Livro, ISBN
INTO Livro_ISBN
FROM tbl_Livro
WHERE ID_Livro > 2

SELECT *
INTO tbl_Livro_backup
FROM tbl_Livro

--SELECT FUN��ES 
SELECT COUNT(*) FROM tbl_autores;
SELECT MAX(Preco_Livro) Pre�oMaximo FROM tbl_Livro
SELECT MIN(Preco_Livro) Pre�oMinimo FROM tbl_Livro
SELECT AVG(Preco_Livro) M�dia FROM tbl_Livro
SELECT SUM(Preco_Livro) Pre�oTotal FROM tbl_Livro