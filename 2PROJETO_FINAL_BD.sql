DROP TABLE transacao_empresa; 

DROP TABLE transacao; 

DROP TABLE funcao_func; 

DROP TABLE funcionario; 

DROP TABLE tipo_funcao; 

DROP TABLE tipo_setor; 

DROP TABLE socio; 

DROP TABLE aluno; 

DROP TABLE telefone_empresa; 

DROP TABLE endereco_empresa; 

DROP TABLE empresa; 

DROP TABLE telefone; 

DROP TABLE endereco; 

DROP TABLE usuario; 

DROP TABLE historico_transacao_empresa; 

DROP TABLE historico_tipo_funcao; 

CREATE TABLE usuario 
  ( 
     usu_id    NUMBER NOT NULL PRIMARY KEY, 
     usu_cpf   VARCHAR2(15) NOT NULL, 
     usu_rg    VARCHAR2(15) NOT NULL, 
     usu_email VARCHAR2(200) NOT NULL, 
     usu_nome  VARCHAR2(200) NOT NULL, 
     usu_senha VARCHAR2(20) NOT NULL 
  ); 

CREATE TABLE endereco 
  ( 
     end_id          NUMBER NOT NULL PRIMARY KEY, 
     usu_id          NUMBER NOT NULL, 
     end_cep         VARCHAR2(10) NOT NULL, 
     end_logradouro  VARCHAR2(150) NOT NULL, 
     end_numero      NUMBER, 
     end_complemento VARCHAR2(50), 
     end_cidade      VARCHAR2(150) NOT NULL, 
     end_estado      VARCHAR2(100) NOT NULL, 
     end_bairro      VARCHAR2(100) NOT NULL 
  ); 

ALTER TABLE endereco 
  ADD FOREIGN KEY(usu_id)REFERENCES usuario(usu_id); 

CREATE TABLE telefone 
  ( 
     tel_id     NUMBER NOT NULL PRIMARY KEY, 
     usu_id     NUMBER NOT NULL, 
     tel_ddd    NUMBER NOT NULL, 
     tel_numero VARCHAR2(10) NOT NULL 
  ); 

ALTER TABLE telefone 
  ADD FOREIGN KEY(usu_id)REFERENCES usuario(usu_id); 

CREATE TABLE empresa 
  ( 
     emp_id                 NUMBER NOT NULL PRIMARY KEY, 
     emp_cnpj               VARCHAR2(20) NOT NULL, 
     emp_incricao_municipal VARCHAR2(25) NOT NULL, 
     emp_incricao_estadual  VARCHAR2(25) NOT NULL, 
     emp_nome_fantasia      VARCHAR2(150) NOT NULL, 
     emp_razao_social       VARCHAR2(200) NOT NULL 
  ); 

CREATE TABLE endereco_empresa 
  ( 
     empend_id          NUMBER NOT NULL PRIMARY KEY, 
     emp_id             NUMBER NOT NULL, 
     empend_cep         VARCHAR2(10) NOT NULL, 
     empend_logradouro  VARCHAR2(150) NOT NULL, 
     empend_numero      NUMBER, 
     empend_complemento VARCHAR2(50), 
     empend_cidade      VARCHAR2(150) NOT NULL, 
     empend_estado      VARCHAR2(100) NOT NULL, 
     empend_bairro      VARCHAR2(100) NOT NULL, 
     empend_email       VARCHAR2(200), 
     empend_site        VARCHAR2(200) 
  ); 

ALTER TABLE endereco_empresa 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

CREATE TABLE telefone_empresa 
  ( 
     emptel_id     NUMBER NOT NULL PRIMARY KEY, 
     emp_id        NUMBER NOT NULL, 
     emptel_ddd    NUMBER NOT NULL, 
     emptel_numero VARCHAR2(20) NOT NULL 
  ); 

ALTER TABLE telefone_empresa 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

CREATE TABLE aluno 
  ( 
     alu_ra NUMBER NOT NULL PRIMARY KEY, 
     usu_id NUMBER NOT NULL, 
     emp_id NUMBER NOT NULL 
  ); 

ALTER TABLE aluno 
  ADD FOREIGN KEY(usu_id)REFERENCES usuario(usu_id); 

ALTER TABLE aluno 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

CREATE TABLE socio 
  ( 
     soc_id NUMBER NOT NULL PRIMARY KEY, 
     usu_id NUMBER NOT NULL, 
     emp_id NUMBER NOT NULL 
  ); 

