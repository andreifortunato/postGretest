


 ----Triggers 1.3
CREATE OR REPLACE TRIGGER gerar_protocolo
 BEFORE | AFTER
  UPDATE OF protocolo
 ON atende.solicitacao
 REFERENCING OLD AS protocolo NEW AS :novo.protocolo
 FOR EACH ROW
 WHEN atende.solicitacao = id +1
DECLARE
 protocolo      INTEGER,
 id             INTEGER,
 :novo.protocolo=(TIMESTAMP 00000 +'YYYY+MM+DD HH+MM+SS' + interval '23 hours'),
BEGIN
 IF inserting THEN
 IF id <> id,
 THEN UPDATE atende.solicitacao SET id = id +1
 WHERE protocolo =:novo.protocolo  ;
 ELSE UPDATE atende.solicitacao SET protocolo == protocolo
 WHERE status = 'Encaminhado';
 END IF;

END ;


