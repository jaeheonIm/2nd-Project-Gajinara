CREATE TABLE QNA (
    QNA_IDX NUMBER(10),
    ID VARCHAR2(20),
    TITLE VARCHAR2(100),
    CONTENT VARCHAR2(4000),
    REGDATE DATE DEFAULT SYSDATE,
    IMG VARCHAR2(1000),
    HIT NUMBER(10),
    CC NUMBER(10)
);


CREATE SEQUENCE QNA_SEQ
INCREMENT BY 1
START WITH 1
NOCACHE;

insert into QNA
       (QNA_IDX, ID, TITLE, CONTENT, REGDATE, IMG ,HIT, CC)
values (QNA_SEQ.nextval, 'TEST1', '제목', '내용'
         ,sysdate, '이미지', 0, 0);

COMMIT;