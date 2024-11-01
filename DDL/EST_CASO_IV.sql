CREATE SCHEMA EST_CASO_IV;

USE EST_CASO_IV;

#TABELA INSTRUTORES
create table if not exists INSTRUTORES(
ID_INSTRUTOR INT PRIMARY KEY,
NOME_INSTRUTOR VARCHAR(50) NOT NULL,
CPF_INSTRUTOR VARCHAR(14) NOT NULL,
EMAIL_INSTRUTOR VARCHAR(80) NOT NULL
);
#ALTER TABELA INSTRUTORES
ALTER TABLE INSTRUTORES ADD COLUMN TREINOS_INSTRUTOR VARCHAR(100) NOT NULL;
ALTER TABLE INSTRUTORES DROP COLUMN TREINOS_INSTRUTOR;
ALTER TABLE INSTRUTORES ADD COLUMN TEL_INSTRUTOR VARCHAR(20);
ALTER TABLE INSTRUTORES DROP COLUMN TEL_INSTRUTOR;


#TABELA MODALIDADES
create table if not exists MODALIDADES(
ID_MODALIDADE INT PRIMARY KEY,
NOME_MODALIDADE VARCHAR(50) NOT NULL
);
#ALTER TABELA MODALIDADES
ALTER TABLE MODALIDADES ADD COLUMN DESCRICAO_MODALIDADE TEXT;
ALTER TABLE MODALIDADES DROP COLUMN DESCRICAO_MODALIDADE;

#TABELA ALUNOS
create table if not exists ALUNOS(
ID_ALUNO INT PRIMARY KEY,
NOME_ALUNO VARCHAR(50) NOT NULL,
CPF_ALUNO VARCHAR(14) NOT NULL,
DATA_NASC_ALUNO DATE NOT NULL,
CEP_ALUNO VARCHAR(10) NOT NULL,
RUA_ALUNO VARCHAR(100) NOT NULL,
NUM_RES_ALUNO INT,
BAIRRO_ALUNO VARCHAR(50) NOT NULL,
CIDADE_ALUNO VARCHAR(50) NOT NULL,
UF_ALUNO VARCHAR(2) NOT NULL
);
#ALTER TABELA ALUNOS
ALTER TABLE ALUNOS ADD COLUMN EMAIL_ALUNO VARCHAR(80) NOT NULL;
ALTER TABLE ALUNOS ADD COLUMN TEL_ALUNO VARCHAR(15);
ALTER TABLE ALUNOS MODIFY COLUMN EMAIL_ALUNO TEXT;
ALTER TABLE ALUNOS CHANGE COLUMN TEL_ALUNO TELE_ALUNO VARCHAR(15);

#TABELA AULAS
create table if not exists AULAS(
ID_AULA INT PRIMARY KEY,
HORA_AULA TIME NOT NULL,
DIA_AULA ENUM ('SEGUNDA','TERCA','QUARTA','QUINTA','SEXTA','SABADO','DOMINGO'),
CAPAC_AULA INT NOT NULL,
INSTRUTOR_AULA INT NOT NULL,
MODALIDADE_AULA INT NOT NULL,
CONSTRAINT FK_AULA_INSTRUTORES FOREIGN KEY (INSTRUTOR_AULA) REFERENCES INSTRUTORES(ID_INSTRUTOR),
CONSTRAINT FK_MODALIDADES FOREIGN KEY (MODALIDADE_AULA) references MODALIDADES(ID_MODALIDADE)
);
#DAR COMANDOS DE ALTER NA TABELA AULAS
ALTER TABLE AULAS ADD COLUMN DESCRICAO_AULA TEXT NOT NULL;
ALTER TABLE AULAS DROP COLUMN DESCRICAO_AULA;

#TABELA PLANOS_TREINAMENTO
create table if not exists  PLANOS_TREINAMENTO(
ID_PLAN INT PRIMARY KEY,
STATUS_PLAN TEXT NOT NULL,
INSTRUTOR_PLAN INT NOT NULL,
ALUNO_PLAN INT NOT NULL,
CONSTRAINT FK_PLAN_INSTRUTORES FOREIGN KEY (INSTRUTOR_PLAN) REFERENCES INSTRUTORES(ID_INSTRUTOR),
CONSTRAINT FK_PLAN_ALUNOS FOREIGN KEY (ALUNO_PLAN) REFERENCES ALUNOS(ID_ALUNO)
);

#ALTER TABELA PLANOS_TREINAMENTO
ALTER TABLE PLANOS_TREINAMENTO ADD COLUMN DESCRICAO_PLAN TEXT NOT NULL;
ALTER TABLE PLANOS_TREINAMENTO DROP COLUMN DESCRICAO_PLAN;

#TABELA PAGAMENTOS
create table if not exists PAGAMENTOS(
ID_PAG INT PRIMARY KEY,
DATA_PAG DATE NOT NULL,
STATUS_PAG ENUM('PAGO','PENDENTE') NOT NULL,
VALOR_PAG DECIMAL(4,2) NOT NULL,
ALUNO_PAG INT NOT NULL,
CONSTRAINT FK_PAG_ALUNOS FOREIGN KEY (ALUNO_PAG) REFERENCES ALUNOS(ID_ALUNO)
);

#ALTER TABELA PAGAMENTOS

ALTER TABLE PAGAMENTOS ADD COLUMN FORMA_PAGAMENTO TEXT NOT NULL;
ALTER TABLE PAGAMENTOS DROP COLUMN FORMA_PAGAMENTO;

#TABELA ALUNOS_AULAS
create table if not exists ALUNOS_AULAS(
AU_AL_AULA INT,
AU_AL_ALUNO INT,
PRIMARY KEY (AU_AL_AULA, AU_AL_ALUNO),
CONSTRAINT FK_AU_AL_AULAS FOREIGN KEY (AU_AL_AULA) REFERENCES AULAS(ID_AULA),
CONSTRAINT FK_AU_AL_ALUNOS FOREIGN KEY (AU_AL_ALUNO) REFERENCES ALUNOS(ID_ALUNO)
);

#ALTER TABELA ALUNOS_AULAS
ALTER TABLE ALUNOS_AULAS ADD COLUMN DESCRICAO_AU_AL TEXT;

#DROP SCHEMA - END                                                                                                                                                                                                                                                                                                                                                                     ME
DROP SCHEMA EST_CASO_IV;