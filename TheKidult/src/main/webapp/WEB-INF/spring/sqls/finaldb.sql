
DROP TABLE MEMBER;

CREATE TABLE MEMBER(

	MEMBER_ID 			VARCHAR2(100) 	PRIMARY KEY,
	MEMBER_PW 			VARCHAR2(100) 	NOT NULL,
	MEMBER_NAME 		VARCHAR2(100) 	NOT NULL,
	MEMBER_BIRTH		VARCHAR2(500)	NOT NULL,
	MEMBER_ADDR 		VARCHAR2(500) 	NOT NULL,
	MEMBER_PHONE 		VARCHAR2(500) 	NOT NULL,
	MEMBER_EMAIL 		VARCHAR2(500) 	NOT NULL,
	MEMBER_ENABLED 		VARCHAR2(2) 	NOT NULL,
	MEMBER_GENDER		VARCHAR2(10)	NOT NULL,
	MEMBER_ROLE			VARCHAR2(100)	NOT NULL,
	MEMBER_KAKAO		VARCHAR2(2)		NOT NULL,
	MEMBER_REGDATE		DATE			NOT NULL,
	MEMBER_PWEVENT		DATE			NOT NULL,
	
	CONSTRAINT CHECK_MEMBER_ENABLED CHECK(MEMBER_ENABLED IN('Y','N')),
	CONSTRAINT CHECK_MEMBER_KAKAO CHECK(MEMBER_KAKAO IN('Y','N'))
);

SELECT * FROM MEMBER

UPDATE MEMBER SET MEMBER_ROLE = 'ADMIN' WHERE MEMBER_ID = 'pooo3406'
UPDATE MEMBER SET MEMBER_ENABLED = 'Y' WHERE MEMBER_ID = 'pooo3406'

INSERT INTO MEMBER VALUES('admin', '0000', 'admin', SYSDATE, '경기도', '010-1234-5678', 'email@email.com', 'Y', 'man', 'ADMIN', 'N', SYSDATE, SYSDATE)
INSERT INTO MEMBER VALUES('user1', '0000', 'user1', SYSDATE, '경기도', '010-1234-5678', 'email1@email.com', 'Y', 'man', 'user', 'N',SYSDATE, SYSDATE)
INSERT INTO MEMBER VALUES('user2', '0000', 'user2', SYSDATE, '경기도', '010-1234-5678', 'email2@email.com', 'N', 'man', 'user', 'N',SYSDATE, SYSDATE)
INSERT INTO MEMBER VALUES('user3', '0000', 'user3', SYSDATE, '경기도', '010-1234-5678', 'email3@email.com', 'N', 'man', 'user', 'Y',SYSDATE, SYSDATE)
INSERT INTO MEMBER VALUES('user4', '0000', 'user4', SYSDATE, '경기도', '010-1234-5678', 'email4@email.com', 'Y', 'man', 'user', 'Y',SYSDATE, SYSDATE)
DELETE FROM MEMBER WHERE MEMBER_ID='user'

INSERT INTO MEMBER VALUES('admin', '0000', 'admin', SYSDATE, '경기도', '010-1234-5678', 'email@email.com', 'Y', 'man', 'ADMIN', 'N',SYSDATE, SYSDATE)
DELETE FROM MEMBER WHERE MEMBER_ID='user'

SELECT MEMBER_ID
FROM MEMBER
WHERE (SYSDATE - MEMBER_PWEVENT) > 10/24/60/60 /*(10초)*/
-----------------------------------------------------------------------------------------

DROP TABLE CATEGORY;
DROP SEQUENCE CATEGORYSEQ;

CREATE SEQUENCE CATEGORYSEQ;
CREATE TABLE CATEGORY(
	CATEGORY_NO				NUMBER				PRIMARY KEY,
	CATEGORY_NAME			VARCHAR2(500)		NOT NULL
);

SELECT * FROM CATEGORY

INSERT INTO CATEGORY VALUES(1, '피규어or건담')
INSERT INTO CATEGORY VALUES(2, '무선조종 R/C')
------------------------------------------------------------------------------------------

DROP TABLE PRODUCT;
DROP SEQUENCE PRODUCTSEQ;

