
INSERT INTO usuario
VALUES 
	('1'),('2'), ('3'), ('4'), ('5'),('6');
		

INSERT INTO eletronicos (nome, potencia)
VALUES
    ('lpFluorecente40w', 40),
    ('Liquidificador', 200),
    ('Televisão', 100),
    ('Geladeira', 150),
    ('Micro-ondas', 800),
    ('Ventilador', 60),
    ('Ar-condicionado', 1200),
    ('Ferro de passar roupa', 1000),
    ('Chuveiro elétrico', 4500),
    ('Máquina de lavar roupa', 500),
    ('Lâmpada LED', 10),
    ('Aspirador de pó', 700),
    ('Computador', 250),
    ('Notebook', 200),
    ('Impressora', 50),
    ('Liquidificador', 400),
    ('Forno elétrico', 1200),
    ('Secador de cabelo', 1500),
    ('Máquina de café', 800),
    ('Aparelho de som', 80);

INSERT INTO taxa(UF, Valor)
VALUES
	('PE', 0.89),
    ('SE', 0.658),
    ('RN', 0.689),
    ('PI', 0.743);
    
INSERT INTO calenergia(idUsuario_FK, idEletronico_FK, UF_FK, tempo, qtdDias)
VALUES 
	('1','1', 'PE', 4, 15),
    ('1','2', 'PE', 8, 7),
    ('2','3', 'PE', 2, 5),
    ('2','4', 'PE', 3, 10),
    ('3','5', 'PE', 1, 30),
    ('4','6', 'PE', 5, 24),
    ('5','7', 'PE', 3, 23);


INSERT INTO calimc (sexo, peso, altura, idUsuario_FK)
VALUES
	('M', 55.30, 1.70,  1),
    ('F', 44.30, 1.68,  2),
    ('M', 68.50, 1.80,  3),
    ('F', 52.10, 1.65,  4),
    ('M', 70.20, 1.75,  5),
    ('F', 60.80, 1.70,  6);
   
INSERT INTO met (NomeExercicio, MET)
VALUES
    ('Sentado/Escritório', 1.5),
    ('Caminhada Leve', 2.0),
    ('Caminhada Moderada', 3.5),
    ('Corrida de Baixa Intensidade', 4.0),
    ('Corrida de Média Intensidade', 8.0),
    ('Corrida de Alta Intensidade', 12.0),
    ('Natação Leve', 5.0),
    ('Natação Moderada', 7.0),
    ('Natação Intensa', 10.0),
    ('Ciclismo Leve', 4.0),
    ('Ciclismo Moderado', 6.0),
    ('Ciclismo Intenso', 10.0),
    ('Levantamento de Peso', 6.0),
    ('Yoga', 2.5),
    ('Pilates', 3.0),
    ('Alongamento', 2.0),
    ('Zumba', 5.0),
    ('Aeróbica', 7.0),
    ('Basquete', 8.0),
    ('Futebol', 9.0);
    
INSERT INTO calatividadefisica (idIMC_FK, idMET_FK, tempo)
VALUES
    ('1', '1', 2),
    ('2', '2', 5),
    ('3', '3', 1),
    ('4', '4', 3),
    ('5', '5', 4),
    ('6', '6', 6);

