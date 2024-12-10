-- Tabela de Clientes
create database bdnovita;

use bdnovita;

CREATE TABLE tbCliente (
    Pk_id_cliente INT PRIMARY KEY,
    Nome_Client VARCHAR(40),
    email_Client VARCHAR(40),
    historico_Client VARCHAR(40),
    data_Client DATE,
    telefone_Client VARCHAR(40),
    endereco_Client VARCHAR(40)
);


-- Tabela de Fornecedores
CREATE TABLE tbFornecedor (
    _Pk_id_fornecedor INT PRIMARY KEY,
    Nome_Forn VARCHAR(40),
    telefone_Forn VARCHAR(40),
    email_Forn VARCHAR(40),
    endereco_Forn VARCHAR(40),
    Cnpj_cpf_Forn VARCHAR(40),
    categoria_Forn VARCHAR(40)
);

-- Tabela de Estoque
CREATE TABLE tbEstoque (
    id_estoque INT PRIMARY KEY,
    Nome_produto_Estoq VARCHAR(40),
    quantidade_Estoq INT,
    data_Estoq DATE,
    Data_de_val_Prod DATE,
    Preco_de_Compra_Prod FLOAT
);

-- Tabela de Funcionários
CREATE TABLE tbFuncionario (
    Pk_CPF INT PRIMARY KEY,
    Nome_Func VARCHAR(40),
    cargo_Func VARCHAR(40),
    data_nasc_Func DATE,
    email_Func VARCHAR(40),
    telefone_Func VARCHAR(40),
    contratacao_Func DATE,
    endereco_Func VARCHAR(40)
);

-- Tabela de Gerentes de Unidade
CREATE TABLE tbGerente_de_Unidade (
    Pk_id_gerente INT PRIMARY KEY,
    Nome_Ger VARCHAR(40),
    telefone_Ger VARCHAR(40),
    email_Ger VARCHAR(40),
    Setor_Ger VARCHAR(40)
);

-- Tabela de Pratos do Dia (Almoço)
CREATE TABLE tbAlmoco (
    PK_id_prato INT PRIMARY KEY,
    Nome_Prato VARCHAR(255),
    Preco_de_Venda DECIMAL(10, 2)
); 

-- Tabela de Pacotes de Venda
CREATE TABLE tbPacoteVenda (
    PK_id_pacote INT PRIMARY KEY,
    Nome_Pacote VARCHAR(255),
    Preco_Pacote DECIMAL(10, 2)
);


-- Tabela de Compras (Clientes e Produtos)
CREATE TABLE tbCompra (
    fk_Cliente_Pk_id_cliente INT,
    fk_Produto_PK_id_pacote INT,
    FOREIGN KEY (fk_Cliente_Pk_id_cliente) REFERENCES tbCliente(Pk_id_cliente),
    FOREIGN KEY (fk_Produto_PK_id_pacote) REFERENCES tbPacoteVenda(PK_id_pacote)
);

-- Tabela de Fornecimento (Produtos e Fornecedores)
CREATE TABLE tbFornece (
    fk_Produto_PK_id_estoque INT,
    fk_Fornecedor__Pk_id_fornecedor INT,
    FOREIGN KEY (fk_Produto_PK_id_estoque) REFERENCES tbEstoque(id_estoque),
    FOREIGN KEY (fk_Fornecedor__Pk_id_fornecedor) REFERENCES tbFornecedor(_Pk_id_fornecedor)
);


-- Tabela de Gerência de Estoque
CREATE TABLE tbGerencia (
    fk_Estoque_PK_id_produto INT,
    fk_Funcionario_Pk_id_funcionario INT,
    FOREIGN KEY (fk_Estoque_PK_id_produto) REFERENCES tbEstoque(id_estoque),
    FOREIGN KEY (fk_Funcionario_Pk_id_funcionario) REFERENCES tbFuncionario(Pk_CPF)
);

-- Tabela de Contratação de Gerentes
CREATE TABLE tbContrata (
    fk_Fornecedor__Pk_id_fornecedor INT,
    fk_Gerente_de_Unidade_Pk_id_gerente INT,
    FOREIGN KEY (fk_Fornecedor__Pk_id_fornecedor) REFERENCES tbFornecedor(_Pk_id_fornecedor),
    FOREIGN KEY (fk_Gerente_de_Unidade_Pk_id_gerente) REFERENCES tbGerente_de_Unidade(Pk_id_gerente)
);

