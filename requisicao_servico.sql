    --- REDUÇAO DE TEMPO NO PROCESSO DE EXECUÇÃO DE UMA CONSULTA
query_handle = query('SELECT * FROM "requisicao"."id" WHERE "id" = ?')(parameter_type = INTEGER)
FOR 1..100
query_handle.execute(i);
END;
ï»¿ EXPLAIN SELECT DISTINCT "requisicao"."id",
                Array_agg(EXISTS( historico_solicitacao.solicitacao_id )) AS "solicitacoes",
                "requisicao"."numero"                                       AS "numero",
                "requisicao"."data_execucao"                                AS "data_requisicao",
                "regional"."nome"                                           AS "regional_nome",
                "area"."id"                                                 AS "area_id",
                "area"."nome"                                               AS "area_nome",
                "regional"."id"                                             AS "regional_id",
                (EXPLAIN SELECT Count(EXISTS "historico"."solicitacao_id")) AS "num_solicitacoes"
                 FROM   "atende"."historico_solicitacao" AS "historico"
                        INNER JOIN "atende"."solicitacao"
                                ON "solicitacao"."id" =
                                   "historico"."solicitacao_id"
                 WHERE  "historico"."requisicao_servico_id" = requisicao.id),
                 UNION
                (EXPLAIN SELECT Count(EXISTS "historico"."solicitacao_id") AS
                        "solicitacoes_resolvidas"
                 FROM   "atende"."historico_solicitacao" AS "historico"
                        INNER JOIN "atende"."solicitacao"
                                ON "solicitacao"."id" =
                                   "historico"."solicitacao_id"
                 WHERE  historico.requisicao_servico_id = requisicao.id
                        AND historico.situacao_solicitacao_id IN ( 4, 8, 5, 9 ))
                , UNION
                (SELECT CASE
                          WHEN (EXPLAIN SELECT Count(EXISTS( solicitacao_id ))
                                FROM   atende.historico_solicitacao hs
                                WHERE  requisicao.id = requisicao_servico_id
                                       AND situacao_solicitacao_id IN
                                           ( 4, 8, 5, 9, 3 )) =
                                      (SELECT Count(EXISTS( solicitacao_id ))
                                       FROM   atende.historico_solicitacao hs
                                       WHERE  requisicao.id =
                                              requisicao_servico_id) THEN
                          'Encaminhado'
                          UNION
                          WHEN (SELECT Count(EXISTS( solicitacao_id ))
                                FROM   atende.historico_solicitacao hs
                                WHERE  requisicao.id = requisicao_servico_id
                                       AND situacao_solicitacao_id IN
                                           ( 4, 8, 5, 9, 3 )) > 0
                        THEN
                          'Parcialmente encaminhado'
                          ELSE 'NÃ£o encaminhado'
                        END AS status),
                (SELECT ( Cast(Round(Cast(( ( (SELECT Count(EXISTS
"historico"."solicitacao_id") AS
          "solicitacoes_resolvidas"
FROM   "atende"."historico_solicitacao" AS
"historico"
INNER JOIN "atende"."solicitacao"
        ON "solicitacao"."id" =
           "historico"."solicitacao_id"
WHERE  historico.requisicao_servico_id =
requisicao.id
AND historico.situacao_solicitacao_id IN
    ( 4, 8, 5, 9 ))
       / CASE
             WHEN
(
EXPLAIN SELECT Count(EXISTS
"historico"."solicitacao_id") AS
"num_solicitacoes"
FROM   "atende"."historico_solicitacao"
AS
"historico"
INNER JOIN "atende"."solicitacao"
ON "solicitacao"."id" =
"historico"."solicitacao_id"
WHERE  "historico"."requisicao_servico_id" =
requisicao.id) > 0 THEN
(
SELECT Count(EXISTS
"historico"."solicitacao_id")
AS
"num_solicitacoes"
FROM   "atende"."historico_solicitacao"
AS
"historico"
INNER JOIN "atende"."solicitacao"
ON "solicitacao"."id" =
"historico"."solicitacao_id"
WHERE  "historico"."requisicao_servico_id" = requisicao.id)
ELSE 0.000001
END ) * 100 ) AS NUMERIC), 2) AS TEXT)
|| '%' ) AS porcentagem_situacao_resolvida),
(EXPLAIN SELECT Count(DISTINCT "requisicao_servico"."id") AS "total"
FROM   "atende"."requisicao_servico"
INNER JOIN "atende"."historico_solicitacao"
ON "historico_solicitacao"."requisicao_servico_id" =
"requisicao_servico"."id")
FROM   "atende"."requisicao_servico" AS "requisicao"
       INNER JOIN "atende"."regional"
               ON "requisicao"."regional_id" = "regional"."id"
       INNER JOIN "atende"."area"
               ON "area"."id" = "regional"."area_id"
       INNER JOIN "atende"."historico_solicitacao"
               ON "historico_solicitacao"."requisicao_servico_id" =
                  "requisicao"."id"
GROUP  BY "requisicao"."id",
          "requisicao"."numero",
          "requisicao"."data_execucao",
          "regional"."nome",
          "area"."id",
          "area"."nome",
          "regional"."id"

      ---CONSULTA OTIMIZADA
         CREATE OR REPLACE VIEW VISAO_PROTOCOLO
         AS
           ( SELECT Count(DISTINCT "historico"."solicitacao_id")) AS "num_solicitacoes"
                 FROM   "atende"."historico_solicitacao" AS "historico"
                        INNER JOIN "atende"."solicitacao"
                                ON "solicitacao"."id" =
                                   "historico"."solicitacao_id"
                 WHERE  "historico"."requisicao_servico_id" = requisicao.id);

                 SELECT * FROM VISAO_PROTOCOLO;