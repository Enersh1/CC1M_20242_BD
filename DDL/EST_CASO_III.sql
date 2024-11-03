CREATE SCHEMA IF NOT EXISTS EC3_CC1M;
USE EC3_CC1M;
#DROP SCHEMA EC3_CC1M;
# ############################## CRIANDO A TABELA CLIENTES ##############################
CREATE TABLE IF NOT EXISTS CLIENTES(
CODIGO_CLIENTE INT PRIMARY KEY,
CNPJ_CLIENTE VARCHAR(100),
RAZAO_SOCIAL_CLIENTE VARCHAR(100),
RAMO_ATIVIDADE_CLIENTE VARCHAR(100),
DATA_CADASTRAMENTO_CLIENTE VARCHAR(100)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA CLIENTES]
ALTER TABLE CLIENTES ADD Azeitona VARCHAR(100);
ALTER TABLE CLIENTES MODIFY COLUMN Azeitona TEXT;
ALTER TABLE CLIENTES CHANGE COLUMN Azeitona Azeitona_taxa VARCHAR(10);
ALTER TABLE CLIENTES DROP COLUMN Azeitona_taxa;
# ############################## CRIANDO A TABELA FORNECEDORES ##############################
CREATE TABLE IF NOT EXISTS FORNECEDORES(
CODIGO_FORNECEDOR INT PRIMARY KEY,
CNPJ_FORNECEDOR VARCHAR(100),
RAZAO_SOCIAL_FORNECEDOR VARCHAR(100)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA FORNECEDORES]
ALTER TABLE FORNECEDORES ADD FORNECEDORES VARCHAR(100);
ALTER TABLE FORNECEDORES MODIFY COLUMN FORNECEDORES TEXT;
ALTER TABLE FORNECEDORES CHANGE COLUMN FORNECEDORES FORNECEDORES_taxa VARCHAR(10);
ALTER TABLE FORNECEDORES DROP COLUMN FORNECEDORES_taxa;

# ############################## CRIANDO A TABELA TIPOS_ENDERECO ##############################
CREATE TABLE IF NOT EXISTS TIPOS_ENDERECO(
CODIGO_TIPO_ENDERECO INT PRIMARY KEY,
NOME_TIPO_ENDERECO VARCHAR(100)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA TIPOS_ENDERECO]
ALTER TABLE TIPOS_ENDERECO ADD TIPOS_ENDERECO VARCHAR(100);
ALTER TABLE TIPOS_ENDERECO MODIFY COLUMN TIPOS_ENDERECO TEXT;
ALTER TABLE TIPOS_ENDERECO CHANGE COLUMN TIPOS_ENDERECO TIPOS_ENDERECO_taxa VARCHAR(10);
ALTER TABLE TIPOS_ENDERECO DROP COLUMN TIPOS_ENDERECO_taxa;
# ############################## CRIANDO A TABELA QUALIFICACOES ##############################
CREATE TABLE IF NOT EXISTS QUALIFICACOES(
CODIGO_QUALIFICACAO INT PRIMARY KEY,
NOME_QUALIFICACAO VARCHAR(100) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA QUALIFICACOES]
ALTER TABLE QUALIFICACOES ADD QUALIFICACOES VARCHAR(100);
ALTER TABLE QUALIFICACOES MODIFY COLUMN QUALIFICACOES TEXT;
ALTER TABLE QUALIFICACOES CHANGE COLUMN QUALIFICACOES QUALIFICACOES_1 VARCHAR(10);
ALTER TABLE QUALIFICACOES DROP COLUMN QUALIFICACOES_1;

