CREATE SCHEMA EC2_CC1M;

USE EC2_CC1M;

CREATE TABLE IF NOT EXISTS PASSAGEIROS(
PASS_CPF VARCHAR(14) PRIMARY KEY,
PASS_NOME VARCHAR(50) NOT NULL,
PASS_TEL VARCHAR(15) NOT NULL,
PASS_ENDRC TEXT NOT NULL,
PASS_EMAIL VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS AEROPORTOS(
AEROP_COD INT PRIMARY KEY,
AEROP_NOME VARCHAR(20) NOT NULL,
AEROP_CIDADE VARCHAR(20) NOT NULL,
AEROP_PAIS VARCHAR(20) NOT NULL,
AEROP_LAT DECIMAL(2,2) NOT NULL,
AEROP_LONG DECIMAL(3,2) NOT NULL 
);

CREATE TABLE IF NOT EXISTS AERONAVES(
AERON_PREFX VARCHAR(10) PRIMARY KEY,
AERON_MODELO VARCHAR(20) NOT NULL,
AERON_ANOFABR INT NOT NULL,
AERON_AUTON DECIMAL(3,2) NOT NULL,
AERON_CAPAC INT NOT NULL,
AERON_FABRNT VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS FUNCIONARIOS(
FUNC_ID INT PRIMARY KEY,
FUNC_NOME VARCHAR(40) NOT NULL,
FUNC_DATANASC DATE NOT NULL,
FUNC_ENDRC TEXT NOT NULL,
FUNC_CPF VARCHAR(14) NOT NULL,
FUNC_FUNCAO TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS VOOS(
VOO_ID INT PRIMARY KEY,
VOO_DATA DATE NOT NULL,
VOO_HORA TIME NOT NULL,
VOO_AERON VARCHAR(10) NOT NULL,
VOO_AEROP INT NOT NULL,
CONSTRAINT FK_AERONAVES FOREIGN KEY (VOO_AERON) REFERENCES AERONAVES(AERON_PREFX),
CONSTRAINT FK_AEROPORTOS FOREIGN KEY (VOO_AEROP) REFERENCES AEROPORTOS(AEROP_COD)
);

CREATE TABLE IF NOT EXISTS RESERVAS(
RESERV_COD INT PRIMARY KEY,
RESERV_VOO INT NOT NULL,
RESERV_PASS VARCHAR(14) NOT NULL,
CONSTRAINT FK_VOOS FOREIGN KEY (RESERV_VOO) REFERENCES VOOS(VOO_ID),
CONSTRAINT FK_PASSAGEIROS FOREIGN KEY (RESERV_PASS) REFERENCES PASSAGEIROS(PASS_CPF)
);

CREATE TABLE IF NOT EXISTS VOOS_FUNCIONARIOS(
VSFN_VOOS INT,
VSFN_FUNCIONARIOS INT,
PRIMARY KEY(VSFN_VOOS,VSFN_FUNCIONARIOS),
CONSTRAINT VSFN_FK_VOOS FOREIGN KEY (VSFN_VOOS) REFERENCES VOOS(VOO_ID),
CONSTRAINT VSFN_FK_FUNCIONARIOS FOREIGN KEY (VSFN_FUNCIONARIOS) REFERENCES FUNCIONARIOS(FUNC_ID)
);

alter table passageiros modify pass_tel varchar(12) not null; #ALTER TABLE
alter table aeroportos modify aerop_cidade varchar(30) not null; #ALTER TABLE
alter table aeronaves modify aeron_anofabr INT(4) not null; #ALTER TABLE
alter table funcionarios modify func_funcao varchar(30) not null; #ALTER TABLE
alter table voos modify voo_aeron varchar(15) not null; #ALTER TABLE
alter table reservas modify reserv_cod int(100); #ALTER TABLE
alter table voos_funcionarios add taxa decimal(3,2); #ALTER TABLE
alter table voos_funcionarios drop taxa; #DROP
show tables;
drop schema EC2_CC1M; #DROP SCHEMA