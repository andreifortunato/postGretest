CREATE TABLE TEMPRESALL
( idADMINALL    INTEGER NOT NULL,
 idADMINALL2      INTEGER NOT NULL,
idRH       SERIAL         NOT NULL,
idFIN      SERIAL       NOT NULL,
idLOG      SERIAL       NOT NULL,
idEXT      SERIAL       NOT NULL,
idDIR      SERIAL       NOT NULL,
dRELATORIO SERIAL       NOT NULL, 
iDFISCAL   SERIAL       NOT NULL;
          INSERT INTO TEMPRESA VALUES(233,234,021,025,029,034,037,9032,019),
 
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(idADMINALL),
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(idRH),  
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(idFIN), 
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(idLOG), 
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(idEXT), 
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(idDIR), 
              CONSTRAINT PK_ACESSO1 PRIMARY KEY(dRELATORIO); 
 
		 CREATE TABLE FUNCIONARIO(
                   COD INTEGER NULL PRIMARY KEY,
              ACCESS_EXCLUSIVE varchar(255) not null,
           check (ACCESS_EXCLUSIVE IN ('SUPERVISOR','DIRETOR','FICAL','DIRETOR2'))
);
 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (233, 'DIRETOR'); 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (234, 'DIRETOR2'); 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (021, 'SUPERVISOR'); 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (025, 'SUPERVISOR'); 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (029, 'SUPERVISOR'); 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (034, 'SUPERVISOR'); 
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (037, 'SUPERVISOR'); 												
INSERT INTO FUNCIONARIO (COD, ACCESS_EXCLUSIVE) values (019, 'FISCAL'); 
 ); 					   
											   
											   
											   );
 
CREATE TABLE TRECURSUSH
( idRH                   INTEGER NOT NULL  ,
  sRH                    INTEGER NOT NULL REFERENCES TEMPRESALL(sRH) ON DELETE CASCADE,
  rNOME                  VARCHAR(30),
  rENTREVISTA            VARCHAR(250),
  rRESULTADO             VARCHAR(10) ,
                      CONSTRAINT PK_ACESSORH PRIMARY KEY(idRH),
                      CONSTRAINT PK_ACESSORH FOREIGN KEY(sRH),
 
INSERT INTO TRECURSUSH VALUES(021,'nome 1','entrevista','resultado');
INSERT INTO TRECURSUSH VALUES(022,'nome 2','entrevista','resultado');
INSERT INTO TRECURSUSH VALUES(023,'nome 3','entrevista','resultado');
INSERT INTO TRECURSUSH VALUES(024,'nome 4','entrevista','resultado');

 
 
); 
    CREATE TABLE TFINANCE
( idFINANCE           INTEGER NOT NULL,
  sFINANCE            INTEGER NOT NULL REFERENCES TEMPRESALL(sFINANCE) ON DELETE CASCADE,
  nNOME               VARCHAR(30)  NOT NULL ,
  nBALANCOP           INTEGER NOT NULL,
  nCPAGAR             INTEGER NOT NULL ,
  nREGISTRO           INTEGER NOT NULL,
             CONSTRAINT PK_ACESSOF PRIMARY KEY(idFINANCE),
             CONSTRAINT PK_ACESSOF FOREIGN KEY(sFINANCE),
 
 INSERT INTO TFINANCE VALUES(025,'nome 4',001,000,1010);
 INSERT INTO TFINANCE VALUES(026,'nome 4',002,000,1011);
 INSERT INTO TFINANCE VALUES(027,'nome 4',003,000,1012);
 INSERT INTO TFINANCE VALUES(028,'nome 4',004,000,1013);

 );
CREATE TABLE TLOGIST
( idLOGIST          INTEGER NOT NULL,
  sLOGIST           INTEGER NOT NULL REFERENCES TEMPRESALL(sLOGIST) ON DELETE CASCADE,
  lEXPEDICAO        INTEGER NOT NULL,
  lRECEBIDOS        INTEGER NOT NULL,
  lCANCELADOS       INTEGER NULL ,
                CONSTRAINT PK_ACESSOL PRIMARY KEY(idLOGIST),
                CONSTRAINT PK_ACESSOL FOREIGN KEY(sLOGIST),
 
 INSERT INTO TLOGIST VALUES(029,2100,3100,9100);
 INSERT INTO TLOGIST VALUES(030,2100,3100,9100);
 INSERT INTO TLOGIST VALUES(031,2100,3100,9100);
 INSERT INTO TLOGIST VALUES(032,2100,3100,9100);
 
 );
 
 CREATE TABLE TEXTERNO
( idEXTERNO             INTEGER NOT NULL,
  sEXTERNO              INTEGER NOT NULL REFERENCES TEMPRESALL(sEQUIPE) ON DELETE CASCADE,
  exNOME                VARCHAR(30) NOT NULL,
  exFUNCAO              VARCHAR(15) NOT NULL,
  exSOLICITACAO         VARCHAR(250) NOT NULL,
                    CONSTRAINT PK_ACESSOEX PRIMARY KEY(idEXTERNO),
                    CONSTRAINT PK_ACESSOEX FOREIGN KEY(sEXTERNO),
 
 INSERT INTO TEXTERNO VALUES(033,'nome 4','funcao 1','solicitacao 1');
 INSERT INTO TEXTERNO VALUES(034,'nome 4','funcao 1','solicitacao 2');
 INSERT INTO TEXTERNO VALUES(035,'nome 4','funcao 1','solicitacao 3');
 INSERT INTO TEXTERNO VALUES(036,'nome 4','funcao 1','solicitacao 4');
 
 );
 
 CREATE TABLE TDIRETORIA
( idDIR                 INTEGER NOT NULL,
  dRELATORIO            INTEGER NOT NULL REFERENCES TEMPRESALL(dRELATORIO) ON DELETE CASCADE,
  dNOME                 VARCHAR(30) NOT NULL,
  dDEPARTAMENTO         INTEGER;
                           CONSTRAINT PK_ACESSOD PRIMARY KEY(idDIR),
                           CONSTRAINT PK_ACESSOD FOREIGN KEY(dRELATORIO),
 
 INSERT INTO TDIRETORIA  VALUES(037,9032,'nome 4',008);
 INSERT INTO TDIRETORIA  VALUES(038,9032,'nome 4',010);
 INSERT INTO TDIRETORIA  VALUES(039,9032,'nome 4',012);
 INSERT INTO TDIRETORIA  VALUES(040,9032,'nome 4',013);

 
 
)