# ############################## CRIANDO A TABELA PESSOAS_CONTATO ##############################
CREATE TABLE IF NOT EXISTS PESSOAS_CONTATO(
CODIGO_PESSOA_CONTATO INT PRIMARY KEY,
NOME_PESSOA_CONTATO VARCHAR(100) NOT NULL,
CPF_PESSOA_CONTATO VARCHAR(100) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PESSOAS_CONTATO]
ALTER TABLE PESSOAS_CONTATO ADD AUSENTE TINYINT(1);
ALTER TABLE PESSOAS_CONTATO MODIFY COLUMN AUSENTE TEXT;
ALTER TABLE PESSOAS_CONTATO CHANGE COLUMN AUSENTE CONTATO_AUSENTE text;
ALTER TABLE PESSOAS_CONTATO DROP COLUMN CONTATO_AUSENTE;

# ############################## CRIANDO A TABELA CARGOS ##############################
CREATE TABLE IF NOT EXISTS CARGOS(
CODIGO_CARGO INT PRIMARY KEY,
NOME_CARGO VARCHAR(100) NOT NULL,
DESCRICOES_FUNCOES_CARGO VARCHAR(100) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA CARGOS]
ALTER TABLE CARGOS ADD APOSENTADORIA VARCHAR(100);
ALTER TABLE CARGOS MODIFY COLUMN APOSENTADORIA TEXT;
ALTER TABLE CARGOS CHANGE COLUMN APOSENTADORIA INSS VARCHAR(10);
ALTER TABLE CARGOS DROP COLUMN INSS;

# ############################## CRIANDO A TABELA PRODUTOS ##############################
CREATE TABLE IF NOT EXISTS PRODUTOS(
CODIGO_PRODUTO INT PRIMARY KEY,
NOME_PRODUTO VARCHAR(100) NOT NULL,
COR_PRODUTO VARCHAR(100) NOT NULL,
DIMENSOES_PRODUTO TEXT NOT NULL,
PESO_PRODUTO DEC(10,2) NOT NULL,
PRECO_PRODUTO DEC(10,2) NOT NULL,
TEMPO_FABRICACAO_PRODUTO VARCHAR(100) NOT NULL,
DESENHO_PRODUTO VARCHAR(100) NOT NULL,
HORAS_MAO_DE_OBRA_PRODUTO VARCHAR(100) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA PRODUTOS]
ALTER TABLE PRODUTOS ADD TAXAPRODUT VARCHAR(100);
ALTER TABLE PRODUTOS MODIFY COLUMN TAXAPRODUT TEXT;
ALTER TABLE PRODUTOS CHANGE COLUMN TAXAPRODUT TAXA_PRODUTO VARCHAR(10);
ALTER TABLE PRODUTOS DROP COLUMN TAXA_PRODUTO;

# ############################## CRIANDO A TABELA TIPOS_COMPONENTE ##############################
CREATE TABLE IF NOT EXISTS TIPOS_COMPONENTE(
	CODIGO_TIPO_COMPONENTE INT PRIMARY KEY,
	NOME_TIPO_COMPONENTE VARCHAR(100) NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA TIPOS_COMPONENTE]
ALTER TABLE TIPOS_COMPONENTE ADD ORIGEM VARCHAR(100);
ALTER TABLE TIPOS_COMPONENTE MODIFY COLUMN ORIGEM TEXT;
ALTER TABLE TIPOS_COMPONENTE CHANGE COLUMN ORIGEM ORIGEM_COMPONENTE VARCHAR(10);
ALTER TABLE TIPOS_COMPONENTE DROP COLUMN ORIGEM_COMPONENTE;

# ############################## CRIANDO A TABELA MAQUINAS ##############################
CREATE TABLE IF NOT EXISTS MAQUINAS(
	CODIGO_MAQUINA INT PRIMARY KEY,
	TEMPO_VIDA_MAQUINA VARCHAR(100) NOT NULL,
	DATA_COMPRA_MAQUINA DATE NOT NULL,
	DATA_FIM_GARANTIA_MAQUINA DATE NOT NULL
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA MAQUINAS]
ALTER TABLE MAQUINAS ADD DESEMPENHO VARCHAR(100);
ALTER TABLE MAQUINAS MODIFY COLUMN DESEMPENHO TEXT;
ALTER TABLE MAQUINAS CHANGE COLUMN DESEMPENHO DESEMPENHO_MAQUINA VARCHAR(10);
ALTER TABLE MAQUINAS DROP COLUMN DESEMPENHO_MAQUINA;

