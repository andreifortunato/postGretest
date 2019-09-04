CREATE TABLE TEMPRESA
( idADMINB INTEGER NOT NULL,
idSETOR SERIAL INTEGER NOT NULL,
idNUCLEO SERIAL INTEGER NOT NULL,
idEQUIPE SERIAL INTEGER NOT NULL,

 PRIMARY KEY(idADMINB),
 FOREIGN KEY(idSETOR)  REFERENCES TSETOR(idSETOR),
 FOREIGN KEY(idNUCLEO) REFERENCES TNUCLEO(idNUCLEO),
 FOREIGN KEY(idEQUIPE)REFERENCES TEQUIPE(idEQUIPE),
 
 
);CREATE TABLE TSETOR
( idSETOR INTEGER NOT NULL  ,
  sSETOR INTEGER NOT NULL REFERENCES TEMPRESA(sSETOR) ON DELETE CASCADE,
  sNOME VARCHAR2(30),
  sTITULO VARCHAR(10),
  sCABECALHO VARCHAR(50) ,
 PRIMARY KEY(idSETOR)
 
 INSERT INTO TSETOR VALUES();
INSERT INTO TSETOR VALUES();
INSERT INTO TSETOR VALUES();
INSERT INTO TSETOR VALUES();

 
 
);CREATE TABLE TNUCLEO
( idNUCLEO INTEGER NOT NULL,
  sNUCLEO INTEGER NOT NULL REFERENCES TEMPRESA(sNUCLEO) ON DELETE CASCADE,
  nNOME VARCHAR2(15) NOT NULL ,
  nESTADO INTEGER NOT NULL,
  nBAIRRO VARCHAR(10) NOT NULL ,
  nLOGRADOURO VARCHAR(10)
 PRIMARY KEY(idNUCLEO)
 
 INSERT INTO TNUCLEO VALUES();
INSERT INTO TNUCLEO VALUES();
INSERT INTO TNUCLEO VALUES();
INSERT INTO TNUCLEO VALUES();

 
 
);CREATE TABLE TEQUIPE
( idEQUIPE INTEGER NOT NULL,
  sEQUIPE INTEGER NOT NULL REFERENCES TEMPRESA(sEQUIPE) ON DELETE CASCADE,
  eNOME VARCHAR2 NOT NULL(10),
 INTEGER,
 VARCHAR(10) ,
 PRIMARY KEY(idEQUIPE)
 
 INSERT INTO TEQUIPE VALUES();
INSERT INTO TEQUIPE VALUES();
INSERT INTO TEQUIPE VALUES();
INSERT INTO TEQUIPE VALUES();

 
 
)