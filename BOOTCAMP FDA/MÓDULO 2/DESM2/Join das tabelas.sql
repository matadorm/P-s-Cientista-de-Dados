use coleta_desm2;
select * from stg_completo;
select * from tb_especialidade;

insert into tb_medico (nome_medico, cod_especialidade)
(
	select distinct nome_medico, esp.cod_especialidade
	from stg_completo stg
    inner join tb_especialidade esp on esp.especialidade = stg.especialidade
);
--------------------------------------------------------------------
use coleta_desm2;
select * from stg_completo;
select * from tb_estado;
select * from tb_estado_civil;
select * from tb_escolaridade;
select * from tb_hobbie;

insert into tb_colaborador (cod_colaborador, nome_colaborador, data_nascimento, sexo_colaborador, salario, qtd_filhos, possui_pet, cod_estado_civil, cod_escolaridade, cod_hobbie,
			cod_estado)
(
	select distinct stg.cod_colaborador, stg.nome_colaborador, stg.data_nascimento, stg.sexo_colaborador, stg.salario, stg.qtd_filhos, stg.possui_pet, estciv.cod_estado_civil, esco.cod_escolaridade,
					hob.cod_hobbie, est.cod_estado
	from stg_completo as stg
    inner join tb_estado est on est.estado = stg.estado_colaborador
    inner join tb_estado_civil estciv on estciv.estado_civil = stg.estado_civil
    inner join tb_escolaridade esco on esco.escolaridade = stg.escolaridade
    inner join tb_hobbie hob on hob.hobbie = stg.hobbie
);

--------------------------------------------------------------------
use coleta_desm2;
select * from stg_completo;
select * from tb_medico;
select * from tb_motivo_licenca;
select * from tb_colaborador;

insert into tb_processamento_licenca (data_processamento, inicio_licenca, fim_licenca, duracao_licenca, cod_medico, cod_motivo_licenca, cod_colaborador)
(
	select distinct stg.data_processamento, stg.inicio_licenca, stg.fim_licenca, stg.duracao_licenca, med.cod_medico, motiv.cod_motivo_licenca, col.cod_colaborador
    
	from stg_completo as stg
    inner join tb_medico med on med.nome_medico = stg.nome_medico
    inner join tb_motivo_licenca motiv on motiv.motivo_licenca = stg.motivo_licenca
    inner join tb_colaborador col on col.nome_colaborador = stg.nome_colaborador
);