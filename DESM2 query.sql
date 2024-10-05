-- Active: 1715448059778@@127.0.0.1@3306@coleta_desm2

select * from tb_medico

select * from tb_estado

select * from tb_colaborador

#Qual é a idade média dos colaboradores do sexo feminino que estão solteiras?

create TEMPORARY TABLE tb_idade
select cod_colaborador, data_nascimento
    ,TIMESTAMPDIFF(YEAR, data_nascimento, NOW()) AS idade from tb_colaborador;


SELECT AVG(i.idade) AS idade_media
FROM tb_idade i
JOIN tb_colaborador col ON i.cod_colaborador = col.cod_colaborador
WHERE col.sexo_colaborador = 'Feminino' AND col.cod_estado_civil = 3;

SELECT AVG(tb_idade.idade) AS idade_media
FROM tb_idade
JOIN tb_colaborador ON tb_idade.cod_colaborador = tb_colaborador.cod_colaborador
WHERE tb_colaborador.sexo_colaborador = 'Feminino' AND tb_colaborador.cod_estado_civil = 3;

#Qual é o motivo de licença que foi menos frequentemente solicitado por mulheres com mais de 35 anos?

SELECT ml.cod_motivo_licenca, COUNT(*) AS quantidade
FROM tb_processamento_licenca ml
JOIN tb_idade i ON ml.cod_colaborador = i.cod_colaborador
JOIN tb_colaborador col ON ml.cod_colaborador = col.cod_colaborador
WHERE col.sexo_colaborador = 'Feminino' AND i.idade > 35
GROUP BY ml.cod_motivo_licenca
ORDER BY quantidade ASC
LIMIT 1;

#Dentre a lista abaixo, escolha o médico que atendeu o maior número de colaboradores do estado de Pernambuco?

SELECT med.cod_medico, COUNT(*) AS numero_atendimentos
FROM tb_colaborador col
JOIN tb_processamento_licenca med ON col.cod_colaborador = med.cod_colaborador
WHERE col.cod_estado = 1
GROUP BY med.cod_medico
ORDER BY numero_atendimentos DESC
LIMIT 5;

#Qual estado tem o maior número de pessoas com ensino Fundamental que têm a leitura como hobbie?

#tb_colaborador: colaborador, escolaridade, hobbie

select * from tb_escolaridade

select * from tb_hobbie

select col.cod_estado, COUNT(*) as maior_num
from tb_colaborador col
WHERE cod_escolaridade =  3 and cod_hobbie = 4
GROUP BY col.cod_estado
ORDER BY maior_num DESC
limit 5;

select * from tb_estado


#5- Qual é o número de pessoas com ensino superior que são naturais ou pertencem ao estado de Minas Gerais?

#tb_colaborador: escolaridade, estado
select col.cod_escolaridade, count(*) as numpessoas
from tb_colaborador col
where cod_escolaridade = 1 and cod_estado = 15
GROUP BY cod_escolaridade
ORDER BY numpessoas

SELECT * from tb_escolaridade

SELECT * FROM tb_estado

#Calcule a média de filhos entre todas as pessoas atendidas pelo Dr. Lessa e assinale a alternativa CORRETA.

#tb_colaborador: filhos, sexo
#tb_processamento_licenca: medico

select avg(col.qtd_filhos) as mediafilhos
from tb_colaborador col
JOIN tb_processamento_licenca med ON col.cod_colaborador = med.cod_colaborador
WHERE cod_medico = 20 AND sexo_colaborador = 'Masculino'

select avg(col.qtd_filhos) as mediafilhos
from tb_colaborador col
JOIN tb_processamento_licenca med ON col.cod_colaborador = med.cod_colaborador
WHERE cod_medico = 20 AND sexo_colaborador = 'Feminino'

SELECT * FROM tb_medico

#7 - Qual colaborador possui o maior salário na base de dados?
select salario, cod_colaborador 
from tb_colaborador
ORDER BY salario DESC

SELECT cod_colaborador, nome_colaborador from tb_colaborador WHERE cod_colaborador = 873

#Qual estado apresenta a menor média salarial entre os colaboradores?

#tb_colaborador: salario, estado, colaborador

SELECT cod_estado, AVG(salario) as medida_salarial
from tb_colaborador
GROUP BY cod_estado

SELECT * from tb_estado

# Qual licença teve a menor média de duração entre os colaboradores?
SELECT cod_motivo_licenca lic, avg(lic.duracao_licenca) as media_licenca
from tb_processamento_licenca lic
GROUP BY cod_motivo_licenca
ORDER BY media_licenca

select * from tb_motivo_licenca 

# Qual especialidade realizou o maior número de atendimentos?
select med.cod_especialidade, COUNT(*) as atendimentos
from tb_processamento_licenca lic, tb_especialidade esp
join tb_medico med on lic.cod_medico = med.cod_medico
JOIN tb_especialidade on med.cod_especialidade = tb_especialidade.cod_especialidade
GROUP BY med.cod_especialidade
ORDER BY atendimentos DESC


SELECT esp.cod_especialidade, esp.especialidade, COUNT(*) AS atendimentos
FROM tb_processamento_licenca lic
JOIN tb_medico med ON lic.cod_medico = med.cod_medico
JOIN tb_especialidade esp ON med.cod_especialidade = esp.cod_especialidade
GROUP BY esp.cod_especialidade
ORDER BY atendimentos DESC;