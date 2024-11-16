#USANDO BANCO DE DADOS ESTUDO DE CASO 1 CC1M
USE EC1_CC1M;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA FORNECEDORES]
INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_NOME, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_PAIS, FORNEC_CONTATO)
VALUES
(1, 'Napoleão Sem Medo e Sem Mácula', 'Beco da Navalha', 1000, 'Centro', 'São Paulo', 'SP', '01000-000', '91234-5678', 'Brasil', 'João Silva'),
(2, 'Aeronauta Barata', 'Caminho da Falta de Esperança', 1001, 'Jardim das Flores', 'Curitiba', 'PR', '80000-000', '99876-5432', 'Brasil', 'Maria Oliveira'),
(3, 'Alucinética Honorata', 'Beco da Esperança', 1002, 'Vila Nova', 'Rio de Janeiro', 'RJ', '20000-000', '98765-4321', 'Brasil', 'Carlos Santos'),
(4, 'Veneza Americana Derecife', 'Alameda da Tristeza', 1003, 'Praia do Leste', 'Salvador', 'BA', '40000-000', '92345-6789', 'Brasil', 'Ana Costa'),
(5, 'Maxwelbe', 'Travessa do Ventilador', 1004, 'Bairro Alto', 'Belo Horizonte', 'MG', '30000-000', '93456-7890', 'Brasil', 'Luiz Pereira'),
(6, 'Distribuidora Sol Nascente', 'Rua da Esperança', 1005, 'Vila Verde', 'Florianópolis', 'SC', '88000-000', '91234-5679', 'Brasil', 'Fernanda Lima');
UPDATE FORNECEDORES SET FORNEC_NUMRUA = 1010 WHERE FORNEC_COD = 1;
UPDATE FORNECEDORES SET FORNEC_NUMRUA = 1012 WHERE FORNEC_COD = 2;
DELETE FROM FORNECEDORES WHERE FORNEC_COD = 6;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA FILIAIS]
INSERT INTO FILIAIS (FILIAL_COD, FILIAL_NOME, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_PAIS, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE)
VALUES 
(1, 'Filial Centro', 'Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', 'Brasil', '01000-000', 'Capacidade para 100 pessoas'),
(2, 'Filial Norte', 'Avenida das Árvores', 456, 'Jardim Verde', 'Curitiba', 'PR', 'Brasil', '80000-000', 'Capacidade para 150 pessoas'),
(3, 'Filial Sul', 'Rua do Sol', 789, 'Vila Nova', 'Rio de Janeiro', 'RJ', 'Brasil', '20000-000', 'Capacidade para 200 pessoas'),
(4, 'Filial Leste', 'Alameda da Paz', 1011, 'Praia do Leste', 'Salvador', 'BA', 'Brasil', '40000-000', 'Capacidade para 120 pessoas'),
(5, 'Filial Oeste', 'Travessa do Ventilador', 1213, 'Bairro Alto', 'Belo Horizonte', 'MG', 'Brasil', '30000-000', 'Capacidade para 80 pessoas'),
(6, 'Filial Oeste II', 'Rua do Comércio', 202, 'Centro Comercial', 'Fortaleza', 'CE', '90000-000', 'Brasil', 'Capacidade para 90 pessoas');
UPDATE FILIAIS SET FILIAL_NOME = 'Filial Centro-Oeste' WHERE FILIAL_COD = 6;
UPDATE FILIAIS SET FILIAL_CAPACIDADE = 'Capacidade para 150 pessoas' WHERE FILIAL_COD = 3;
DELETE FROM FILIAIS WHERE FILIAL_COD = 6;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA PRODUTOS]
INSERT INTO PRODUTOS (PROD_COD, PROD_NOME, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECOUNIT, PROD_UNIDMEDIDA, PROD_ESTOQ_MIN)
VALUES 
(1, 'Camiseta Polo', 'Camiseta polo de algodão com várias cores.', 'Tecido leve e respirável.', 150000, 49.90, 'unidades', 20000),
(2, 'Tênis Esportivo', 'Tênis ideal para corrida e atividades físicas.', 'Solado em borracha e design ergonômico.', 75500, 299.90, 'par', 10000),
(3, 'Relógio Digital', 'Relógio digital à prova da água com cronômetro.', 'Bateria de longa duração.', 200000, 199.99, 'unidades', 15000),
(4, 'Mochila Escolar', 'Mochila com compartimentos para laptop e material escolar.', 'Material resistente à água.', 120000, 89.90, 'unidades', 30000),
(5, 'Fone de Ouvido Bluetooth', 'Fone de ouvido sem fio com cancelamento de ruído.', 'Conexão rápida e qualidade de som superior.', 180000, 149.90, 'unidades', 25000),
(6, 'Cadeira Ergonomica', 'Cadeira projetada para conforto e suporte durante longas horas de trabalho.', 'Ajuste de altura e apoio lombar.', 50000, 349.90, 'unidades', 5000);
UPDATE PRODUTOS SET PROD_DESCRICAO = 'Tecido leve e abrasivo.' WHERE PROD_COD = 1;
UPDATE PRODUTOS SET PROD_QUANT = 150000 WHERE PROD_COD = 4;
DELETE FROM PRODUTOS WHERE PROD_COD = 6;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA PEDIDOS]
INSERT INTO PEDIDOS (PED_CODIGO, PED_DATA, PED_HORA, PED_PREVISAO, PED_STATUS, PED_FORNECEDOR)
VALUES 
(1, '2024-11-12', '10:30:00', '2024-11-20', 'PENDENTE', 1),
(2, '2024-11-13', '14:00:00', '2024-11-21', 'CONCLUÍDO', 2),
(3, '2024-11-14', '09:15:00', '2024-11-22', 'EM ESPERA', 3),
(4, '2024-11-15', '16:45:00', '2024-11-23', 'PENDENTE', 4),
(5, '2024-11-16', '11:00:00', '2024-11-24', 'CONCLUÍDO', 5);
UPDATE PEDIDOS SET PED_STATUS = 'CONCLUÍDO' WHERE PED_CODIGO = 3;
UPDATE PEDIDOS SET PED_STATUS = 'CONCLUÍDO' WHERE PED_CODIGO = 4;
DELETE FROM PEDIDOS WHERE PED_CODIGO = 6;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA RECEBIMENTOS]
INSERT INTO RECEBIMENTOS (RECEB_DATA, RECEB_HORA, RECEB_QUANT_PROD, RECEB_CONDICAO, RECEB_PEDIDOS)
VALUES
('2024-11-01', '10:30:00', 150500, 'Recebido em boas condições', 1),
('2024-11-02', '14:00:00', 200750, 'Recebido com avarias', 2),
('2024-11-03', '09:15:00', 300000, 'Recebido em perfeitas condições', 3),
('2024-11-04', '16:45:00', 120250, 'Recebido parcialmente danificado', 4),
('2024-11-05', '08:00:00', 75500, 'Recebido conforme o pedido', 5);
UPDATE RECEBIMENTOS SET RECEB_QUANT_PROD = 166600, RECEB_HORA = '10:30:00' WHERE RECEB_PEDIDOS = 1;
UPDATE RECEBIMENTOS SET RECEB_QUANT_PROD = 666666 WHERE RECEB_PEDIDOS = 2;
DELETE FROM RECEBIMENTOS WHERE RECEB_PEDIDOS = 5;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA PEDIDOS_PRODUTOS]
INSERT INTO PEDIDOS_PRODUTOS (PDPR_PEDIDOS, PDPR_PRODUTOS, PDPR_QUANT)
VALUES 
(1, 1, 100.500),
(2, 2, 200.750),
(3, 3, 300.000),
(4, 4, 120.250),
(5, 5, 75.500)
ON DUPLICATE KEY UPDATE PDPR_QUANT = VALUES(PDPR_QUANT);
UPDATE PEDIDOS_PRODUTOS SET PDPR_QUANT = 110.500 WHERE PDPR_PEDIDOS = 1 AND PDPR_PRODUTOS = 1;
UPDATE PEDIDOS_PRODUTOS SET PDPR_QUANT = 210.750 WHERE PDPR_PEDIDOS = 2 AND PDPR_PRODUTOS = 2;
DELETE FROM PEDIDOS_PRODUTOS WHERE PDPR_PEDIDOS = 5 AND PDPR_PRODUTOS = 5;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA FILIAIS_PRODUTOS]
INSERT INTO FILIAIS_PRODUTOS (FLPR_FILIAL, FLPR_PRODUTOS, FLPR_QUANT)
VALUES 
(1, 1, 5000.000),
(2, 2, 3000.000),
(3, 3, 7000.000),
(4, 4, 4500.000),
(5, 5, 1500.000) ####################
AS new_values
ON DUPLICATE KEY UPDATE FLPR_QUANT = new_values.FLPR_QUANT;
UPDATE FILIAIS_PRODUTOS SET FLPR_QUANT = 5500.000 WHERE FLPR_FILIAL = 1;
UPDATE FILIAIS_PRODUTOS SET FLPR_QUANT = 3200.000 WHERE FLPR_FILIAL = 2;
DELETE FROM FILIAIS_PRODUTOS WHERE FLPR_FILIAL = 6 AND FLPR_PRODUTOS = 6;
########################################################################################################################
# | INSERT | UPDATE | DELETE | [TABELA FORNECEDORES_PRODUTOS]
INSERT INTO FORNECEDORES_PRODUTOS (FRPR_FORNECEDOR, FRPR_PRODUTOS)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
AS new_values
ON DUPLICATE KEY UPDATE FRPR_FORNECEDOR = new_values.FRPR_FORNECEDOR, FRPR_PRODUTOS = new_values.FRPR_PRODUTOS;
UPDATE FORNECEDORES_PRODUTOS SET FRPR_FORNECEDOR = 2 WHERE FRPR_PRODUTOS = 1;
UPDATE FORNECEDORES_PRODUTOS SET FRPR_FORNECEDOR = 3 WHERE FRPR_PRODUTOS = 2;
DELETE FROM FORNECEDORES_PRODUTOS WHERE FRPR_FORNECEDOR = 4;