-- Tabela de Coordenação de Funcionários
CREATE TABLE tbCoordena (
    fk_Gerente_de_Unidade_Pk_id_gerente INT,
    fk_Funcionario_Pk_id_funcionario INT,
    FOREIGN KEY (fk_Gerente_de_Unidade_Pk_id_gerente) REFERENCES tbGerente_de_Unidade(Pk_id_gerente),
    FOREIGN KEY (fk_Funcionario_Pk_id_funcionario) REFERENCES tbFuncionario(Pk_CPF)
);

-- Tabela de Supervisão de Estoque
CREATE TABLE tbSupervisiona (
    fk_Estoque_PK_id_produto INT,
    fk_Gerente_de_Unidade_Pk_id_gerente INT,
    FOREIGN KEY (fk_Estoque_PK_id_produto) REFERENCES tbEstoque(id_estoque),
    FOREIGN KEY (fk_Gerente_de_Unidade_Pk_id_gerente) REFERENCES tbGerente_de_Unidade(Pk_id_gerente)
);


-- Inserção de Gerentes
INSERT INTO tbGerente_de_Unidade (Pk_id_gerente, Nome_Ger, telefone_Ger, email_Ger, Setor_Ger) 
VALUES (1, 'Gabrielle Carvalho', '13930869959', 'gabrielle.carv22@gmail.com', 'Nutrição');

-- Inserção de Fornecedores
INSERT INTO tbFornecedor (_Pk_id_fornecedor, Nome_Forn, telefone_Forn, email_Forn, endereco_Forn, Cnpj_cpf_Forn, categoria_Forn) 
VALUES (00, 'CD SuperLogístico', '(16) 3902-1900', 'assessoria@superfrio.com.br', 'Av.Luiz Eduardo T Prado, nº800-RP-SP', '02.060.862/0011-07', 'Alimentos');

-- Inserção de Funcionários
INSERT INTO tbFuncionario (Pk_CPF, Nome_Func, cargo_Func, data_nasc_Func, email_Func, telefone_Func, contratacao_Func, endereco_Func) 
VALUES 
(1000, 'Gabriel de Oliveira Favero', 'Aprendiz', '2001-10-20', 'gabrieldo78@gmail.com', '(24) 97884-1740', '2023-11-13', 'Rua oito, jardim dos cardoso cabuçu, 192'),
(1001, 'Ana Costa', 'Cozinheira Plena', '1985-03-22', 'ana.costa@empresa.com', '(11) 91234-5678', '2020-01-15', 'Rua Nova, 45'),
(1002, 'Luiz Pereira', 'Assistente de Cozinha', '1990-08-15', 'luiz.pereira@empresa.com', '(21) 92345-6789', '2021-06-10', 'Av. Central, 123'),
(1003, 'Clara Souza', 'Auxiliar de Cozinha', '1995-12-05', 'clara.souza@empresa.com', '(31) 93456-7890', '2023-03-01', 'Praça do Sol, 67'),
(1004, 'Rafael Lima', 'Cozinheiro Jr.', '1988-05-30', 'rafael.lima@empresa.com', '(41) 94567-8901', '2022-09-20', 'Alameda das Palmeiras, 89');

-- Inserção de Pacotes Semanais
INSERT INTO tbPacoteVenda (PK_id_pacote, Nome_Pacote, Preco_Pacote) 
VALUES
(1, 'Pacote 1 - Segunda-feira a Domingo', 245.00),
(2, 'Pacote 2 - Almoço Executivo', 220.00),
(3, 'Pacote 3 - Prato Completo', 270.00),
(4, 'Pacote 4 - Dieta e Sobremesas', 200.00);

-- Inserção de Cliente
INSERT INTO tbCliente (Pk_id_cliente, Nome_Client, email_Client, historico_Client, data_Client, telefone_Client, endereco_Client) 
VALUES 
(1, 'Kitchens Com. de Aparelhos Domésticos', 'republica@kitchens.com.br', NULL, '2024-11-19', '(11) 2431-3601', 'Rod. Pres. Dutra - s/n Km 211, Gru - SP');

