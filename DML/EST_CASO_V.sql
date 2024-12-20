# ##################################################################################################### #
#                                                                                                       #
#                                                  DML                                                  #
#                                                                                                       #
# ##################################################################################################### #
USE EST_CASO_V;
#####################################################
# | INSERT | UPDATE | DELETE | [TABELA CLIENTES]
#####################################################

INSERT INTO CLIENTES (ID_CLIENT, CPF_CLIENT, NOME_CLIENT, DATA_NASC_CLIENT, EMAIL_CLIENT, TEL_CLIENT, RUA_CLIENT, NUM_RES_CLIENT, CEP_CLIENT, BAIRRO_CLIENT, CIDADE_CLIENT, UF_CLIENT, STATUS_FID_CLIENT)
VALUES (1, '123.456.789-00', 'Aurelio Figueiredo', '1980-05-12', 'aurelio.figueiredo@example.com', '(11) 99999-1234', 'Rua das Flores', 101, '12345-678', 'Centro', 'São Paulo', 'SP', 'ATIVO');
INSERT INTO CLIENTES (ID_CLIENT, CPF_CLIENT, NOME_CLIENT, DATA_NASC_CLIENT, EMAIL_CLIENT, TEL_CLIENT, RUA_CLIENT, NUM_RES_CLIENT, CEP_CLIENT, BAIRRO_CLIENT, CIDADE_CLIENT, UF_CLIENT, STATUS_FID_CLIENT)
VALUES (2, '987.654.321-00', 'Bernadete Oliveira', '1992-11-23', 'bernadete.oliveira@example.com', '(21) 98888-5678', 'Avenida Paulista', 2020, '87654-321', 'Jardins', 'Rio de Janeiro', 'RJ', 'INATIVO');
INSERT INTO CLIENTES (ID_CLIENT, CPF_CLIENT, NOME_CLIENT, DATA_NASC_CLIENT, EMAIL_CLIENT, TEL_CLIENT, RUA_CLIENT, NUM_RES_CLIENT, CEP_CLIENT, BAIRRO_CLIENT, CIDADE_CLIENT, UF_CLIENT, STATUS_FID_CLIENT)
VALUES (3, '456.789.123-00', 'Cid Moreira', '1975-03-15', 'cid.moreira@example.com', '(31) 97777-4321', 'Rua dos Pinheiros', 3030, '54321-987', 'Savassi', 'Belo Horizonte', 'MG', 'ATIVO');
INSERT INTO CLIENTES (ID_CLIENT, CPF_CLIENT, NOME_CLIENT, DATA_NASC_CLIENT, EMAIL_CLIENT, TEL_CLIENT, RUA_CLIENT, NUM_RES_CLIENT, CEP_CLIENT, BAIRRO_CLIENT, CIDADE_CLIENT, UF_CLIENT, STATUS_FID_CLIENT)
VALUES (4, '321.654.987-00', 'Dora Cavalcanti', '1985-07-07', 'dora.cavalcanti@example.com', '(41) 96666-8765', 'Alameda Santos', 4040, '76543-210', 'Centro Cívico', 'Curitiba', 'PR', 'INATIVO');
INSERT INTO CLIENTES (ID_CLIENT, CPF_CLIENT, NOME_CLIENT, DATA_NASC_CLIENT, EMAIL_CLIENT, TEL_CLIENT, RUA_CLIENT, NUM_RES_CLIENT, CEP_CLIENT, BAIRRO_CLIENT, CIDADE_CLIENT, UF_CLIENT, STATUS_FID_CLIENT)
VALUES (5, '654.321.987-00', 'Evaristo Costa', '1990-09-09', 'evaristo.costa@example.com', '(51) 95555-0987', 'Rua Augusta', 5050, '09876-543', 'Moinhos de Vento', 'Porto Alegre', 'RS', 'ATIVO');

UPDATE CLIENTES
SET EMAIL_CLIENT = 'aurelio.novoemail@example.com'
WHERE ID_CLIENT = 1;
UPDATE CLIENTES
SET STATUS_FID_CLIENT = 'ATIVO'
WHERE ID_CLIENT = 2;

DELETE FROM CLIENTES
WHERE ID_CLIENT = 5;
INSERT INTO CLIENTES (ID_CLIENT, CPF_CLIENT, NOME_CLIENT, DATA_NASC_CLIENT, EMAIL_CLIENT, TEL_CLIENT, RUA_CLIENT, NUM_RES_CLIENT, CEP_CLIENT, BAIRRO_CLIENT, CIDADE_CLIENT, UF_CLIENT, STATUS_FID_CLIENT)
VALUES (5, '654.321.987-00', 'Evaristo Costa', '1990-09-09', 'evaristo.costa@example.com', '(51) 95555-0987', 'Rua Augusta', 5050, '09876-543', 'Moinhos de Vento', 'Porto Alegre', 'RS', 'ATIVO');

