/*
* VERIFICA OS RECEBIMENTOS DE USUÁRIOS EM UMA DETERMINADA FAIXA DE TEMPO.
*/
SELECT 
    USU.usu_cpf "CPF DO USUÁRIO", 
    USU.usu_nome "NOME DO USUÁRIO",
    TRA.traEmp_id "NÚMERO DA TRANSAÇÃO",
    TRA.traEmp_valorLiquido "VALOR LIQUIDO PAGO"

FROM USUARIO USU, TRANSACAO_EMPRESA TRA
WHERE
    USU.usu_id = TRA.usu_id AND
    TRA.traEmp_tipoTransacao LIKE 'recebimentos' AND
    TRA.traEmp_dataTransacao BETWEEN 
    TO_DATE(nvl('','01/05/2020'),'DD/MM/YYYY') AND TO_DATE(nvl('','31/05/2020'),'DD/MM/YYYY');


/*
* VERIFICA OS RECEBIMENTO DE USUÁRIOS EM UMA DETERMINADA FAIXA DE TEMPO.
*/
SELECT
    DISTINCT USU.usu_nome "NOME FUNCIONÁRIO",
    TEL.tel_ddd "DDD",
    TEL.tel_numero "TELEFONE",
    STR.tip_descricao "SETOR",
    EMP.emp_nome_fantasia "NOME DA EMPRESA",
    TPF.funcao_salario "SALÁRIO"
FROM 
    USUARIO USU, 
    FUNCIONARIO FUN,
    TELEFONE TEL,
    TIPO_SETOR STR,
    EMPRESA EMP,
    FUNCAO_FUNC FCA,
    TIPO_FUNCAO TPF
WHERE
    TEL.usu_id = USU.usu_id AND
    USU.usu_id = FUN.usu_id AND
    FUN.fun_id = FCA.fun_id AND
    FCA.funcao_id = TPF.funcao_id AND
    FCA.emp_id = FUN.emp_id AND
    STR.tip_setorid = TPF.tip_setorid AND
    UPPER(STR.tip_descricao) = 'PEDAGOGICO' AND
    TPF.funcao_salario BETWEEN '2000.00' AND '4000.00'
    ORDER BY USU.usu_nome;




