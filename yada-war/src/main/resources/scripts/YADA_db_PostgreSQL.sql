﻿CREATE USER yada PASSWORD 'yada';

CREATE DATABASE YADA OWNER=yada;

connect yada yada;
GRANT ALL PRIVILEGES ON DATABASE yada TO yada WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO yada;


DROP TABLE IF EXISTS YADA_QUERY;
CREATE TABLE IF NOT EXISTS YADA_QUERY
(	
	QNAME        VARCHAR(255)  NOT NULL, 
	QUERY        VARCHAR(4000) NOT NULL, 
	APP          VARCHAR(20), 
	CREATED      TIMESTAMP,
	MODIFIED     TIMESTAMP, 
	CREATED_BY   VARCHAR(20), 
	MODIFIED_BY  VARCHAR(20), 
	LAST_ACCESS  TIMESTAMP, 
	ACCESS_COUNT INT DEFAULT 0,
	COMMENTS     VARCHAR(4000)
);

DROP TABLE IF EXISTS YADA_QUERY_CONF;
CREATE TABLE IF NOT EXISTS YADA_QUERY_CONF 
(	
  	APP     VARCHAR(20)   NOT NULL, 
	SOURCE  VARCHAR(4000) NOT NULL, 
	VERSION VARCHAR(20)
);

DROP TABLE IF EXISTS YADA_PARAM;
CREATE TABLE IF NOT EXISTS YADA_PARAM 
(	
  ID     VARCHAR(255),
	TARGET VARCHAR(20)   NOT NULL, 
	NAME   VARCHAR(20)   NOT NULL, 
	VALUE  VARCHAR(4000) NOT NULL, 
	RULE   VARCHAR(1)    DEFAULT 1
);
   
DROP TABLE IF EXISTS YADA.YADA_A11N;
CREATE TABLE IF NOT EXISTS YADA.YADA_A11N 
( 
  TARGET VARCHAR(500), 
  POLICY VARCHAR(1), 
  QNAME  VARCHAR(2000), 
  TYPE   VARCHAR(9)
);

DROP TABLE IF EXISTS YADA.YADA_TEST;
CREATE TABLE IF NOT EXISTS YADA.YADA_TEST 
(	
	COL1 VARCHAR(3), 
	COL2 INT,
	COL3 DECIMAL(2,1), 
	COL4 DATE,
	COL5 TIMESTAMP,
	TOKEN VARCHAR(8) DEFAULT 'YADA'
);

DROP TABLE IF EXISTS YADA.YADA_PROP;
CREATE TABLE IF NOT EXISTS YADA.YADA_PROP
( 
  TARGET VARCHAR(500), 
  NAME VARCHAR(500),
  VALUE VARCHAR(4000)
);

INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('YADA','java:comp/env/jdbc/yada',null);
INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('YADATEST','java:comp/env/jdbc/yada',null);
INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('QGO','http://www.ebi.ac.uk/QuickGO/GTerm?',null);
INSERT into YADA_QUERY_CONF (APP,SOURCE,VERSION) values ('YADAFSIN','file:///io/in',null);
INSERT into YADA_QUERY (qname,query,created_by,app) VALUES ('YADA default','select ''YADA is alive''','YADABOT','YADA');
