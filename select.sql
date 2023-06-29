-- -----------------------------------------------------
-- RELATORIO ENERGIA
-- -----------------------------------------------------

#Quanto de kwh você gasta em cada eletronico por dia?
SELECT idUsuario as idUSuario, e.nome,  CONCAT(ROUND((e.potencia / 1000) * calE.tempo, 2), ' kWh') AS GastoDiario, CONCAT('R$ ', ROUND(((e.potencia / 1000) * calE.tempo) * t.valor, 2)) AS Valor
FROM usuario
INNER JOIN calenergia calE ON calE.idUsuario_FK = usuario.idUsuario
INNER JOIN eletronicos e on e.idEletronico = calE.idEletronico_FK
INNER JOIN taxa t on t.UF = calE.UF_FK;

#Quanto de kwh você gasta em cada eletronico por mês?
SELECT idUsuario as idUSuario, e.nome, CONCAT(ROUND((e.potencia / 1000) * calE.tempo * calE.qtdDias, 2), ' kWh') AS GastoMensal, CONCAT('R$ ', ROUND(((e.potencia / 1000) * calE.tempo * calE.qtdDias) * t.valor, 2)) AS Valor
FROM usuario
INNER JOIN calenergia calE ON calE.idUsuario_FK = usuario.idUsuario
INNER JOIN eletronicos e on e.idEletronico = calE.idEletronico_FK
INNER JOIN taxa t on t.UF = calE.UF_FK;

#Qual a fatura mensal do usuario baseada no kwh  ?
SELECT idUsuario as idUSuario,  CONCAT(SUM( ROUND(((e.potencia / 1000) * calE.tempo * calE.qtdDias), 2)), ' kWh')  AS ValorFatura, CONCAT('R$ ', SUM( ROUND(((e.potencia / 1000) * calE.tempo * calE.qtdDias) * t.valor, 2)))  AS ValorFatura
FROM usuario
INNER JOIN calenergia calE ON calE.idUsuario_FK = usuario.idUsuario
INNER JOIN eletronicos e on e.idEletronico = calE.idEletronico_FK
INNER JOIN taxa t on t.UF = calE.UF_FK
GROUP BY idUsuario_FK;

#Qual a fatura mensal do usuario baseada no kwh (filtrando pelo usuário) ?
SELECT idUsuario as idUSuario,  CONCAT(SUM( ROUND(((e.potencia / 1000) * calE.tempo * calE.qtdDias), 2)), ' kWh')  AS ValorFatura, CONCAT('R$ ', SUM( ROUND(((e.potencia / 1000) * calE.tempo * calE.qtdDias) * t.valor, 2)))  AS ValorFatura
FROM usuario
INNER JOIN calenergia calE ON calE.idUsuario_FK = usuario.idUsuario
INNER JOIN eletronicos e on e.idEletronico = calE.idEletronico_FK
INNER JOIN taxa t on t.UF = calE.UF_FK
WHERE  idUsuario = '2'
GROUP BY idUsuario_FK;


-- -----------------------------------------------------
-- RELATORIO IMC
-- -----------------------------------------------------

#IMC cadastrados no banco
SELECT idIMC as ID, CONCAT(peso, ' Kg') AS peso, CONCAT(altura, ' m') as altura, ROUND((peso / (altura * altura)), 2) AS imc
FROM CalImc;


#Calcule o IMC e mostre o Status de peso idel, acima do peso ou abaixo.
SELECT idUsuario, CONCAT(peso, ' Kg') AS peso, CONCAT(altura, ' m'), ROUND((peso / (altura * altura)), 2) AS imc,
	CASE
		WHEN sexo = 'M' THEN
			CASE
				WHEN (peso / (altura * altura)) < 20 THEN 'Abaixo do peso'
                WHEN (peso / (altura * altura)) >= 20 AND (peso / (altura * altura)) < 25 THEN 'Peso adequado'
                WHEN (peso / (altura * altura)) >= 25 THEN 'Acima do peso'
            END
		WHEN sexo = 'F' THEN
			CASE
                WHEN (peso / (altura * altura)) < 19 THEN 'Abaixo do peso'
                WHEN (peso / (altura * altura)) >= 19 AND (peso / (altura * altura)) < 24 THEN 'Peso adequado'
                WHEN (peso / (altura * altura)) >= 24 THEN 'Acima do peso'
            END
	END AS status_imc
    FROM calimc
    LEFT JOIN usuario u ON u.idUsuario = calimc.idUsuario_FK;

#MEDIA DE IMC DOS USUARIOS
SELECT ROUND(AVG((peso / (altura * altura))),2) AS media_imc
FROM CalImc;

#Média de IMC feminio
SELECT ROUND(AVG((peso / (altura * altura))),2) AS media_imc
FROM CalImc
WHERE sexo like 'F';

#Média de IMC masculino
SELECT ROUND(AVG((peso / (altura * altura))),2) AS media_imc
FROM CalImc
WHERE sexo like 'M';

-- ----------------------------------------------------------------
-- RELATORIO Calculadora de gasto energético por atividade praticada
-- -----------------------------------------------------------------

SELECT idUsuario, imc.peso as peso, met.NomeExercicio, calAF.tempo as tempo, calAF.tempo * imc.peso * met.met AS GastoEnergetico
FROM usuario as u
INNER JOIN CalImc imc ON imc.idUsuario_FK = u.idUsuario
INNER JOIN CalAtividadeFisica calAF ON  calAF.idIMC_FK = imc.idIMC
INNER JOIN MET met ON calAF.idMET_FK = met.idMET;

