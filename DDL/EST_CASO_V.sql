CREATE SCHEMA IF NOT EXISTS EST_CASO_V;
USE EST_CASO_V;
# CRIANDO AS TABELAS SEM CHAVES ESTRANGEIRAS
# ####################################################################################
# ##############################| CRIANDO A TABELA CLIENTES |#########################
# ####################################################################################
CREATE TABLE IF NOT EXISTS CLIENTES (
    ID_CLIENT INT PRIMARY KEY,
    CPF_CLIENT VARCHAR(14) NOT NULL,
    NOME_CLIENT VARCHAR(50) NOT NULL,
    DATA_NASC_CLIENT DATE NOT NULL,
    EMAIL_CLIENT VARCHAR(50) NOT NULL,
    TEL_CLIENT VARCHAR(20) NOT NULL,
    RUA_CLIENT VARCHAR(100) NOT NULL,
    NUM_RES_CLIENT INT,
    CEP_CLIENT VARCHAR(10) NOT NULL,
    BAIRRO_CLIENT VARCHAR(50) NOT NULL,
    CIDADE_CLIENT VARCHAR(50) NOT NULL,
    UF_CLIENT VARCHAR(2) NOT NULL,
    STATUS_FID_CLIENT ENUM('ATIVO', 'INATIVO')
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA CLIENTES]
ALTER TABLE CLIENTES ADD COLUMN DESCRICAO_CLIENT TEXT NOT NULL;
ALTER TABLE CLIENTES MODIFY COLUMN DESCRICAO_CLIENT VARCHAR(100);
ALTER TABLE CLIENTES CHANGE COLUMN DESCRICAO_CLIENT DESCRICAO_CLIENTE VARCHAR(100);
ALTER TABLE CLIENTES DROP COLUMN DESCRICAO_CLIENTE;
# ####################################################################################
# ##############################| CRIANDO A TABELA PRODUTOS |#########################
# ####################################################################################
CREATE TABLE IF NOT EXISTS PRODUTOS (
    ID_PROD INT PRIMARY KEY,
    NOME_PROD VARCHAR(50) NOT NULL,
    QTD_EST_PROD INT NOT NULL,
    VALOR_UNIT_PROD DECIMAL(4, 2) NOT NULL,
    ESP_TEC_PROD TEXT NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PRODUTOS]
ALTER TABLE PRODUTOS ADD column DESCRICAO_PROD TEXT NOT NULL;
ALTER TABLE PRODUTOS MODIFY COLUMN DESCRICAO_PROD VARCHAR(100);
ALTER TABLE PRODUTOS CHANGE COLUMN DESCRICAO_PROD DESCRICAO_PROD1 VARCHAR(100);
ALTER TABLE PRODUTOS DROP COLUMN DESCRICAO_PROD1;
# ####################################################################################
# ##############################| CRIANDO A TABELA FORNECEDORES |#####################
# ####################################################################################
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    ID_FORN INT PRIMARY KEY,
    RAZ_SOC_FORN VARCHAR(50) NOT NULL,
    CNPJ_FORN VARCHAR(20) NOT NULL,
    EMAIL_FORN VARCHAR(50) NOT NULL,
    TEL_FORN VARCHAR(20) NOT NULL,
    RUA_FORN VARCHAR(100) NOT NULL,
    NUM_LOC_FORN INT,
    CEP_FORN VARCHAR(10) NOT NULL,
    BAIRRO_FORN VARCHAR(50) NOT NULL,
    CIDADE_FORN VARCHAR(50) NOT NULL,
    UF_FORN VARCHAR(2),
    PAIS_FORN VARCHAR(50) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA FORNECEDORES]
ALTER TABLE FORNECEDORES ADD column DESCRICAO_FORN TEXT NOT NULL;
ALTER TABLE FORNECEDORES MODIFY COLUMN DESCRICAO_FORN VARCHAR(100);
ALTER TABLE FORNECEDORES CHANGE COLUMN DESCRICAO_FORN DESCRICAO_FORN1 VARCHAR(100);
ALTER TABLE FORNECEDORES DROP COLUMN DESCRICAO_FORN1;
# ####################################################################################
# ##############################| CRIANDO A TABELA VENDAS |###########################
# ####################################################################################
CREATE TABLE IF NOT EXISTS VENDAS (
    ID_VENDA INT PRIMARY KEY,
    VALOR_VENDA DECIMAL(10, 2) NOT NULL,
    DATA_VENDA DATE NOT NULL,
    CLIENTE_VENDA INT NOT NULL,
    CONSTRAINT FK_VENDA_CLIENTES FOREIGN KEY (CLIENTE_VENDA) REFERENCES CLIENTES (ID_CLIENT)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA VENDAS]