-- inserção de produtos no estoque
INSERT INTO tbEstoque (id_estoque, Nome_produto_Estoq, data_Estoq, quantidade_Estoq) 
VALUES 
-- Arroz/Graos/Farinaceos/Massas
(01, 'Amido de Milho', '2025-12-31', 4.71),
(02, 'Arroz Agulhinha/Mix 6x5kg', '2025-12-31', 4.90),
(03, 'Arroz Integral', '2025-12-31', 5.30),
(04, 'Canelone de Presunto e Queijo', '2025-12-31', 18.60),
(05, 'Farinha de Rosca', '2025-12-31', 6.66),
(06, 'Farinha de Trigo', '2025-12-31', 2.43),
(07, 'Feijão Branco', '2025-12-31', 12.92),
(08, 'Feijão Carioca T1', '2025-12-31', 4.80),
(09, 'Feijão Carioca TP1 Banda', '2025-12-31', 2.01),
(10, 'Feijão Fradinho', '2025-12-31', 6.04),
(11, 'Feijão Preto', '2025-12-31', 5.73),
(12, 'Fubá', '2025-12-31', 2.66),
(13, 'Macarrão Ave Maria com Ovos', '2025-12-31', 5.58),
(14, 'Macarrão Espaguete com Ovos', '2025-12-31', 4.30),
(15, 'Massa para Lasanha Fresca', '2025-12-31', 9.53),
(16, 'Massa para Pastel', '2025-12-31', 9.90),
(17, 'Proteína de Soja Texturizada Escura', '2025-12-31', 10.12),

-- Bebidas
(118, 'Água com Gás 500ml', '2025-12-31', 6.34),
(119, 'Água sem Gás 1,5L', '2025-12-31', 6.44),
(120, 'Água sem Gás 500ml', '2025-12-31', 6.49),
(121, 'Chá Mate Limão 300ml', '2025-12-31', 6.74),
(122, 'Energético', '2025-12-31', 6.91),
(123, 'Refrigerante Coca-Cola Lata', '2025-12-31', 7.20),
(124, 'Refrigerante Coca-Cola 1,5L', '2025-12-31', 8.20),
(125, 'Refrigerante Coca-Cola 220ml', '2025-12-31', 8.92),
(126, 'Refrigerante Coca Zero 220ml', '2025-12-31', 9.20),
(127, 'Refrigerante Guaraná 2L', '2025-12-31', 9.71),
(128, 'Refrigerante Limão 220ml', '2025-12-31', 10.01),
(129, 'Schweppes Citrus', '2025-12-31', 10.78),
(130, 'Suco em Pó de Abacaxi 250g', '2025-12-31', 11.01),
(131, 'Suco em Pó de Goiaba 250g', '2025-12-31', 12.05),
(132, 'Suco em Pó de Maracujá 250g', '2025-12-31', 13.94),
(133, 'Suco em Pó de Manga 250g', '2025-12-31', 33.58),
(134, 'Suco em Pó de Morango 250g', '2025-12-31', 30.05),

-- Carnes
(235, 'Barriga Defumada', '2025-12-31', 19.46),
(236, 'Bife de Patinho 70/80gr', '2025-12-31', 26.00),
(237, 'Carne em Cubo', '2025-12-31', 22.74),
(238, 'Carne Moída', '2025-12-31', 17.85),
(239, 'Carne Seca Dianteira', '2025-12-31', 24.67),
(240, 'Contra Filé', '2025-12-31', 26.00),
(241, 'Copa Lombo', '2025-12-31', 15.22),
(242, 'Costela Bovina', '2025-12-31', 23.00),
(243, 'Cupim', '2025-12-31', 31.90),

-- Hortifruti
(344, 'Alho Descascado', '2025-12-31', 15.30),
(345, 'Banana Nanica', '2025-12-31', 4.80),
(346, 'Cenoura Cubos Congelados', '2025-12-31', 5.53),
(347, 'Tomate Salada', '2025-12-31', 3.00),
(348, 'Melancia', '2025-12-31', 8.00),
(349, 'Maçã 150', '2025-12-31', 6.95),
(350, 'Couve Manteiga Congelada', '2025-12-31', 13.34),

-- Laticínios
(451, 'Composto Lácteo Culinário', '2025-12-31', 19.74),
(452, 'Margarina com Sal 500g', '2025-12-31', 10.70),
(453, 'Queijo Parmesão', '2025-12-31', 39.72);

-- Inserção de produtos fornecidos
INSERT INTO tbFornece (fk_Produto_PK_id_estoque, fk_Fornecedor__Pk_id_fornecedor) 
VALUES
(01, 00),
(02, 00),
(03, 00),
(04, 00),
(05, 00);

