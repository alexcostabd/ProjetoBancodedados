  
CREATE OR REPLACE VIEW VERIFICA_PAGAMENTOS_VENCIDOS
AS
SELECT 
    USU.usu_nome "NOME DO USUÁRIO", 
    USU.usu_cpf "CPF DO USUÁRIO",
    TRA.trans_data "DATA PARA PAGAMENTO",
    TREMP.traemp_datatransacao "DATA DO PAGAMENTO",
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
    TREMP.traemp_datatransacao > TRA.trans_data 
    ORDER BY TRA.trans_data, TREMP.traemp_datatransacao
WITH READ ONLY;
