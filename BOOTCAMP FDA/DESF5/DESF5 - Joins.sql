use desf5

INSERT INTO tb_pessoa (cod_pessoa, genero, data_nascimento, idade, peso, colesterol, renda_mensal, cod_estado, cod_estado_civil, cod_educacao)
SELECT DISTINCT 
    stg.cod_pessoa, 
    stg.genero, 
    stg.data_nascimento, 
    stg.idade, 
    stg.peso, 
    stg.colesterol, 
    stg.renda_mensal, 
    stg.cod_estado, 
    estciv.cod_estado_civil, 
    edu.cod_educacao
FROM stg_pessoa stg
INNER JOIN tb_estado_civil estciv ON stg.estado_civil = estciv.estado_civil
INNER JOIN tb_educacao edu ON stg.educacao = edu.educacao;


INSERT INTO tb_pesquisa (cod_pessoa, data_pesquisa, cod_preferencia_musical, cod_animal_estimacao, cod_clima, cod_hobby, cod_bebida, cod_atividade_fisica)
SELECT DISTINCT
    stg.cod_pessoa,
    stg.data_pesquisa,
    pref.cod_preferencia_musical,
    anim.cod_animal_estimacao,
    clim.cod_clima,
    hob.cod_hobby,
    beb.cod_bebida,
    ativ.cod_atividade_fisica
FROM stg_pesquisa stg
INNER JOIN tb_preferencia_musical pref ON stg.preferencia_musical = pref.preferencia_musical
INNER JOIN tb_animal_estimacao anim ON stg.animal_estimacao = anim.animal_estimacao
INNER JOIN tb_clima clim ON stg.clima = clim.clima
INNER JOIN tb_hobby hob ON stg.hobby = hob.hobby
INNER JOIN tb_bebida beb ON stg.bebida = beb.bebida
INNER JOIN tb_atividade_fisica ativ ON stg.atividade_fisica = ativ.atividade_fisica;