-- inserção de Compras de pacotes
INSERT INTO tbCompra (fk_Cliente_Pk_id_cliente, fk_Produto_PK_id_pacote) 
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- inserção de coordenação de funcionários
INSERT INTO tbCoordena (fk_Gerente_de_Unidade_Pk_id_gerente, fk_Funcionario_Pk_id_funcionario) 
VALUES
(1, 1000),
(1, 1001),
(1, 1002),
(1, 1003),
(1, 1004);

-- Exibe informações básicas dos gerentes de unidade cadastrados.
SELECT Pk_id_gerente, Nome_Ger, telefone_Ger, email_Ger, Setor_Ger
FROM tbGerente_de_Unidade;

-- Lista os produtos e suas respectivas quantidades disponíveis no estoque.
SELECT Nome_produto_Estoq, quantidade_Estoq
FROM tbEstoque;

-- Calcula a soma total das quantidades de todos os produtos disponíveis no estoque.
SELECT SUM(quantidade_Estoq) AS Total_Quantidade_Estoque
FROM tbEstoque;

-- Mostra os produtos fornecidos pelo fornecedor "CD SuperLogístico" e suas quantidades no estoque.
SELECT 
    f.Nome_Forn AS Fornecedor,
    e.Nome_produto_Estoq AS Produto,
    e.quantidade_Estoq AS Quantidade
FROM 
    tbFornece AS fornecimento
JOIN 
    tbFornecedor AS f ON fornecimento.fk_Fornecedor__Pk_id_fornecedor = f._Pk_id_fornecedor
JOIN 
    tbEstoque AS e ON fornecimento.fk_Produto_PK_id_estoque = e.id_estoque
WHERE 
    f.Nome_Forn = 'CD SuperLogístico';

-- Exibe os pacotes semanais com preço maior que R$200,00.
SELECT Nome_Pacote, Preco_Pacote
FROM tbPacoteVenda
WHERE Preco_Pacote > 200.00;

-- Lista os funcionários cadastrados ordenados pela data de contratação, do mais recente ao mais antigo.
SELECT Nome_Func, cargo_Func, contratacao_Func
FROM tbFuncionario
ORDER BY contratacao_Func DESC;

-- Calcula o preço médio de todos os pacotes semanais cadastrados.
SELECT AVG(Preco_Pacote) AS Preco_Medio_Pacotes
FROM tbPacoteVenda;

-- Conta o número total de funcionários cadastrados no sistema.
SELECT COUNT(*) AS Total_Funcionarios
FROM tbFuncionario;

-- Relaciona os clientes com os pacotes adquiridos, mostrando o nome e o preço dos pacotes.
SELECT 
    c.fk_Cliente_Pk_id_cliente AS Cliente,
    p.Nome_Pacote AS Pacote,
    p.Preco_Pacote AS Preco
FROM 
    tbCompra AS c
JOIN 
    tbPacoteVenda AS p ON c.fk_Produto_PK_id_pacote = p.PK_id_pacote;

-- Calcula o total gasto pelo cliente com ID 1 considerando os pacotes adquiridos.
SELECT 
    c.fk_Cliente_Pk_id_cliente AS Cliente,
    SUM(p.Preco_Pacote) AS Gasto_Total
FROM 
    tbCompra AS c
JOIN 
    tbPacoteVenda AS p ON c.fk_Produto_PK_id_pacote = p.PK_id_pacote
WHERE 
    c.fk_Cliente_Pk_id_cliente = 1;

-- Conta o número total de compras realizadas no sistema.
SELECT COUNT(*) AS Total_Compras
FROM tbCompra;

-- Relaciona os gerentes com os funcionários que eles coordenam, exibindo informações detalhadas.
SELECT 
    g.Nome_Ger AS Nome_Gerente,
    f.Nome_Func AS Nome_Funcionario,
    f.cargo_Func AS Cargo,
    f.email_Func AS Email,
    f.telefone_Func AS Telefone
FROM 
    tbCoordena AS c
JOIN 
    tbGerente_de_Unidade AS g ON c.fk_Gerente_de_Unidade_Pk_id_gerente = g.Pk_id_gerente
JOIN 
    tbFuncionario AS f ON c.fk_Funcionario_Pk_id_funcionario = f.Pk_CPF;