#####################################################
# | INSERT | UPDATE | DELETE | [TABELA PRODUTOS]
#####################################################

#correção para permitir maiores valores dos produtos
ALTER TABLE PRODUTOS
MODIFY COLUMN VALOR_UNIT_PROD DECIMAL(7, 2);
#ALTER TABLE PRODUTOS modify column IMAGEM_PROD BLOB;
#select * from produtos;
INSERT INTO PRODUTOS (ID_PROD, NOME_PROD, QTD_EST_PROD, VALOR_UNIT_PROD , ESP_TEC_PROD, IMAGEM_PROD, COR)
VALUES (1,'Notebook XPS','50','3500.00','Processador Intel i7', 'notbook.png', 'preto');
INSERT INTO PRODUTOS (ID_PROD, NOME_PROD, QTD_EST_PROD, VALOR_UNIT_PROD , ESP_TEC_PROD, IMAGEM_PROD, COR)
VALUES(2,'Smartphone Galaxy','100','2500.00','Tela AMOLED', 'smartphone.png', 'azul e preto');
INSERT INTO PRODUTOS (ID_PROD, NOME_PROD, QTD_EST_PROD, VALOR_UNIT_PROD , ESP_TEC_PROD, IMAGEM_PROD, COR)
VALUES(3,'Tablet Pro','80','1800.00','Tela Retina', 'tablet.jpeg', 'cinza');
INSERT INTO PRODUTOS (ID_PROD, NOME_PROD, QTD_EST_PROD, VALOR_UNIT_PROD , ESP_TEC_PROD, IMAGEM_PROD, COR)
VALUES(4,'Monitor UltraWide','30','1200.00','Resolução Full HD', 'monitor.png', 'preto');
INSERT INTO PRODUTOS (ID_PROD, NOME_PROD, QTD_EST_PROD, VALOR_UNIT_PROD , ESP_TEC_PROD, IMAGEM_PROD, COR)
VALUES(5,'Teclado Mecânico','150','300.00','Switches Cherry MX', 'teclado_gamer.png', 'colorido_rgb_frescurento');

UPDATE PRODUTOS
SET VALOR_UNIT_PROD = 3400.00
WHERE ID_PROD = 1;
UPDATE PRODUTOS
SET QTD_EST_PROD = QTD_EST_PROD + 20
WHERE ID_PROD = 3;

DELETE FROM PRODUTOS
WHERE ID_PROD = 5;
INSERT INTO PRODUTOS (ID_PROD, NOME_PROD, QTD_EST_PROD, VALOR_UNIT_PROD , ESP_TEC_PROD, IMAGEM_PROD, COR)
VALUES(5,'Teclado Mecânico','150','300.00','Switches Cherry MX', 'teclado_gamer.png', 'colorido_rgb_frescurento');

#####################################################
# | INSERT | UPDATE | DELETE | [TABELA FORNECEDORES]
#####################################################

INSERT INTO FORNECEDORES (ID_FORN ,RAZ_SOC_FORN,CNPJ_FORN ,EMAIL_FORN ,TEL_FORN,RUA_FORN ,NUM_LOC_FORN ,CEP_FORN ,BAIRRO_FORN,CIDADE_FORN ,UF_FORN ,PAIS_FORN )
VALUES(1,'Tech Supplies Ltda','12.345.678/0001-99','contato@techsupplies.com.br','(11)98765-4321','Rua das Indústrias ',100,'01234-567','Industrial ','São Paulo ','SP ','Brasil');
INSERT INTO FORNECEDORES(ID_FORN ,RAZ_SOC_FORN,CNPJ_FORN ,EMAIL_FORN ,TEL_FORN,RUA_FORN ,NUM_LOC_FORN ,CEP_FORN ,BAIRRO_FORN,CIDADE_FORN ,UF_FORN ,PAIS_FORN )
VALUES(2,'Eletronic Parts SA ','98.765.432/0001-88 ','vendas@eletronicparts.com.br ','(21)91234-5678 ','Avenida Central ',200 ,'87654 -321 ','Centro ','Rio de Janeiro ','RJ ','Brasil');
INSERT INTO FORNECEDORES(ID_FORN ,RAZ_SOC_FORN,CNPJ_FORN ,EMAIL_FORN,TEL_FORN,RUA_FORN ,NUM_LOC_FORN ,CEP_FORN ,BAIRRO_FORN,CIDADE_FORN ,UF_FORN ,PAIS_FORN )
VALUES(3,'Digital World Ltda ','23.456.789/0001 -11 ','suporte@digitalworld.com.br ','(31)99876 -5432 ','Rua da Tecnologia ',300 ,'54321 -987 ','Savassi ','Belo Horizonte ','MG ','Brasil');
INSERT INTO FORNECEDORES (ID_FORN, RAZ_SOC_FORN, CNPJ_FORN, EMAIL_FORN, TEL_FORN, RUA_FORN, NUM_LOC_FORN, CEP_FORN, BAIRRO_FORN, CIDADE_FORN, UF_FORN, PAIS_FORN)
VALUES (4, 'Global Tech Solutions', '34.567.890/0001-22', 'contato@globaltech.com.br', '(41) 91234-5678', 'Rua da Inovação', 400, '65432-123', 'Centro', 'Curitiba', 'PR', 'Brasil');
INSERT INTO FORNECEDORES (ID_FORN, RAZ_SOC_FORN, CNPJ_FORN, EMAIL_FORN, TEL_FORN, RUA_FORN, NUM_LOC_FORN, CEP_FORN, BAIRRO_FORN, CIDADE_FORN, UF_FORN, PAIS_FORN)
VALUES (5, 'NextGen Components', '45.678.901/0001-33', 'suporte@nextgen.com.br', '(51) 98765-4321', 'Avenida dos Pioneiros', 500, '76543-210', 'Moinhos de Vento', 'Porto Alegre', 'RS', 'Brasil');

