
use db_Biblioteca

ALTER TABLE tbl_livro
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor foreign key(ID_Autor) 
references tbl_autores

ALTER TABLE tbl_Livro
ADD ID_editora SMALLINT NOT NULL
CONSTRAINT fk_id_editora FOREIGN KEY(ID_editora)
REFERENCES tbl_editoras

ALTER TABLE tbl_Livro
ALTER COLUMN ID_Autor SMALLINT

DROP TABLE tbl_teste_identidade