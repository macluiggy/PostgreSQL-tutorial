create table tablea (id integer, name text);

insert into
    tablea (id, name)
values
    (1, 'ax');

insert into
    tablea (id, name)
values
    (1, 'bx');

select
    *
from
    tablea;

delete from
    tablea;

create table tableb (id integer, name text);

insert into
    tableb (id, name)
values
    (1, 'ay');

insert into
    tableb (id, name)
values
    (1, 'by');

select
    *
from
    tableb;

delete from
    tableb;

select
    *
from
    tablea
    inner join tableb on tablea.id = tableb.id;

(
    SELECT
        json_agg(
            json_build_object(
                'id_catalogo_tabla',
                A.id_catalogo_tabla,
                'grupo_catalogo',
                A.id_grupo_catalogo,
                'tipo_catalogo',
                A.tipo_catalogo,
                'descripcion',
                A.descripcion
            )
        )
    FROM
        catastro.catalogo_tabla A
    where
        A.tipo_catalogo = 'G'
        and A.estado_registro = true
        and estado = 1
);

select
    cf.id_item as "num_elemento",
    cf.descripcion,
    cg.descripcion as tipo_valor,
    cf.valor,
    catastro.fx_cat_valor(cf.id_catalogo_tabla, cf.id_item) as items
FROM
    catastro.catalogo_factor cf
    JOIN catastro.catalogo_general cg on cg.id_item = cf.tipo_valor
    -- AND cg.id_catalogo_tabla = cast(
    --     catastro.fn_recupera_parametro_catastro('||chr(39)||' + 'id_origen_lindero' + '|| chr(39)||') as int
    -- )
    AND cg.estado_registro = true
WHERE
    cf.estado_registro = true;

select * from "CATASTRO_DAULE".seguridad.proceso where metodo in('catalogo_general.select', 'catalogo_general.grid');