UPDATE FORNECEDORES
SET EMAIL_FORN = 'novocontato@techsupplies.com.br'
WHERE ID_FORN = 1;
UPDATE FORNECEDORES
SET TEL_FORN = '(21) 99999-8888'
WHERE ID_FORN = 2;

DELETE FROM FORNECEDORES
WHERE ID_FORN = 5;
INSERT INTO FORNECEDORES (ID_FORN, RAZ_SOC_FORN, CNPJ_FORN, EMAIL_FORN, TEL_FORN, RUA_FORN, NUM_LOC_FORN, CEP_FORN, BAIRRO_FORN, CIDADE_FORN, UF_FORN, PAIS_FORN)
VALUES (5, 'NextGen Components', '45.678.901/0001-33', 'suporte@nextgen.com.br', '(51) 98765-4321', 'Avenida dos Pioneiros', 500, '76543-210', 'Moinhos de Vento', 'Porto Alegre', 'RS', 'Brasil');

#####################################################
# | INSERT | UPDATE | DELETE | [TABELA VENDAS]
#####################################################

INSERT INTO VENDAS (ID_VENDA, VALOR_VENDA, DATA_VENDA, CLIENTE_VENDA)
VALUES (1, 5000.00, '2024-11-01', 1);
INSERT INTO VENDAS (ID_VENDA, VALOR_VENDA, DATA_VENDA, CLIENTE_VENDA)
VALUES (2, 3000.00, '2024-11-05', 2);
INSERT INTO VENDAS (ID_VENDA, VALOR_VENDA, DATA_VENDA, CLIENTE_VENDA)
VALUES (3, 4500.00, '2024-11-07', 3);
INSERT INTO VENDAS (ID_VENDA, VALOR_VENDA, DATA_VENDA, CLIENTE_VENDA)
VALUES (4, 2500.00, '2024-11-10', 4);
INSERT INTO VENDAS (ID_VENDA, VALOR_VENDA, DATA_VENDA, CLIENTE_VENDA)
VALUES (5, 6000.00, '2024-11-12', 1);

UPDATE VENDAS
SET VALOR_VENDA = 5200.00
WHERE ID_VENDA = 1;
UPDATE VENDAS
SET DATA_VENDA = '2024-11-06'
WHERE ID_VENDA = 2;

DELETE FROM VENDAS
WHERE ID_VENDA = 5;
INSERT INTO VENDAS (ID_VENDA, VALOR_VENDA, DATA_VENDA, CLIENTE_VENDA)
VALUES (5, 6000.00, '2024-11-12', 1);

#####################################################
# | INSERT | UPDATE | DELETE | [TABELA PAGAMENTOS]
#####################################################