# ############################## CRIANDO TABELAS COM DEPENDÊNCIA DE CHAVE ESTRANGEIRA ##############################
# ############################## CRIANDO A TABELA EMPREGADOS ##############################
CREATE TABLE IF NOT EXISTS EMPREGADOS (
    MATRICULA_EMPREGADO INT PRIMARY KEY,
    NOME_EMPREGADO VARCHAR(100) NOT NULL,
    CPF_EMPREGADO VARCHAR(100) NOT NULL,
    SALARIO_EMPREGADO VARCHAR(100) NOT NULL,
    DATRA_ADMISSAO_EMPREGADO VARCHAR(100) NOT NULL,
    CODIGO_CARGO_EMPREGADO INT NOT NULL,
    CONSTRAINT FK_CODIGO_CARGO_EMPREGADO FOREIGN KEY (CODIGO_CARGO_EMPREGADO) REFERENCES CARGOS (CODIGO_CARGO)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA EMPREGADOS]
ALTER TABLE EMPREGADOS ADD FUNCIONARIO_MES VARCHAR(100);
ALTER TABLE EMPREGADOS MODIFY COLUMN FUNCIONARIO_MES TEXT;
ALTER TABLE EMPREGADOS CHANGE COLUMN FUNCIONARIO_MES FUNCIONARIO_of_MES VARCHAR(10);
ALTER TABLE EMPREGADOS DROP COLUMN FUNCIONARIO_of_MES;

# ############################## CRIANDO A TABELA ENDERECOS ##############################
CREATE TABLE IF NOT EXISTS ENDERECOS(
CEP_ENDERECO VARCHAR(10) NOT NULL,
RUA_ENDERECO VARCHAR(100) NOT NULL,
NUMERO_ENDERECO VARCHAR(10000),
COMPLEMENTO_ENDERECO VARCHAR(100) NOT NULL,
LOGRADOURO_ENDERECO VARCHAR(100) NOT NULL,
BAIRRO_ENDERECO VARCHAR(100) NOT NULL,
CIDADE_ENDERECO VARCHAR(100) NOT NULL,
ESTADO_ENDERECO VARCHAR(100) NOT NULL,

CODIGO_TIPO_ENDERECO INT,
CODIGO_FORNECEDOR INT,
CODIGO_CLIENTE INT,
CODIGO_EMPREGADO INT,
CONSTRAINT FK_CODIGO_TIPO_ENDERECO FOREIGN KEY (CODIGO_TIPO_ENDERECO) REFERENCES TIPOS_ENDERECO(CODIGO_TIPO_ENDERECO),
CONSTRAINT FK_CODIGO_FORNECEDOR FOREIGN KEY (CODIGO_FORNECEDOR) REFERENCES FORNECEDORES(CODIGO_FORNECEDOR),
CONSTRAINT FK_CODIGO_CLIENTE3 FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO_CLIENTE),
CONSTRAINT FK_CODIGO_EMPREGADO FOREIGN KEY (CODIGO_EMPREGADO) REFERENCES EMPREGADOS(MATRICULA_EMPREGADO)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA ENDERECOS]
ALTER TABLE ENDERECOS ADD BLOCO VARCHAR(100);
ALTER TABLE ENDERECOS MODIFY COLUMN BLOCO TEXT;
ALTER TABLE ENDERECOS CHANGE COLUMN BLOCO BLOCO_ENDERECO VARCHAR(10);
ALTER TABLE ENDERECOS DROP COLUMN BLOCO_ENDERECO;

