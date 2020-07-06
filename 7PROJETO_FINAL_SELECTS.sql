/* LISTAR ALUNOS DE UMA DETERMINADA EMPRESA */ 
SELECT aluno.alu_ra              AS RA, 
       usuario.usu_nome          AS ALUNO, 
       empresa.emp_nome_fantasia AS EMPRESA 
FROM   aluno, 
       usuario, 
       empresa 
WHERE  aluno.emp_id = 2020060001 
       AND usuario.usu_id = aluno.usu_id 
       AND empresa.emp_id = aluno.emp_id; 

/* LISTAR FUNCIONARIOS DE UMA DETERMINADA EMPRESA */ 
SELECT USU.usu_nome          AS FUNCIONARIO, 
       EMP.emp_nome_fantasia AS EMPRESA, 
       TF.funcao_descricao   AS FUNCAO 
FROM   funcionario FUN, 
       usuario USU, 
       empresa EMP, 
       funcao_func FF, 
       tipo_funcao TF 
WHERE  FUN.usu_id = USU.usu_id 
       AND FUN.emp_id = 2020060001 
       AND EMP.emp_id = FUN.emp_id 
       AND FF.emp_id = EMP.emp_id 
       AND FF.fun_id = FUN.fun_id 
       AND FF.funcao_id = TF.funcao_id; 

/*DADOS DE TELEFONE E ENDEREÇO DE ALUNO */ 
SELECT U.usu_nome        AS ALUNO, 
       E.end_cep         AS CEP, 
       E.end_logradouro  AS LOGRADOURO, 
       E.end_numero      AS NUMERO, 
       E.end_complemento AS COMPLEMENTO, 
       E.end_cidade      AS CIDADE, 
       E.end_estado      AS UF, 
       E.end_bairro      AS BAIRRO, 
       T.tel_ddd         AS DDD, 
       T.tel_numero      AS NUMERO_TELEFONE 
FROM   aluno A, 
       usuario U, 
       endereco E, 
       telefone T 
WHERE  A.usu_id = U.usu_id 
       AND E.usu_id = A.usu_id 
       AND T.usu_id = A.usu_id 
       AND f.emp_id = 2020060001; 

/*DADOS DE TELEFONE E ENDEREÇO DE FUNCIONARIO */ 
SELECT U.usu_nome        AS FUNCIONARIO, 
       E.end_cep         AS CEP, 
       E.end_logradouro  AS LOGRADOURO, 
       E.end_numero      AS NUMERO, 
       E.end_complemento AS COMPLEMENTO, 
       E.end_cidade      AS CIDADE, 
       E.end_estado      AS UF, 
       E.end_bairro      AS BAIRRO, 
       T.tel_ddd         AS DDD, 
       T.tel_numero      AS NUMERO_TELEFONE 
FROM   funcionario F, 
       usuario U, 
       endereco E, 
       telefone T 
WHERE  F.usu_id = U.usu_id 
       AND E.usu_id = F.usu_id 
       AND T.usu_id = F.usu_id 
       AND F.emp_id = 2020060001; 

/*ENDERECO DE UMA EMPRESA */ 
SELECT E.emp_nome_fantasia   AS EMPRESA, 
       EE.empend_cep         AS CEP, 
       EE.empend_logradouro  AS LOGRADOURO, 
       EE.empend_numero      AS NUMERO, 
       EE.empend_complemento AS COMPLEMENTO, 
       EE.empend_cidade      AS CIDADE, 
       EE.empend_estado      AS UF, 
       EE.empend_bairro      AS BAIRRO, 
       EE.empend_email       AS EMAIL, 
       EE.empend_site        AS SITE 
FROM   empresa E 
       inner join endereco_empresa EE 
               ON EE.emp_id = E.emp_id 
WHERE  E.emp_id = 2020060001; 

/*SOMA DE PAGAMENTOS DE UMA EMPRESA*/ 
SELECT DISTINCT SUM(traemp_valobruto)  AS VALOR_BRUTO_TOTAL_PAGAMENTOS, 
                SUM(traemp_valoliquido)AS VALOR_LIQUIDO_TOTAL_PAGAMENTOS 
FROM   transacao_empresa 
WHERE  emp_id = 2020060001 
       AND traemp_tipotransacao = 'PAGAMENTOS'; 

/*SOMA DE RECEBIMENTOS DE UMA EMPRESA*/ 
SELECT DISTINCT SUM(traemp_valobruto)  AS VALOR_BRUTO_TOTAL_RECEBIMENTOS, 
                SUM(traemp_valoliquido)AS VALOR_LIQUIDO_TOTAL_RECEBIMENTOS 
FROM   transacao_empresa 
WHERE  emp_id = 2020060001 
       AND traemp_tipotransacao = 'RECEBIMENTOS'; 

/* CUSTO TOTAL DE SALÁRIO DOS SETORES DE UMA EMPRESA*/ 
SELECT tipo_setor.tip_descricao                                       AS SETOR, 
       (SELECT 'R$ ' 
               || Cast(SUM(TF.funcao_salario)AS NUMBER(10, 2)) 
        FROM   funcao_func FF 
               inner join tipo_funcao TF 
                       ON TF.funcao_id = FF.funcao_id 
                          AND TF.tip_setorid = tipo_setor.tip_setorid)AS 
       CUSTO_SALARIAL 
FROM   tipo_setor 
WHERE  tipo_setor.emp_id = 2020060001; 

/* CUSTO MÉDIO DE SALÁRIO DOS SETORES DE UMA EMPRESA*/ 
SELECT tipo_setor.tip_descricao                                       AS SETOR, 
       (SELECT 'R$ ' 
               || Cast(Avg(TF.funcao_salario)AS NUMBER(10, 2)) 
        FROM   funcao_func FF 
               inner join tipo_funcao TF 
                       ON TF.funcao_id = FF.funcao_id 
                          AND TF.tip_setorid = tipo_setor.tip_setorid)AS 
       MÉDIA_SALARIAL 
FROM   tipo_setor 
WHERE  tipo_setor.emp_id = 2020060001; 