ALTER TABLE VENDAS ADD column DESCRICAO_VENDA TEXT NOT NULL;
ALTER TABLE VENDAS MODIFY COLUMN DESCRICAO_VENDA VARCHAR(100);
ALTER TABLE VENDAS CHANGE COLUMN DESCRICAO_VENDA DESCRICAO_VENDA1 VARCHAR(100);
ALTER TABLE VENDAS DROP COLUMN DESCRICAO_VENDA1;
# ####################################################################################
# ##############################| CRIANDO A TABELA PAGAMENTOS |#######################
# ####################################################################################
CREATE TABLE IF NOT EXISTS PAGAMENTOS (
    ID_PAG INT PRIMARY KEY,
    VALOR_PAG DECIMAL(10, 2) NOT NULL,
    DATA_PAG DATE NOT NULL,
    DESCONTO_PAG DECIMAL(10, 2) NOT NULL,
    PARCELAS_PAG INT NOT NULL,
    ID_FORM_PAG INT NOT NULL,
    STATUS_PAG ENUM('PAGO', 'PENDENTE'),
    VENDA_PAG INT NOT NULL,
    CONSTRAINT FK_PAG_VENDAS FOREIGN KEY (VENDA_PAG) REFERENCES VENDAS (ID_VENDA)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PAGAMENTOS]
ALTER TABLE PAGAMENTOS ADD column DESC_FORN TEXT NOT NULL;
ALTER TABLE PAGAMENTOS MODIFY COLUMN DESC_FORN VARCHAR(100);
ALTER TABLE PAGAMENTOS CHANGE COLUMN DESC_FORN DESCR_FORN1 VARCHAR(100);
ALTER TABLE PAGAMENTOS DROP COLUMN DESCR_FORN1;
# ####################################################################################
# ###################| CRIANDO A TABELA PRODUTOS_FORNECEDORES |#######################
# ####################################################################################
CREATE TABLE IF NOT EXISTS PRODUTOS_FORNECEDORES(
    PRFR_PROD INT,
    PRFR_FORN INT,
    PRIMARY KEY (PRFR_PROD , PRFR_FORN),
    CONSTRAINT FK_PRFR_PRODUTOS FOREIGN KEY (PRFR_PROD) REFERENCES PRODUTOS (ID_PROD),
    CONSTRAINT FK_PRFR_FORNECEDORES FOREIGN KEY (PRFR_FORN) REFERENCES FORNECEDORES (ID_FORN)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PRODUTOS_FORNECEDORES]
ALTER TABLE PRODUTOS_FORNECEDORES ADD column PRFR_DESC TEXT;
ALTER TABLE PRODUTOS_FORNECEDORES MODIFY column PRFR_DESC VARCHAR(100);
ALTER TABLE PRODUTOS_FORNECEDORES CHANGE column PRFR_DESC PRFR_DESCR VARCHAR(100);
ALTER TABLE PRODUTOS_FORNECEDORES DROP column PRFR_DESCR;
# ####################################################################################
# ###################| CRIANDO A TABELA PRODUTOS_VENDAS |#############################
# ####################################################################################
CREATE TABLE IF NOT EXISTS PRODUTOS_VENDAS (
    PRVN_PROD INT,
    PRVN_VEND INT,
    PRVN_QUANTD_PROD INT NOT NULL,
    PRIMARY KEY (PRVN_PROD , PRVN_VEND),
    CONSTRAINT FK_PRVN_PRODUTOS FOREIGN KEY (PRVN_PROD) REFERENCES PRODUTOS (ID_PROD),
    CONSTRAINT FK_PRVN_VENDAS FOREIGN KEY (PRVN_VEND) REFERENCES VENDAS (ID_VENDA)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PRODUTOS_VENDAS]
ALTER TABLE PRODUTOS_VENDAS ADD column PRVN_DESC TEXT;
ALTER TABLE PRODUTOS_VENDAS MODIFY column PRVN_DESC VARCHAR(100);
ALTER TABLE PRODUTOS_VENDAS CHANGE column PRVN_DESC PRVN_DESCR VARCHAR(100);
ALTER TABLE PRODUTOS_VENDAS DROP column PRVN_DESCR;

#DAR COMANDO DROP SCHEMA
DROP SCHEMA EST_CASO_V;
