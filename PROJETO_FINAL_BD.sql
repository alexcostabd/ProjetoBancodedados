DROP TABLE TRANSACAO_EMPRESA;
DROP TABLE TRANSACAO;
DROP TABLE FUNCAO_FUNC;
DROP TABLE FUNCIONARIO;
DROP TABLE TIPO_FUNCAO;
DROP TABLE TIPO_SETOR;
DROP TABLE SOCIO;
DROP TABLE ALUNO;
DROP TABLE TELEFONE_EMPRESA;
DROP TABLE ENDERECO_EMPRESA;
DROP TABLE EMPRESA;
DROP TABLE TELEFONE;
DROP TABLE ENDERECO; 
DROP TABLE USUARIO;


CREATE TABLE USUARIO (
    usu_id NUMBER NOT NULL  Primary key,
    usu_cpf varchar2(15) NOT NULL,
    usu_rg varchar2(15) NOT NULL,
    usu_email varchar2(200) NOT NULL,
    usu_nome varchar2(200) NOT NULL,
    usu_senha varchar2(20) NOT NULL
);

CREATE TABLE ENDERECO (
    end_id NUMBER NOT NULL  Primary key,
    usu_id NUMBER NOT NULL,
    end_cep varchar2(10) NOT NULL,
    end_logradouro varchar2(150) NOT NULL,
    end_numero NUMBER,
    end_complemento varchar2(50),
    end_cidade varchar2(150) NOT NULL,
    end_estado varchar2(100) NOT NULL,
    end_bairro varchar2(100) NOT NULL
);
ALTER TABLE ENDERECO ADD  FOREIGN KEY (usu_id) REFERENCES USUARIO(usu_id);



CREATE TABLE TELEFONE (
    tel_id NUMBER NOT NULL Primary key,
    usu_id NUMBER NOT NULL,
    tel_ddd NUMBER NOT NULL,
    tel_numero varchar2(10) NOT NULL
);
ALTER TABLE TELEFONE ADD FOREIGN KEY (usu_id) REFERENCES USUARIO(usu_id);

CREATE TABLE EMPRESA (
    emp_id NUMBER NOT NULL Primary key,
    emp_cnpj VARCHAR2(20) NOT NULL,
    emp_incricao_municipal varchar2(25) NOT NULL,
    emp_incricao_estadual varchar2(25) NOT NULL,
    emp_nome_fantasia varchar2(150) NOT NULL,
    emp_razao_social varchar2(200) NOT NULL
);


CREATE TABLE ENDERECO_EMPRESA (
    EMPend_id NUMBER NOT NULL  Primary key,
    emp_id NUMBER NOT NULL,
    EMPend_cep varchar2(10) NOT NULL,
    EMPend_logradouro varchar2(150) NOT NULL,
    EMPend_numero NUMBER,
    EMPend_complemento varchar2(50),
    EMPend_cidade varchar2(150) NOT NULL,
    EMPend_estado varchar2(100) NOT NULL,
    EMPend_bairro varchar2(100) NOT NULL,
    EMPend_email varchar2(200),
    EMPend_site varchar2(200)
);
ALTER TABLE ENDERECO_EMPRESA ADD  FOREIGN KEY (emp_id) REFERENCES EMPRESA(emp_id);

CREATE TABLE TELEFONE_EMPRESA (
    EMPtel_id NUMBER NOT NULL Primary key,
    emp_id NUMBER NOT NULL,
    EMPtel_ddd NUMBER NOT NULL,
    EMPtel_numero varchar2(20) NOT NULL
);
ALTER TABLE TELEFONE_EMPRESA ADD  FOREIGN KEY (emp_id) REFERENCES EMPRESA(emp_id);


CREATE TABLE ALUNO(
    alu_ra NUMBER NOT NULL primary key,
    usu_id NUMBER NOT NULL,
    emp_id NUMBER NOT NULL
);
ALTER TABLE ALUNO ADD FOREIGN KEY (usu_id) REFERENCES USUARIO(usu_id);
ALTER TABLE ALUNO ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);

CREATE TABLE SOCIO (
    soc_id NUMBER NOT NULL primary keY,
    usu_id NUMBER NOT NULL,
    emp_id NUMBER NOT NULL
);
ALTER TABLE SOCIO ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);
ALTER TABLE SOCIO ADD FOREIGN KEY (usu_id) REFERENCES USUARIO (usu_id);

CREATE TABLE TIPO_SETOR (
    tip_setorid NUMBER NOT NULL Primary key,
    tip_descricao VARCHAR2(100) NOT NULL,
    emp_id NUMBER NOT NULL
);
ALTER TABLE TIPO_SETOR ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);

CREATE TABLE TIPO_FUNCAO (
    funcao_id NUMBER NOT NULL Primary key,
    funcao_descricao VARCHAR2(100) NOT NULL,
    funcao_salario NUMBER(10,2) NOT NULL,
    emp_id NUMBER NOT NULL, 
    tip_setorid NUMBER NOT NULL

);
ALTER TABLE TIPO_FUNCAO ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);
ALTER TABLE TIPO_FUNCAO ADD FOREIGN KEY (tip_setorid) REFERENCES TIPO_SETOR (tip_setorid);


CREATE TABLE FUNCIONARIO (
    fun_id NUMBER NOT NULL primary key,
    fun_ctps varchar2(20) NOT NULL, 
    usu_id NUMBER NOT NULL,    
    emp_id NUMBER NOT NULL
);
ALTER TABLE FUNCIONARIO ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);
ALTER TABLE FUNCIONARIO ADD FOREIGN KEY (usu_id) REFERENCES USUARIO(usu_id);

CREATE TABLE FUNCAO_FUNC(
    fun_id NUMBER NOT NULL,
    funcao_id NUMBER NOT NULL,
    emp_id NUMBER NOT NULL
);
ALTER TABLE FUNCAO_FUNC ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);
ALTER TABLE FUNCAO_FUNC ADD FOREIGN KEY (fun_id) REFERENCES FUNCIONARIO(fun_id);
ALTER TABLE FUNCAO_FUNC ADD FOREIGN KEY (funcao_id) REFERENCES TIPO_FUNCAO(funcao_id);

CREATE TABLE TRANSACAO (
    trans_id NUMBER NOT NULL Primary key,
    trans_descricao varchar2(100) NOT NULL,
    trans_data DATE,
    emp_id NUMBER NOT NULL
); 
ALTER TABLE TRANSACAO ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);



CREATE TABLE TRANSACAO_EMPRESA (
    traEmp_id NUMBER NOT NULL Primary key,
    traEmp_descricao VARCHAR2(100) NOT NULL,
    traEmp_tipoTransacao VARCHAR2(100) NOT NULL,
    traEmp_valorBruto NUMBER(8,2) NOT NULL,
    traEmp_valorLiquido NUMBER(8,2) NOT NULL,
    traEmp_dataTransacao DATE,
    trans_id NUMBER NOT NULL,
    emp_id NUMBER NOT NULL ,
    usu_id NUMBER NOT NULL  
);
ALTER TABLE TRANSACAO_EMPRESA ADD FOREIGN KEY (emp_id) REFERENCES EMPRESA (emp_id);
ALTER TABLE TRANSACAO_EMPRESA ADD FOREIGN KEY (trans_id) REFERENCES TRANSACAO (trans_id);
ALTER TABLE TRANSACAO_EMPRESA ADD FOREIGN KEY (usu_id) REFERENCES USUARIO (usu_id);
