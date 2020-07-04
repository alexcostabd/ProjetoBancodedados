/* LISTAR ALUNOS DE UMA DETERMINADA EMPRESA */
SELECT 
ALUNO.ALU_RA AS RA, 
USUARIO.USU_NOME AS ALUNO, 
EMPRESA.EMP_NOME_FANTASIA AS EMPRESA 

FROM ALUNO, USUARIO, EMPRESA 

WHERE 
ALUNO.EMP_ID = 2020060001 AND
USUARIO.USU_ID = ALUNO.USU_ID AND
EMPRESA.EMP_ID = ALUNO.EMP_ID;

/* LISTAR FUNCIONARIOS DE UMA DETERMINADA EMPRESA */

SELECT 
USU.USU_NOME AS FUNCIONARIO, 
EMP.EMP_NOME_FANTASIA AS EMPRESA,
TF.FUNCAO_DESCRICAO AS FUNCAO

FROM 
FUNCIONARIO FUN, 
USUARIO USU, 
EMPRESA EMP, 
FUNCAO_FUNC FF, 
TIPO_FUNCAO TF

WHERE 
FUN.USU_ID = USU.USU_ID AND
FUN.EMP_ID = 2020060001 AND
EMP.EMP_ID = FUN.EMP_ID AND
FF.EMP_ID = EMP.EMP_ID AND
FF.FUN_ID = FUN.FUN_ID AND
FF.FUNCAO_ID = TF.FUNCAO_ID;

/*DADOS DE TELEFONE E ENDEREÇO DE ALUNO */

SELECT 
U.USU_NOME as ALUNO, 
E.END_CEP AS CEP,
E.END_LOGRADOURO AS LOGRADOURO,
E.END_NUMERO AS NUMERO,
E.END_COMPLEMENTO AS COMPLEMENTO,
E.END_CIDADE AS CIDADE, 
E.END_ESTADO AS UF,
E.END_BAIRRO AS BAIRRO,
T.TEL_DDD AS DDD,
T.TEL_NUMERO AS NUMERO_TELEFONE

FROM 
ALUNO A, 
USUARIO U, 
ENDERECO E, 
TELEFONE T

WHERE 
A.USU_ID = U.USU_ID AND
E.USU_ID = A.USU_ID AND
T.USU_ID = A.USU_ID AND
F.EMP_ID = 2020060001;

/*DADOS DE TELEFONE E ENDEREÇO DE FUNCIONARIO */

SELECT 
U.USU_NOME AS FUNCIONARIO, 
E.END_CEP AS CEP,
E.END_LOGRADOURO AS LOGRADOURO,
E.END_NUMERO AS NUMERO,
E.END_COMPLEMENTO AS COMPLEMENTO,
E.END_CIDADE AS CIDADE, 
E.END_ESTADO AS UF,
E.END_BAIRRO AS BAIRRO,
T.TEL_DDD AS DDD,
T.TEL_NUMERO AS NUMERO_TELEFONE

FROM 
FUNCIONARIO F, 
USUARIO U, 
ENDERECO E, 
TELEFONE T

WHERE 
F.USU_ID = U.USU_ID AND
E.USU_ID = F.USU_ID AND
T.USU_ID = F.USU_ID AND
F.EMP_ID = 2020060001;

/*ENDERECO DE UMA EMPRESA */

SELECT 
E.EMP_NOME_FANTASIA AS EMPRESA,
EE.EMPEND_CEP AS CEP,
EE.EMPEND_LOGRADOURO AS LOGRADOURO,
EE.EMPEND_NUMERO AS NUMERO,
EE.EMPEND_COMPLEMENTO AS COMPLEMENTO,
EE.EMPEND_CIDADE AS CIDADE, 
EE.EMPEND_ESTADO AS UF,
EE.EMPEND_BAIRRO AS BAIRRO,
EE.EMPEND_EMAIL AS EMAIL,
EE.EMPEND_SITE AS SITE

FROM EMPRESA E

INNER JOIN ENDERECO_EMPRESA EE ON
EE.EMP_ID = E.EMP_ID

WHERE 
E.EMP_ID = 2020060001;



