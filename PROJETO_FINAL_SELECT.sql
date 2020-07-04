Select 
    USU.usu_cpf "CPF DO USUÁRIO", 
    USU.usu_nome "NOME DO USUÁRIO",
    TRA.traEmp_id "NÚMERO DA TRANSAÇÃO",
    TRA.traEmp_valoLiquido "VALOR LIQUIDO PAGO"

from USUARIO USU, TRANSACAO_EMPRESA TRA
WHERE
    USU.usu_id = TRA.usu_id AND
    TRA.traEmp_dataTransacao BETWEEN 
    TO_DATE(nvl('','01/05/2020'),'DD/MM/YYYY') AND TO_DATE(nvl('','31/05/2020'),'DD/MM/YYYY');