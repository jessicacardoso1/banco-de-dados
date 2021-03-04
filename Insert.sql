INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
values (1, 'Daniel', 'Santos')

INSERT INTO tbl_Autores(ID_Autor, Nome_Autor, SobreNome_Autor)
values (2, 'Jessica', 'Rocha')

INSERT INTO tbl_Autores(ID_Autor, Nome_Autor, SobreNome_Autor)
values (3, 'Jose', 'Silva')
INSERT INTO tbl_Autores(ID_Autor, Nome_Autor, SobreNome_Autor)
values (4, 'Joao', 'Gabriel')


INSERT INTO tbl_Editoras(Nome_Editora)
VALUES('Intreseca')
INSERT INTO tbl_Editoras(Nome_Editora)
VALUES('Microsoft Press')
INSERT INTO tbl_Editoras(Nome_Editora)
VALUES('Wiley')
INSERT INTO tbl_Editoras(Nome_Editora)
VALUES('O Reilly')

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES('Fedora', 12345555, '20101101',65.55,3,1)

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES('Windos Server', 23345855, '20041101',66.55,4,3)

INSERT INTO tbl_Livro(Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_editora)
VALUES('Microsoft', 123485755, '20001101',65.55,4,3)
