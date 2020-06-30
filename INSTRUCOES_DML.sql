
-- Select rows from a Table
SELECT A.ALU_RA, U.USU_NOME "Email", u.usu_cpf, u.usu_email "Nome"
FROM ALUNO A, USUARIO U
WHERE A.usu_id = U.usu_id;


-- Select rows from a Table

