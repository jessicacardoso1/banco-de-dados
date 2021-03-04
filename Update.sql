--- UPTADE tabela
-- SET coluna = valor
-- WHERE "filtro"

UPDATE tbl_Livro
SET Preco_Livro = 65.45
WHERE ID_livro = 102;

SELECT * FROM tbl_autores

UPDATE tbl_autores
SET Sobrenome_Autor = 'Rocha'
WHERE ID_Autor = 3;

UPDATE tbl_Livro 
SET Preco_Livro = 80.00,
ISBN ='02202020'
WHERE ID_livro = 101;
