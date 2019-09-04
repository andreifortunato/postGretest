


 ----Triggers 1.3
CREATE OR REPLACE TRIGGER gerar_protocolo
 BEFORE | AFTER
  UPDATE OF numero
 ON 'requisicao'.'id'
 REFERENCING OLD AS numero NEW AS :novo.numero
 FOR EACH ROW
 WHEN 'requisicao'.'id'= solicitacoes +1
DECLARE
 numero      INTEGER,
 solicitacao INTEGER,
 :novo.numero=(timestamp 'YYYY+MM+DD HH+MM+SS' + interval '23 hours'),
BEGIN
 IF inserting THEN
 IF solicitacoes <> solicitacoes,
 THEN UPDATE 'requisicao'.'id' SET solicitacao = solicitacao +1
 WHERE numero =:novo.numero  ;
 ELSE UPDATE 'requisicao'.'id' SET numero == numero
 WHERE status = 'Encaminhado';
 END IF;

END ;


CREATE [ OR REPLACE ] FUNCTION
name ( [ [ argmode ] [ argname ] argtype [, ...] ] )
[ RETURNS integer ]
{ LANGUAGE postgres
| IMMUTABLE | STABLE | VOLATILE
| CALLED ON NULL INPUT | RETURNS NULL ON NULL INPUT | STRICT
| [ EXTERNAL ] SECURITY INVOKER | [ EXTERNAL ] SECURITY DEFINER
| AS 'definition'
| AS 'obj_file', 'link_symbol'
} ...
[ WITH ( attribute [, ...] ) ]