CREATE SEQUENCE PRODUCTSEQ;	
CREATE TABLE PRODUCT(
	CATEGORY_NO			NUMBER				NOT NULL,
	PRODUCT_NO			NUMBER				PRIMARY KEY,
	PRODUCT_NAME		VARCHAR2(500)		NOT NULL,
	PRODUCT_STOCK		NUMBER				NOT NULL,
	PRODUCT_DETAILS		VARCHAR2(2000)		NOT NULL,
	PRODUCT_PRICE		NUMBER				NOT NULL,
	PRODUCT_IMG			VARCHAR2(2000)		NOT NULL,
	
	CONSTRAINT FK_PRODUCT_CATEGORY_NO FOREIGN KEY(CATEGORY_NO)
	REFERENCES CATEGORY(CATEGORY_NO)
);

SELECT * FROM PRODUCT ORDER BY PRODUCT_NO ASC
UPDATE PRODUCT SET PRODUCT_PRICE = 1000000 WHERE PRODUCT_PRICE>1000000 
INSERT INTO PRODUCT VALUES(999, 990, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 991, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 992, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 993, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 994, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 995, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 996, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 997, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 998, 'TEST', 10, 'TEST DB', 10000)
INSERT INTO PRODUCT VALUES(999, 999, 'TEST', 10, 'TEST DB', 10000)

DELETE PRODUCT


--------------------------------------------------------------------------------------------

DROP TABLE PAYMENT;
DROP SEQUENCE PAYMENTSEQ;

CREATE SEQUENCE PAYMENTSEQ;
CREATE TABLE PAYMENT(
		PAYMENT_NO				NUMBER				PRIMARY KEY,
		PAYMENT_GROUPNO			NUMBER				NOT NULL,
		MEMBER_ID				VARCHAR2(100)		NOT NULL,
		PRODUCT_NO				NUMBER				NOT NULL,
		PAYMENT_NAME			VARCHAR2(500)		NOT NULL,
		PAYMENT_PRICE			NUMBER				NOT NULL,
		PAYMENT_DATE			DATE				NOT NULL,
		PAYMENT_ADDR			VARCHAR2(500)		NOT NULL,
		
		CONSTRAINT FK_PAYMENT_MEMBER_ID FOREIGN KEY(MEMBER_ID)
		REFERENCES MEMBER(MEMBER_ID),
		CONSTRAINT FK_PAYMENT_PRODUCT_NO FOREIGN KEY(PRODUCT_NO)
		REFERENCES PRODUCT(PRODUCT_NO)
);

SELECT * FROM PAYMENT

------------------------------------------------------------------------------------------------

DROP TABLE BASKET;
DROP SEQUENCE BASKETSEQ;

CREATE SEQUENCE BASKETSEQ;
CREATE TABLE BASKET(
	MEMBER_ID				VARCHAR2(100)		NOT NULL,
	PRODUCT_NO				NUMBER				NOT NULL,
	BASKET_NO				NUMBER				PRIMARY KEY,
	BASKET_QUANTITY			NUMBER				NOT NULL,
	
	CONSTRAINT FK_BASKET_MEMBER_ID FOREIGN KEY(MEMBER_ID)
	REFERENCES MEMBER(MEMBER_ID),
	CONSTRAINT FK_BASKET_PRODUCT_NO FOREIGN KEY(PRODUCT_NO)
	REFERENCES PRODUCT(PRODUCT_NO)
);

SELECT * FROM BASKET

----------------------------------------------------------------------------------------------

DROP TABLE YOUTUBE;
DROP SEQUENCE YOUTUBESEQ;

CREATE SEQUENCE YOUTUBESEQ;
CREATE TABLE YOUTUBE(
	YOUTUBE_NO			NUMBER				PRIMARY KEY,
	YOUTUBE_URL			VARCHAR2(2000)		NOT NULL
);

SELECT * FROM YOUTUBE
------------------------------------------------------------------------------------------------

DROP TABLE OTHER;

CREATE TABLE OTHER(
	PRODUCT_NO			NUMBER					NOT NULL,
	OTHER_SITE			VARCHAR2(500)			NOT NULL,
	OTHER_PRICE			NUMBER					NOT NULL,
	
	CONSTRAINT FK_OTHER_PRODUCT_NO FOREIGN KEY(PRODUCT_NO)
	REFERENCES PRODUCT(PRODUCT_NO)
);

SELECT * FROM OTHER