# ------------ CRIANDO A TABELA TELEFONES ------------
CREATE TABLE IF NOT EXISTS TELEFONES(
DDD_TEL VARCHAR(3),
NUMERO_TEL VARCHAR(9),
PRIMARY KEY(DDD_TEL,NUMERO_TEL),

CODIGO_FORNECEDOR INT,
CODIGO_CLIENTE INT,
CODIGO_EMPREGADO INT,
CODIGO_PESSOA_CONTATO INT,

CONSTRAINT FK_CODIGO_FORNECEDOR1 FOREIGN KEY (CODIGO_FORNECEDOR) REFERENCES fornecedores(CODIGO_FORNECEDOR),
CONSTRAINT FK_CODIGO_CLIENTE1 FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO_CLIENTE),
CONSTRAINT FK_CODIGO_EMPREGADO1 FOREIGN KEY (CODIGO_EMPREGADO) REFERENCES EMPREGADOS(MATRICULA_EMPREGADO),
CONSTRAINT FK_CODIGO_PESSOA_CONTATO1 FOREIGN KEY (CODIGO_PESSOA_CONTATO) REFERENCES PESSOAS_CONTATO(CODIGO_PESSOA_CONTATO)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA ENDERECOS]
ALTER TABLE TELEFONES ADD OPERADORA VARCHAR(100);
ALTER TABLE TELEFONES MODIFY COLUMN OPERADORA TEXT;
ALTER TABLE TELEFONES CHANGE COLUMN OPERADORA OPERADORA_1 VARCHAR(10);
ALTER TABLE TELEFONES DROP COLUMN OPERADORA_1;

# ------------ CRIANDO A TABELA ENCOMENDAS ------------
CREATE TABLE IF NOT EXISTS ENCOMENDAS(
Codigo_Encomenda INT PRIMARY KEY,
Data_Inclusao_Encomenda DATE NOT NULL,
Valor_Total_Encomenda VARCHAR(100) NOT NULL,
Valor_Desconto_Encomenda VARCHAR(100) NOT NULL,
Qtd_Parcelas_Encomenda INT NOT NULL,
ID_Forma_Pagamento_Encomenda INT NOT NULL,

Codigo_Cliente INT NOT NULL,
CONSTRAINT FK_Codigo_Cliente5 FOREIGN KEY (Codigo_Cliente) REFERENCES CLIENTES(CODIGO_CLIENTE)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA ENDERECOS]
ALTER TABLE ENCOMENDAS ADD ENCOMENDAS1 VARCHAR(100);
ALTER TABLE ENCOMENDAS MODIFY COLUMN ENCOMENDAS1 TEXT;
ALTER TABLE ENCOMENDAS CHANGE COLUMN ENCOMENDAS1 ENCOMENDAS2 VARCHAR(10);
ALTER TABLE ENCOMENDAS DROP COLUMN ENCOMENDAS2;

# ------------ CRIANDO A TABELA COMPONENTES ------------
CREATE TABLE IF NOT EXISTS COMPONENTES(
CODIGO_COMPONENTE INT,
Codigo_Tipo_Componente int,
primary key(CODIGO_TIPO_COMPONENTE,CODIGO_COMPONENTE),
Nome_Componente VARCHAR(100),
Qtd_Estoque_Componente varchar(100),
Preco_Unitario_Componente dec(10,2),
Unidade_Componente VARCHAR(100),

CONSTRAINT FK_Codigo_Componente FOREIGN KEY (CODIGO_COMPONENTE) REFERENCES TIPOS_COMPONENTE(CODIGO_TIPO_COMPONENTE)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA ENDERECOS]
ALTER TABLE COMPONENTES ADD PECAS VARCHAR(100);
ALTER TABLE COMPONENTES MODIFY COLUMN PECAS TEXT;
ALTER TABLE COMPONENTES CHANGE COLUMN PECAS PECAS_1 VARCHAR(10);
ALTER TABLE COMPONENTES DROP COLUMN PECAS_1;

