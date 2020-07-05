/*
* VERIFICA OS RECEBIMENTOS DE USUÃ?RIOS EM UMA DETERMINADA FAIXA DE TEMPO.
*/
SELECT 
    USU.usu_cpf "CPF DO USUÃ?RIO", 
    USU.usu_nome "NOME DO USUÃ?RIO",
    TRA.traEmp_id "NÃšMERO DA TRANSAÃ‡ÃƒO",
    TRA.traEmp_valorLiquido "VALOR LIQUIDO PAGO"

FROM USUARIO USU, TRANSACAO_EMPRESA TRA
WHERE
    USU.usu_id = TRA.usu_id AND
    TRA.traEmp_tipoTransacao LIKE 'recebimentos' AND
    TRA.traEmp_dataTransacao BETWEEN 
    TO_DATE(nvl('','01/05/2020'),'DD/MM/YYYY') AND TO_DATE(nvl('','31/05/2020'),'DD/MM/YYYY');


/*
* VERIFICA OS RECEBIMENTO DE USUÃ?RIOS EM UMA DETERMINADA FAIXA DE TEMPO.
*/
SELECT
    DISTINCT USU.usu_nome "NOME FUNCIONÃ?RIO",
    TEL.tel_ddd "DDD",
    TEL.tel_numero "TELEFONE",
    STR.tip_descricao "SETOR",
    EMP.emp_nome_fantasia "NOME DA EMPRESA",
    TPF.funcao_salario "SALÃ?RIO"
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
    
    
SELECT 
    USU.usu_nome "NOME DO USUÁRIO", 
    USU.usu_cpf "CPF DO USUÁRIO",
    TRA.trans_data "DATA PARA PAGAMENTO",
    TREMP.traemp_datatransacao "DATA DE PAGAMENTO",
    EMP.emp_nome_fantasia "NOME DA EMPRESA",
    TREMP.traEmp_descricao "DESCRIÇÃO DA TRANSAÇÃO",
    'R$ ' || TREMP.traEmp_valorLiquido "VALOR LIQUIDO PAGO"
FROM 
    USUARIO USU, 
    TRANSACAO TRA,
    TRANSACAO_EMPRESA TREMP,
    EMPRESA EMP
WHERE
    USU.usu_id = TREMP.usu_id AND 
    TREMP.trans_id = TRA.trans_id AND
    TREMP.traemp_datatransacao > TRA.trans_data AND
    UPPER(TRA.TRANS_DESCRICAO) LIKE 'R%' AND
    TREMP.traemp_datatransacao BETWEEN 
    TO_DATE(nvl('','01/06/2020'),'DD/MM/YYYY') AND TO_DATE(nvl('','30/06/2020'),'DD/MM/YYYY');