-----------------------------------------------------------------------------------------------

DROP SEQUENCE CHATTINGSEQ;
DROP TABLE CHATTING;

CREATE SEQUENCE CHATTINGSEQ;
CREATE TABLE CHATTING(
	CHATTING_NO				NUMBER			PRIMARY KEY,
	CHATTING_ADMIN			VARCHAR2(2)		NOT NULL,
	CHATTING_USER			VARCHAR2(2)		NOT NULL
);

SELECT * FROM CHATTING

----------------------------------------------------------------------------------------------

DROP SEQUENCE NOTESEQ;
DROP TABLE NOTE;

CREATE SEQUENCE NOTESEQ;
CREATE TABLE NOTE(
	NOTE_NO				NUMBER				PRIMARY KEY,
	NOTE_CONTENT		VARCHAR2(2000)		NOT NULL,
	NOTE_SEND			VARCHAR2(100)		NOT NULL,
	NOTE_GET			VARCHAR2(100)		NOT NULL,
	NOTE_DATE			DATE				NOT NULL,
	NOTE_CONFIRM		VARCHAR2(2)			NOT NULL,
	
	CONSTRAINT FK_NOTE_NOTE_SEND FOREIGN KEY(NOTE_SEND)
	REFERENCES MEMBER(MEMBER_ID),
	CONSTRAINT FK_NOTE_NOTE_GET FOREIGN KEY(NOTE_GET)
	REFERENCES MEMBER(MEMBER_ID)
);

SELECT * FROM NOTE


----------------------------------------------------------------------------------------------------

DROP SEQUENCE USEDPRODUCTSEQ;
DROP TABLE USEDPRODUCT;

CREATE SEQUENCE USEDPRODUCTSEQ;
CREATE TABLE USEDPRODUCT(
	USEDPRODUCT_NO			NUMBER			PRIMARY KEY,
	USEDPRODUCT_TITLE		VARCHAR2(100)	NOT NULL,
	USEDPRODUCT_CONTENT		VARCHAR2(2000)	NOT NULL,
	USEDPRODUCT_DATE		DATE			NOT NULL,
	CATEGORY_NO				NUMBER			NOT NULL,
	MEMBER_ID				VARCHAR2(100)	NOT NULL,
	USEDPRODUCT_VIEWS		NUMBER			NOT NULL,
	
	CONSTRAINT FK_USEDPRODUCT_CATEGORY_NO FOREIGN KEY(CATEGORY_NO)
	REFERENCES CATEGORY(CATEGORY_NO),
	CONSTRAINT FK_USEDPRODUCT_MEMBER_ID FOREIGN KEY(MEMBER_ID)
	REFERENCES MEMBER(MEMBER_ID)
);


SELECT * FROM USEDPRODUCT

INSERT INTO USEDPRODUCT VALUES(999, 'TEST1', 'TESTTESTTESTTEST', SYSDATE, 999, 'user', 0)
DELETE FROM USEDPRODUCT
SELECT CATEGORY_NAME, USEDPRODUCT_NO, USEDPRODUCT_TITLE, USEDPRODUCT_CONTENT, USEDPRODUCT_DATE, MEMBER_ID, USEDPRODUCT_VIEWS
FROM USEDPRODUCT JOIN CATEGORY USING(CATEGORY_NO)


----------------------------------------------------------------------------------------------------

DROP TABLE FULLCAL;
DROP SEQUENCE FULLID_SEQ;

CREATE SEQUENCE FULLID_SEQ;
CREATE TABLE FULLCAL(
	FULLID		NUMBER			PRIMARY KEY,
	FULLTITLE	VARCHAR2(100),
	FULLSTART	VARCHAR2(50)	NOT NULL,
	FULLEND		VARCHAR2(50),
	FULLDESCRIPTION	VARCHAR2(2000)
);

INSERT INTO FULLCAL
VALUES(FULLID_SEQ.NEXTVAL,'TEST','2019-10-07','2019-10-08','TTTTTTTTTTTTTTTEST');



INSERT INTO FULLCAL
VALUES(FULLID_SEQ.NEXTVAL,'TEST02','2019-10-01','2019-10-04','TTTTTTTTTTTTTTTEST22222222222');

SELECT *
FROM FULLCAL;

DELETE FROM FULLCAL;


COMMIT;