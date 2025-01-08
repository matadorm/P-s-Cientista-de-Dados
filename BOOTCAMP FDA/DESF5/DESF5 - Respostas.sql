
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#1 -  Qual é o animal de estimação de menor preferência entre as mulheres? CERTO, EU ERREI, ERA COUNT E NÃO SUM
SELECT anim.animal_estimacao, COUNT(pes.cod_animal_estimacao) AS total_animals
FROM tb_pesquisa pes
JOIN tb_animal_estimacao anim ON pes.cod_animal_estimacao = anim.cod_animal_estimacao
JOIN tb_pessoa p ON pes.cod_pessoa = p.cod_pessoa
WHERE p.genero = 'Feminino'
GROUP BY anim.animal_estimacao
ORDER BY total_animals ASC
LIMIT 1;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#2 - Qual é a média de colesterol para as pessoas que praticam atividade física todos os dias? TÁ CERTOOOOOOOOO PORRA
SELECT AVG(p.colesterol) AS mean_colesterol, ativ.atividade_fisica
FROM tb_pessoa p
JOIN tb_pesquisa pes ON p.cod_pessoa = pes.cod_pessoa
JOIN tb_atividade_fisica ativ ON pes.cod_atividade_fisica = ativ.cod_atividade_fisica
WHERE ativ.atividade_fisica = 'Diária'
GROUP BY ativ.atividade_fisica;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#3 - Qual é a preferência musical de maior sucesso entre as pessoas casadas? CERTO, EU ERREI, ERA COUNT E NÃO SUM
SELECT COUNT(pes.cod_preferencia_musical) as total_pref_musical, pref.preferencia_musical, estciv.estado_civil
FROM tb_pesquisa pes
JOIN tb_preferencia_musical pref ON pes.cod_preferencia_musical = pref.cod_preferencia_musical
JOIN tb_pessoa p ON pes.cod_pessoa = p.cod_pessoa
JOIN tb_estado_civil estciv ON p.cod_estado_civil = estciv.cod_estado_civil
WHERE estciv.estado_civil = 'Casado'
GROUP BY pref.preferencia_musical, estciv.estado_civil
ORDER BY total_pref_musical DESC
LIMIT 1;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#4 - Qual é a média de idade dos homens que têm preferência por chá e clima frio? CERTO
SELECT AVG(p.idade) as mean_idade, beb.bebida, clim.clima, p.genero
FROM tb_pessoa p
JOIN tb_pesquisa pes ON p.cod_pessoa = pes.cod_pessoa
JOIN tb_clima clim ON pes.cod_clima = clim.cod_clima
JOIN tb_bebida beb ON pes.cod_bebida = beb.cod_bebida
WHERE p.genero = 'Masculino'
	AND clim.clima = 'frio'
    AND beb.bebida = 'Chá'
GROUP BY beb.bebida, clim.clima, p.genero;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#5 - Quantas pessoas com nível de educação "Graduação" têm uma renda mensal superior a R$5.000? CERTO
SELECT COUNT(p.cod_educacao) AS total_edu, edu.educacao, p.renda_mensal
FROM tb_pessoa p
JOIN tb_educacao edu ON p.cod_educacao = edu.cod_educacao
WHERE educacao = 'Graduação'
	AND p.renda_mensal = '> 5000'
GROUP BY edu.educacao, p.renda_mensal;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#6 -  Qual é a média de colesterol das pessoas casadas que vivem no Sudeste? CERTO
SELECT AVG(p.colesterol) AS mean_colesterol, est.regiao, estciv.estado_civil
FROM tb_pessoa p
JOIN tb_estado_civil estciv ON p.cod_estado_civil = estciv.cod_estado_civil
JOIN tb_estado est ON p.cod_estado = est.cod_estado
WHERE est.regiao = 'Sudeste'
	AND estciv.estado_civil = 'Casado'
GROUP BY est.regiao, estciv.estado_civil;

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
#7 - Qual o hobby de maior preferência entre as mulheres que possuem mais de 35 anos? ERRADO
SELECT hob.hobby, COUNT(hob.cod_hobby) AS total_hobby
FROM tb_pesquisa pes
JOIN tb_pessoa p ON pes.cod_pessoa = p.cod_pessoa
JOIN tb_hobby hob ON pes.cod_hobby = hob.cod_hobby
WHERE p.idade > 35
	AND p.genero = 'Feminino'
GROUP BY hob.hobby
ORDER BY total_hobby DESC;