# ------------ CRIANDO A TABELA Registros_Manutencao ------------
CREATE TABLE IF NOT EXISTS Registros_Manutencao(
Codigo_RM int primary key,
Data_RM date not null,
Desc_RM text not null,

ID_Maquina_RM int not null,
CONSTRAINT FK_Maquina_RM FOREIGN KEY (ID_Maquina_RM) REFERENCES MAQUINAS(CODIGO_MAQUINA)
);
# | ALTER ADD | ALTER MODIFY | ALTER CHANGE | ALTER DROP | [TABELA ENDERECOS]
ALTER TABLE Registros_Manutencao ADD MATE_os_REGISTROS VARCHAR(100);
ALTER TABLE Registros_Manutencao MODIFY COLUMN MATE_os_REGISTROS TEXT;
ALTER TABLE Registros_Manutencao CHANGE COLUMN MATE_os_REGISTROS REGISTROS_MAT VARCHAR(10);
ALTER TABLE Registros_Manutencao DROP COLUMN REGISTROS_MAT;

#CONSTRAINT FK_ParaFK FOREIGN KEY (nome da chave estrangeira) REFERENCES tabela de origem da PK (nome original da PK)

# -------------------- CRIANDO TABELAS DE ENTIDADES ASSOCIATIVAS -------------------------------------------------

#CRIAR TABELA REGISTROS_ESPECIFICOS E DAR COMANDOS DE ALTER NA MESMA

create table if not exists RECURSOS_ESPECIFICOS(
ID_RE INT PRIMARY KEY,
Qntd_NEC_RE INT NOT NULL,
UNID_RE VARCHAR(50) NOT NULL,
TEMP_USO_RE VARCHAR(10) NOT NULL,
HoraMaoObra_RE VARCHAR(10) NOT NULL,

Maquina_RE INT NOT NULL,
COMP_RE INT NOT NULL,
EMPREG_RE INT NOT NULL,
PROD_RE INT NOT NULL,
CONSTRAINT FK_MAQUINAS2 foreign key (Maquina_RE) REFERENCES MAQUINAS(CODIGO_MAQUINA),
CONSTRAINT FK_COMPONENTES1 FOREIGN KEY (COMP_RE) REFERENCES COMPONENTES(CODIGO_COMPONENTE),
CONSTRAINT FK_EMPREGADOS3 foreign key (EMPREG_RE) references EMPREGADOS(MATRICULA_EMPREGADO),
CONSTRAINT FK_PRODUTOS1 FOREIGN KEY (PROD_RE) REFERENCES PRODUTOS(CODIGO_PRODUTO)
);
ALTER TABLE RECURSOS_ESPECIFICOS ADD COLUMN DESC_RE TEXT NOT NULL;
ALTER TABLE RECURSOS_ESPECIFICOS MODIFY COLUMN DESC_RE VARCHAR(100);
ALTER TABLE RECURSOS_ESPECIFICOS CHANGE COLUMN DESC_RE DESCR_RE VARCHAR(100);
ALTER TABLE RECURSOS_ESPECIFICOS DROP COLUMN DESCR_RE;

#TABELA REGISTROS_SUPRIMENTO
create table if not exists REGISTROS_SUPRIMENTO(
RegistSupri_PROD INT,
RegistSupri_COMP INT,
PRIMARY KEY(RegistSupri_PROD, RegistSupri_COMP),

RegistSupri_QTD INT NOT NULL,
RegistSupri_DATA_NEC DATE NOT NULL,
CONSTRAINT FK_PRODUTOS2 FOREIGN KEY (RegistSupri_PROD) REFERENCES PRODUTOS(CODIGO_PRODUTO),
CONSTRAINT FK_COMPONENTES2 FOREIGN KEY (RegistSupri_COMP) REFERENCES COMPONENTES(CODIGO_COMPONENTE)
);
ALTER TABLE REGISTROS_SUPRIMENTO ADD COLUMN desc_RegistSupri TEXT NOT NULL;
ALTER TABLE REGISTROS_SUPRIMENTO MODIFY COLUMN desc_RegistSupri VARCHAR(100);
ALTER TABLE REGISTROS_SUPRIMENTO CHANGE COLUMN desc_RegistSupri desc_RegistSupri1 VARCHAR(100);
ALTER TABLE REGISTROS_SUPRIMENTO DROP COLUMN desc_RegistSupri1;