INSERT INTO PAGAMENTOS (ID_PAG, VALOR_PAG, DATA_PAG, DESCONTO_PAG, PARCELAS_PAG, ID_FORM_PAG, STATUS_PAG, VENDA_PAG)
VALUES (1, 5000.00, '2024-11-02', 500.00, 10, 1,'PAGO', 1);
INSERT INTO PAGAMENTOS (ID_PAG, VALOR_PAG, DATA_PAG, DESCONTO_PAG, PARCELAS_PAG, ID_FORM_PAG, STATUS_PAG, VENDA_PAG)
VALUES (2, 3000.00, '2024-11-06', 200.00, 5, 2,'PAGO', 2);
INSERT INTO PAGAMENTOS (ID_PAG, VALOR_PAG, DATA_PAG, DESCONTO_PAG, PARCELAS_PAG, ID_FORM_PAG, STATUS_PAG, VENDA_PAG)
VALUES (3, 4500.00, '2024-11-08', 300.00, 6, 1,'PENDENTE', 3);
INSERT INTO PAGAMENTOS (ID_PAG, VALOR_PAG, DATA_PAG, DESCONTO_PAG, PARCELAS_PAG, ID_FORM_PAG, STATUS_PAG, VENDA_PAG)
VALUES (4, 2500.00, '2024-11-11', 100.00, 4, 3,'PAGO', 4);
INSERT INTO PAGAMENTOS (ID_PAG ,VALOR_PAG ,DATA_PAG ,DESCONTO_PAG ,PARCELAS_PAG ,ID_FORM_PAG ,STATUS_PAG ,VENDA_PAG )
VALUES(5, 6000.00,'2024-11-13', 500.00, 10, 1, 'PENDENTE ', 5);

UPDATE PAGAMENTOS
SET STATUS_PAG = 'PAGO'
WHERE ID_PAG = 3;
UPDATE PAGAMENTOS
SET DESCONTO_PAG = 400.00
WHERE ID_PAG = 5;

DELETE FROM PAGAMENTOS
WHERE ID_PAG = 5; 
INSERT INTO PAGAMENTOS (ID_PAG ,VALOR_PAG ,DATA_PAG ,DESCONTO_PAG ,PARCELAS_PAG ,ID_FORM_PAG ,STATUS_PAG ,VENDA_PAG )
VALUES(5, 6000.00,'2024-11-13', 500.00, 10, 1, 'PENDENTE ', 5);

#####################################################
# | INSERT | UPDATE | DELETE | [TABELA PRODUTOS_FORNECEDORES]
#####################################################

INSERT INTO PRODUTOS_FORNECEDORES (PRFR_PROD, PRFR_FORN)
VALUES (1, 1);
INSERT INTO PRODUTOS_FORNECEDORES (PRFR_PROD, PRFR_FORN)
VALUES (2, 2);
INSERT INTO PRODUTOS_FORNECEDORES (PRFR_PROD ,PRFR_FORN )
VALUES(3 ,3);
INSERT INTO PRODUTOS_FORNECEDORES(PRFR_PROD ,PRFR_FORN )
VALUES(4 ,4);
INSERT INTO PRODUTOS_FORNECEDORES(PRFR_PROD ,PRFR_FORN )
VALUES(5 ,1);

UPDATE PRODUTOS_FORNECEDORES
SET PRFR_FORN = 3
WHERE PRFR_PROD = 1;
UPDATE PRODUTOS_FORNECEDORES
SET PRFR_PROD = 2
WHERE PRFR_FORN = 4;

DELETE FROM PRODUTOS_FORNECEDORES
WHERE PRFR_PROD = 5 AND PRFR_FORN = 1;

#####################################################
# | INSERT | UPDATE | DELETE | [TABELA PRODUTOS_VENDAS]
#####################################################

INSERT INTO PRODUTOS_VENDAS (PRVN_PROD, PRVN_VEND, PRVN_QUANTD_PROD)
VALUES (1, 1, 2);
INSERT INTO PRODUTOS_VENDAS (PRVN_PROD ,PRVN_VEND ,PRVN_QUANTD_PROD )
VALUES(2 ,2 ,'3');
INSERT INTO PRODUTOS_VENDAS(PRVN_PROD ,PRVN_VEND ,PRVN_QUANTD_PROD )
VALUES(3 ,3 ,'1');
INSERT INTO PRODUTOS_VENDAS(PRVN_PROD ,PRVN_VEND ,PRVN_QUANTD_PROD )
VALUES(4 ,4 ,'4');
INSERT INTO PRODUTOS_VENDAS(PRVN_PROD ,PRVN_VEND ,PRVN_QUANTD_PROD )
VALUES(5 ,5 ,'5');

UPDATE PRODUTOS_VENDAS
SET PRVN_QUANTD_PROD = PRVN_QUANTD_PROD + 1
WHERE PRVN_PROD = 1 AND PRVN_VEND = 1;
UPDATE PRODUTOS_VENDAS
SET PRVN_QUANTD_PROD = PRVN_QUANTD_PROD - 2
WHERE PRVN_PROD = 5 AND PRVN_VEND = 5;

DELETE FROM PRODUTOS_VENDAS
WHERE PRVN_PROD = 5 AND PRVN_VEND = 5;
INSERT INTO PRODUTOS_VENDAS(PRVN_PROD ,PRVN_VEND ,PRVN_QUANTD_PROD )
VALUES(5 ,5 ,'5');
