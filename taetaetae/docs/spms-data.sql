/* MEMBERS DATA*/
INSERT INTO   MEMBERS 
( MNAME , EMAIL , TEL , PWD )
VALUES ('홍길동','1','111-1111','1111');

INSERT INTO   MEMBERS 
( MNAME , EMAIL , TEL , PWD )
VALUES ('임꺽정','2','222-2222','1111');

INSERT INTO   MEMBERS 
( MNAME , EMAIL , TEL , PWD )
VALUES ('장보고','3','333-3333','1111');

INSERT INTO   MEMBERS 
( MNAME , EMAIL , TEL , PWD )
VALUES ('장길산','4','444-4444','1111');

INSERT INTO   MEMBERS 
( MNAME , EMAIL , TEL , PWD )
VALUES ('오호라','5','555-5555','1111');

INSERT INTO   MEMBERS 
( MNAME , EMAIL , TEL , PWD )
VALUES ('으차차','6','666-666','1111');

/* PROJECTS DATA*/
INSERT INTO PROJECTS(TITLE,CONTENTS,SDATE,EDATE)
VALUES('프로젝트1','프로젝트1111','2014-1-1','2014-3-20');

INSERT INTO PROJECTS(TITLE,CONTENTS,SDATE,EDATE)
VALUES('프로젝트2','프로젝트2222','2014-2-1','2014-4-20');

INSERT INTO PROJECTS(TITLE,CONTENTS,SDATE,EDATE)
VALUES('프로젝트3','프로젝트3333','2014-3-1','2014-5-20');

INSERT INTO PROJECTS(TITLE,CONTENTS,SDATE,EDATE)
VALUES('프로젝트4','프로젝트4444','2014-4-1','2014-6-20');

INSERT INTO PROJECTS(TITLE,CONTENTS,SDATE,EDATE)
VALUES('프로젝트5','프로젝트5555','2014-5-1','2014-7-20');

INSERT INTO PROJECTS(TITLE,CONTENTS,SDATE,EDATE)
VALUES('프로젝트6','프로젝트6666','2014-6-1','2014-8-20');
/* PRJ_MEMS DATA*/
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(1,1,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(1,2,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(1,3,9);

INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(2,3,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(2,4,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(2,5,9);

INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(3,1,9);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(3,3,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(3,5,1);

INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(4,1,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(4,2,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(4,3,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(4,4,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(4,5,1);

INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(5,1,1);
INSERT INTO PRJ_MEMS(MNO,PNO,ROLE)
VALUES(5,4,9);

/* TASK DATA */
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(1, '작업1001', 1);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(1, '작업1002', 1);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(1, '작업1003', 3);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(1, '작업1004', 5);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(1, '작업1005', 5);
INSERT INTO TASKS(PNO,TITLE) VALUES(1, '작업1006');
INSERT INTO TASKS(PNO,TITLE) VALUES(1, '작업1007');

INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(2, '작업2001', 1);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(2, '작업2002', 4);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(2, '작업2003', 4);

INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(3, '작업3001', 3);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(3, '작업3002', 3);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(3, '작업3003', 4);

INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(4, '작업4001', 2);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(4, '작업4002', 4);

INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(5, '작업5001', 2);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(5, '작업5002', 3);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(5, '작업5003', 3);
INSERT INTO TASKS(PNO,TITLE,MNO) VALUES(5, '작업5004', 4);

/* FEEDS DATA*/
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('11111', NOW(), 1, 1);
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('11111', NOW(), 1, 1);
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('11111', NOW(), 1, 3);

INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('2222', NOW(), 2, 3);
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('22222', NOW(), 2, 3);
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('222222', NOW(), 2, 5);

INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('333', NOW(), 3, 1);
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('3333', NOW(), 3, 1);
INSERT INTO FEEDS(CONTENTS,CDATE,MNO,PNO)
VALUES ('33333', NOW(), 3, 5);