ALTER TABLE socio 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

ALTER TABLE socio 
  ADD FOREIGN KEY(usu_id)REFERENCES usuario(usu_id); 

CREATE TABLE tipo_setor 
  ( 
     tip_setorid   NUMBER NOT NULL PRIMARY KEY, 
     tip_descricao VARCHAR2(100) NOT NULL, 
     emp_id        NUMBER NOT NULL 
  ); 

ALTER TABLE tipo_setor 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

CREATE TABLE tipo_funcao 
  ( 
     funcao_id        NUMBER NOT NULL PRIMARY KEY, 
     funcao_descricao VARCHAR2(100) NOT NULL, 
     funcao_salario   NUMBER(10, 2) NOT NULL, 
     emp_id           NUMBER NOT NULL, 
     tip_setorid      NUMBER NOT NULL 
  ); 

ALTER TABLE tipo_funcao 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

ALTER TABLE tipo_funcao 
  ADD FOREIGN KEY(tip_setorid)REFERENCES tipo_setor(tip_setorid); 

CREATE TABLE funcionario 
  ( 
     fun_id   NUMBER NOT NULL PRIMARY KEY, 
     fun_ctps VARCHAR2(20) NOT NULL, 
     usu_id   NUMBER NOT NULL, 
     emp_id   NUMBER NOT NULL 
  ); 

ALTER TABLE funcionario 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

ALTER TABLE funcionario 
  ADD FOREIGN KEY(usu_id)REFERENCES usuario(usu_id); 

CREATE TABLE funcao_func 
  ( 
     fun_id    NUMBER NOT NULL, 
     funcao_id NUMBER NOT NULL, 
     emp_id    NUMBER NOT NULL 
  ); 

ALTER TABLE funcao_func 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

ALTER TABLE funcao_func 
  ADD FOREIGN KEY(fun_id)REFERENCES funcionario(fun_id); 

ALTER TABLE funcao_func 
  ADD FOREIGN KEY(funcao_id)REFERENCES tipo_funcao(funcao_id); 

CREATE TABLE transacao 
  ( 
     trans_id        NUMBER NOT NULL PRIMARY KEY, 
     trans_descricao VARCHAR2(100) NOT NULL, 
     trans_data      DATE, 
     emp_id          NUMBER NOT NULL 
  ); 

ALTER TABLE transacao 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

CREATE TABLE transacao_empresa 
  ( 
     traemp_id            NUMBER NOT NULL PRIMARY KEY, 
     traemp_descricao     VARCHAR2(100) NOT NULL, 
     traemp_tipotransacao VARCHAR2(100) NOT NULL, 
     traemp_valorbruto    NUMBER(8, 2) NOT NULL, 
     traemp_valorliquido  NUMBER(8, 2) NOT NULL, 
     traemp_datatransacao DATE, 
     trans_id             NUMBER NOT NULL, 
     emp_id               NUMBER NOT NULL, 
     usu_id               NUMBER NOT NULL 
  ); 

ALTER TABLE transacao_empresa 
  ADD FOREIGN KEY(emp_id)REFERENCES empresa(emp_id); 

ALTER TABLE transacao_empresa 
  ADD FOREIGN KEY(trans_id)REFERENCES transacao(trans_id); 

ALTER TABLE transacao_empresa 
  ADD FOREIGN KEY(usu_id)REFERENCES usuario(usu_id); 

CREATE TABLE historico_transacao_empresa 
  ( 
     data                 DATE, 
     user_log             VARCHAR2(30), 
     traemp_id            NUMBER NOT NULL, 
     traemp_descricao     VARCHAR2(100) NOT NULL, 
     traemp_tipotransacao VARCHAR2(100) NOT NULL, 
     traemp_valorbruto    NUMBER(8, 2) NOT NULL, 
     traemp_valorliquido  NUMBER(8, 2) NOT NULL, 
     traemp_datatransacao DATE, 
     trans_id             NUMBER NOT NULL, 
     emp_id               NUMBER NOT NULL, 
     usu_id               NUMBER NOT NULL 
  ); 

CREATE TABLE historico_tipo_funcao 
  ( 
     data             DATE, 
     user_log         VARCHAR2(30), 
     funcao_id        NUMBER NOT NULL, 
     funcao_descricao VARCHAR2(100) NOT NULL, 
     funcao_salario   NUMBER(10, 2) NOT NULL, 
     emp_id           NUMBER NOT NULL, 
     tip_setorid      NUMBER NOT NULL 
  ); 