#TABELA PRODUTOS_ENCOMENDAS
create table if not exists PRODUTOS_ENCOMENDAS(
ProdEncomend_PROD INT,
ProdEncomend_ENCOM INT,
PRIMARY KEY(ProdEncomend_PROD, ProdEncomend_ENCOM),
CONSTRAINT FK_PRODUTOS3 FOREIGN KEY (ProdEncomend_PROD) REFERENCES PRODUTOS(CODIGO_PRODUTO),
CONSTRAINT FK_ENCOMENDAS FOREIGN KEY (ProdEncomend_ENCOM) REFERENCES ENCOMENDAS(Codigo_Encomenda)
);
ALTER TABLE PRODUTOS_ENCOMENDAS ADD COLUMN DESC_ProdEncomend TEXT NOT NULL;
ALTER TABLE PRODUTOS_ENCOMENDAS MODIFY COLUMN DESC_ProdEncomend VARCHAR(100);
ALTER TABLE PRODUTOS_ENCOMENDAS CHANGE COLUMN DESC_ProdEncomend DESCR_ProdEncomend1 VARCHAR(100);
ALTER TABLE PRODUTOS_ENCOMENDAS DROP COLUMN DESCR_ProdEncomend1;

#TABELA EMPREGADOS_QUALIFICACOES
create table if not exists EMPREGADOS_QUALIFICACOES(
EmpregQualif_EMPREG INT,
EmpregQualif_QLF INT,
PRIMARY KEY(EmpregQualif_EMPREG, EmpregQualif_QLF),
CONSTRAINT FK_EMPREGADOS4 FOREIGN KEY (EmpregQualif_EMPREG) REFERENCES EMPREGADOS(MATRICULA_EMPREGADO),
CONSTRAINT FK_QUALIFICACOES FOREIGN KEY (EmpregQualif_QLF) REFERENCES QUALIFICACOES(CODIGO_QUALIFICACAO)
);
ALTER TABLE EMPREGADOS_QUALIFICACOES ADD COLUMN DESC_EmpregQualif TEXT NOT NULL;
ALTER TABLE EMPREGADOS_QUALIFICACOES MODIFY COLUMN DESC_EmpregQualif VARCHAR(100);
ALTER TABLE EMPREGADOS_QUALIFICACOES CHANGE COLUMN DESC_EmpregQualif DESCR_EmpregQualifo VARCHAR(100);
ALTER TABLE EMPREGADOS_QUALIFICACOES DROP COLUMN DESCR_EmpregQualifo;

#CRIAR TABELA COMPONENTES_FORNECEDORES
create table if not exists COMPONENTES_FORNECEDORES(
CompForn_COMP INT,
CompForn_FORN INT,
PRIMARY KEY(CompForn_COMP, CompForn_FORN),
CONSTRAINT FK_COMPONENTES3 FOREIGN KEY (CompForn_COMP) REFERENCES COMPONENTES(CODIGO_COMPONENTE),
CONSTRAINT FK_FORNECEDORES2 FOREIGN KEY (CompForn_FORN) REFERENCES FORNECEDORES(CODIGO_FORNECEDOR)
);
ALTER TABLE COMPONENTES_FORNECEDORES ADD COLUMN DESCRICAO_CompForn TEXT NOT NULL;
ALTER TABLE COMPONENTES_FORNECEDORES MODIFY COLUMN DESCRICAO_CompForn VARCHAR(100);
ALTER TABLE COMPONENTES_FORNECEDORES CHANGE COLUMN DESCRICAO_CompForn DESCRICAO_CompForn_1 VARCHAR(100);
ALTER TABLE COMPONENTES_FORNECEDORES DROP COLUMN DESCRICAO_CompForn_1;

#DROPANDO O BANCO DE DADOS  #DROP

DROP SCHEMA EC3_CC1M;