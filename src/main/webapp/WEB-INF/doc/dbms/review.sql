1. ���̺� ����
DROP TABLE review;
DROP TABLE rgood;
DROP TABLE reply;
DROP TABLE Category;

SELECT *FROM Category;
SELECT review_file, review_thumb FROM review WHERE review_no=4;

SELECT review_good FROM review;

SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
                  m.member_nickname, r.review_file, p.product_no, p.product_name, p.product_price, p.product_img
      FROM review r, member m, product p 
      WHERE r.category_no=1 AND r.member_no = m.member_no AND r.product_no=p.product_no
      
      
SELECT review_no, review_title, review_thumb, review_grade, review_good, review_rdate, category_no, review_reply_cnt,
                  member_nickname, review_file, product_no, product_name, product_price, product_img, rownum as r
                  FROM (
                  SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, r.review_reply_cnt,
                                  m.member_nickname, r.review_file, p.product_no, p.product_name, p.product_price, p.product_img
                      FROM review r, member m, product p 
                        WHERE r.category_no=1 AND r.member_no = m.member_no 
                        AND r.product_no=p.product_no                                                   
                      ORDER BY r.review_no DESC
                      )
                      
                      
UPDATE review
            SET review_title='hahaha', review_content='eeee',
            review_thumb='a', review_file='b', review_size=3
            WHERE review_no=5
            
            DELETE 
            
            
SELECT review_no, review_file, review_thumb FROM REVIEW;
    INSERT INTO review_reply(review_reply_no,review_no, 
    member_no, review_reply_content, review_reply_rdate) 
    VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
    FROM review_reply), 4, 2, '�������� �����Ұſ��� �ñ��߾��µ� ����ƾ�� �����غ��Կ�! �� �����ؿ�', sysdate)

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE review(
		review_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		product_no                    		NUMBER(10)		 NOT NULL,
		member_no                     		NUMBER(10)		 NOT NULL,
		review_title                  		VARCHAR2(100)		 NOT NULL,
		review_content                		VARCHAR2(500)		 NOT NULL,
		review_thumb                  		VARCHAR2(500)		 NULL,
		review_file                   		VARCHAR2(500)		 NULL,
		review_size                   		VARCHAR2(1000)		 NULL,
		review_grade                  		NUMBER(5)		 NOT NULL,
		review_good                   		NUMBER(10)		 DEFAULT 0		 NULL,
		review_cnt                    		NUMBER(10)		 DEFAULT 0		 NULL,
		review_reply_cnt              		NUMBER(10)		 DEFAULT 0		 NULL,
		review_rdate                  		DATE		 NULL,
		review_visible                		CHAR(1)		 NULL,
		category_no                   		NUMBER(10)		NOT NULL,
		pet_no																NUMBER NULL
		FOREIGN KEY (product_no) REFERENCES product (product_no),
  FOREIGN KEY (category_no) REFERENCES Category (category_no),
  FOREIGN KEY (pet_no) REFERENCES pet (pet_no)
);
ALTER TABLE review ADD FOREIGN KEY (pet_no) REFERENCES pet(pet_no);

ALTER TABLE review MODIFY category_no NUMBER(10) NOT NULL;
ALTER TABLE Category MODIFY category_title VARCHAR2(20);
ALTER TABLE Category MODIFY goods_cnt DEFAULT 0;
SELECT pet_no FROM review;

COMMENT ON TABLE review is '����';
COMMENT ON COLUMN review.review_no is '���� ��ȣ';
COMMENT ON COLUMN review.product_no is '��ǰ ��ȣ';
COMMENT ON COLUMN review.member_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.review_title is '����';
COMMENT ON COLUMN review.review_content is '����';
COMMENT ON COLUMN review.review_thumb is '�����';
COMMENT ON COLUMN review.review_file is '���� �̹���';
COMMENT ON COLUMN review.review_size is '���� �̹��� ũ��';
COMMENT ON COLUMN review.review_grade is '����';
COMMENT ON COLUMN review.review_good is '���ƿ�';
COMMENT ON COLUMN review.review_cnt is '��ȸ��';
COMMENT ON COLUMN review.review_reply_cnt is '���� ��� ��';
COMMENT ON COLUMN review.review_rdate is '�����';
COMMENT ON COLUMN review.review_visible is '��¿���';
COMMENT ON COLUMN review.category_no is 'ī�װ���ȣ';

SELECT COUNT(*) as review_cnt
    FROM review
    WHERE category_no=1 AND review_title LIKE '%�׽�%'  
/**********************************/
/* Table Name: ���� ��� */
/**********************************/
CREATE TABLE review_reply(
		review_reply_no               		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		review_no                     		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NOT NULL,
		review_reply_content          		VARCHAR2(500)		 NOT NULL,
		review_reply_rdate            		VARCHAR2(10)		 NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (review_no) REFERENCES review (review_no)
);

COMMENT ON TABLE review_reply is '���� ���';
COMMENT ON COLUMN review_reply.review_reply_no is '���� ��� ��ȣ';
COMMENT ON COLUMN review_reply.review_no is '���� ��ȣ';
COMMENT ON COLUMN review_reply.member_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review_reply.review_reply_content is '����';
COMMENT ON COLUMN review_reply.review_reply_rdate is '�����';

SELECT *FROM review_reply;

/**********************************/
/* Table Name: ī�װ� */
/**********************************/
CREATE TABLE Category(
		category_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		category_title                		VARCHAR2(10)		 NOT NULL,
		category_rdate                		DATE		 NOT NULL,
		category_cnt                  		NUMBER(10)		 NOT NULL,
		category_seqno                		NUMBER(10)		 NULL ,
		category_visible              		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE Category is 'ī�װ�';
COMMENT ON COLUMN Category.category_no is 'ī�װ���ȣ';
COMMENT ON COLUMN Category.category_title is 'ī�װ��̸�';
COMMENT ON COLUMN Category.category_rdate is '�����';
COMMENT ON COLUMN Category.category_cnt is '�׸� ����';
COMMENT ON COLUMN Category.category_seqno is '��¼���';
COMMENT ON COLUMN Category.category_visible is '��¸��';

SELECT *FROM Category;
ALTER TABLE Category add category_ids VARCHAR2(30) NULL; 
COMMENT ON COLUMN Category.category_ids is '���� ����';

ALTER TABLE Category add procate_upno NUMBER(10) DEFAULT 0 NOT NULL;
COMMENT ON COLUMN Category.procate_upno is '���� ī�װ� ��ȣ';

ALTER TABLE Category add goods_cnt NUMBER(10) NULL;
COMMENT ON COLUMN Category.goods_cnt is '��ǰ ����';

ALTER TABLE review add review_size VARCHAR2(1000) NULL; 
COMMENT ON COLUMN review.review_size is '���� ũ��';

ALTER TABLE review add pet_no NUMBER NULL;
COMMENT ON COLUMN review.pet_no is '�ݷ����� ��ȣ';


ALTER TABLE review add word VARCHAR2(100) NULL;
COMMENT ON COLUMN review.word is '�˻���';


/**********************************/
/* Table Name: ���� ���ƿ� */
/**********************************/
CREATE TABLE rgood(
		rgood_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rgood_rdate                   		DATE		 NULL ,
		review_no                     		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (review_no) REFERENCES review (review_no)
);

COMMENT ON TABLE rgood is '���� ���ƿ�';
COMMENT ON COLUMN rgood.rgood_no is '���� ���ƿ� ��ȣ';
COMMENT ON COLUMN rgood.rgood_rdate is '�����';
COMMENT ON COLUMN rgood.review_no is '���� ��ȣ';
COMMENT ON COLUMN rgood.member_no is 'ȸ�� ��ȣ';

INSERT INTO review(review_no, product_no, member_no, review_title, 
                                    review_content, review_thumb, review_file, review_size, 
                                   review_grade,
                                   review_rdate) 
      VALUES((SELECT NVL(MAX(review_no), 0)+1 as review_no FROM review),3, 1,
      '�ȳ� �� �Ծ��', '�츮 ���̰� �� �Ծ����ϴ�!!',    
      'product1.jpg', '', 500, 5, sysdate);
      
      SELECT *FROM review;
     
      
2. ��� 
INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'�̽±�', '1@naver.com', '1234', 'Q', '2.jpg', '000-0000-0000', 00000, '����������',
'�����������','K','Y',sysdate,1);

INSERT INTO procate(procate_no, procate_name, procate_upno) VALUES
((SELECT NVL(MAX(procate_no), 0)+1 AS procate_no FROM procate), 'DOG', 0);

INSERT INTO manufacturer(manufacturer_no,
                           manufacturer_name, manufacturer_img, manufacturer_callnumber, manufacturer_zipcode, manufacturer_webpageurl)
VALUES((SELECT NVL(MAX(manufacturer_no), 0)+1 as manufacturer_no FROM manufacturer),
                           'ANF', 'imageroot', '02-548-8186', '����Ư���� ������ ������� 508, 9��(��ġ��, �ؼ�2����)', 'https://anf.co.kr/');
                           
INSERT INTO country(country_no,country_name) VALUES
((SELECT NVL(MAX(country_no), 0)+1 AS country_no FROM country), '���ѹα�');

INSERT INTO product(product_no, 
                     manufacturer_no, country_no, procate_no, product_name, product_img, manufacturer, product_introimg, product_target, 
                     product_weight, product_price, product_wprotein, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp, 
                     product_like, product_visible, product_rpcnt, product_rvcnt, product_rdate, product_udate)
VALUES((SELECT NVL(MAX(product_no), 0)+1 AS product_no FROM product), 
                     1, 1, 1, 'ANF �� Ȧ����ƽ �ôϾ�', 'imageroot', '1/2/3/4', 'introimgroot', '7���̻� ��ɰ� ��',
                     '2.72kg', 25530, 19.0, 8.0, 11.0, 4.5, 1.45, 1.5, 0, 'Y', 0, 0, sysdate, null);
                     
INSERT INTO product(product_no, 
                     manufacturer_no, country_no, procate_no, product_name, product_img, manufacturer, product_introimg, product_target, 
                     product_weight, product_price, product_wprotein, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp, 
                     product_like, product_visible, product_rpcnt, product_rvcnt, product_rdate, product_udate)
VALUES((SELECT NVL(MAX(product_no), 0)+1 AS product_no FROM product), 
                     1, 1, 1, 'WellPet �� ���Ͻ� ���� �ôϾ� �����긮�� ��� �� ��������', 'product3.jpg', '1/2/3/4', 'introimgroot', '���� ��',
                     '2.72kg', 30000, 19.0, 8.0, 11.0, 4.5, 1.45, 1.5, 0, 'Y', 0, 0, sysdate, null);                     
                     
                     INSERT INTO product(product_no, 
                     manufacturer_no, country_no, procate_no, product_name, product_img, manufacturer, product_introimg, product_target, 
                     product_weight, product_price, product_wprotein, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp, 
                     product_like, product_visible, product_rpcnt, product_rvcnt, product_rdate, product_udate)
VALUES((SELECT NVL(MAX(product_no), 0)+1 AS product_no FROM product), 
                     1, 1, 1, '�� ��ť���� ���� �׷������� �����긮�� ���Ʈ', 'imageroot', '1/2/3/4', 'introimgroot', '7���̻� ��ɰ� ��',
                     '2.72kg', 25530, 19.0, 8.0, 11.0, 4.5, 1.45, 1.5, 0, 'Y', 0, 0, sysdate, null);
                     SELECT *FROM product;
                     
/* review ���̺� ��� */
INSERT INTO review(review_no, product_no, member_no, review_title, 
																	review_content, review_thumb, review_file, review_size, 
																 review_grade, review_good, review_cnt, review_reply_cnt, 	
																 review_rdate, review_visible) 
VALUES((SELECT NVL(MAX(review_no), 0)+1 as review_no FROM review),1, 1,
'�����ھ� ����� ������ ��� �ı� ���ܿ�!', '���� �� ������ ���ڰ� ���ְ� �� �Ծ��~',		
'', '', 200, 5, 10, 10, 3, sysdate, 'Y');


INSERT INTO review(review_no, product_no, member_no, review_title, 
																	review_content, review_thumb, review_file, review_size, 
																 review_grade, review_good, review_cnt, review_reply_cnt, 	
																 review_rdate, review_visible) 
VALUES((SELECT NVL(MAX(review_no), 0)+1 as review_no FROM review),1, 2,
'�츮 ����� ���� �ı�!!', '���̰� �� �Գ׿�^^ �����ε� ���� ����߰ھ��',		
'', '', 300, 4, 7, 3, 4, sysdate, 'Y');						 

SELECT *FROM review;
SELECT *FROM review_reply;


/* review_reply ���̺� ��� */						 
INSERT INTO review_reply(review_reply_no,review_no, 
member_no, review_reply_content, review_reply_rdate) 
VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
FROM review_reply), 1, 2, '���� �� �Ʒ��̵� ������߰ڳ׿�: )',sysdate);		

INSERT INTO review_reply(review_reply_no,review_no, 
member_no, review_reply_content, review_reply_rdate) 
VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
FROM review_reply), 4, 3, '�ñ��߾��µ� ����ƾ�� �����غ��Կ�!',  sysdate);		

INSERT INTO review_reply(review_reply_no,review_no, 
member_no, review_reply_content, review_reply_rdate) 
VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
FROM review_reply), 4, 3, '���� �ֹ��̵� �� �Ծ����!! ��õ',  sysdate);		

SELECT *FROM review_reply;
/* rgood ���̺� ��� */
INSERT INTO rgood(rgood_no, rgood_rdate, review_no, member_no)
VALUES ((SELECT NVL(MAX(rgood_no), 0)+1 as rgood_no 
FROM rgood), sysdate, 1, 2);

INSERT INTO rgood(rgood_no, rgood_rdate, review_no, member_no)
VALUES ((SELECT NVL(MAX(rgood_no), 0)+1 as rgood_no 
FROM rgood), sysdate, 2, 3);

SELECT *FROM rgood;
SELECT *FROM review;


/* Category ���̺� ��� */
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '��', sysdate, 2, 'Y');

INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '�����', sysdate, 5, 'Y');

INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '��Ÿ', sysdate, 5, 'Y');

-- ������ ���
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '���', sysdate, 0, 'Y', 'admin', 1);

-- ����� ���
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '���', sysdate, 0, 'Y', 'admin', 2);

-- ������ �ǽ� ���(6)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '�ǽ� ���', sysdate, 0, 'Y', 'admin', 4);

-- ������ ���� ���(7)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '���� ���', sysdate, 0, 'Y', 'admin', 4);

-- ����� �ǽ� ���(8)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '�ǽ� ���', sysdate, 0, 'Y', 'admin', 5);

-- ����� ���� ���(9)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '���� ���', sysdate, 0, 'Y', 'admin', 5);

-- ������ ����(10)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '����', sysdate, 0, 'Y', 'admin', 1);

-- ����� ����(11)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '����', sysdate, 0, 'Y', 'admin', 2);

-- ������ �ǽ� ����(12)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '�ǽ� ����', sysdate, 0, 'Y', 'admin', 10);

-- ������ �ǽ� ����(13)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '���� ����', sysdate, 0, 'Y', 'admin', 10);

-- ����� �ǽ� ����(14)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '�ǽ� ����', sysdate, 0, 'Y', 'admin', 11);

-- ����� �ǽ� ����(15)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '���� ����', sysdate, 0, 'Y', 'admin', 11);



3. ���(��ȸ)
/* ��ü ��� �˻� */
SELECT *FROM review;
SELECT *FROM reply;
SELECT *FROM rgood;

/* ���� ��ü ��� */
SELECT review_title, review_thumb, review_grade, review_good, rdate 
FROM review;

SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
          m.member_nickname
FROM review r, member m 
WHERE r.category_no=1 AND r.member_no = m.member_no AND r.review_no=3;

/* ���丶�� ��ǰ ���� */
SELECT p.product_no, p.product_name, p.product_img, p.product_price, r.review_no
FROM review r, product p
WHERE r.product_no = p.product_no AND r.review_no=4;

SELECT r.review_no, p.pet_no, r.pet_no, p.member_no, r.member_no, p.pet_name, p.pet_age, p.pet_weight, 
p.pet_kind, p.pet_image, p.pet_gender, p.pet_specific, r.member_no
FROM pet p, review r
WHERE p.pet_no = r.pet_no;

SELECT p.product_no, p.product_name
FROM review r, product p
WHERE r.product_no = p.product_no AND r.review_no=4;

SELECT pet_no, pet_name, pet_age, pet_weight, 
pet_kind, pet_image, pet_gender, pet_specific, member_no
FROM pet
WHERE member_no=3;

SELECT review_title, pet_no FROM review;
SELECT * FROM pet;

DELETE FROM review_reply
WHERE review_reply_no=6;

delete from review where review_no=5;
select * FROM review_reply;

DELETE FROM review_reply;
SELECT *FROM review_reply;

/* ���� ��� ����¡ */
SELECT review_title, review_thumb, review_grade, review_good, rdate 
FROM review 
ORDER BY review_no 
ASC LIMIT 0, 10;

/* �� ī�װ� ���� ��� ���� */
SELECT COUNT(*) as cnt 
FROM review 
WHERE category_no=1;

/* ����� ī�װ� ���� ��� ���� */
SELECT COUNT(*) as cnt 
FROM review 
WHERE category_no=2;

/* �� ī�װ��� ���� ��� */
SELECT review_no, review_title, review_thumb, review_grade, review_good, review_rdate,category_no 
FROM review 
WHERE category_no=1;

/* ����� ī�װ��� ���� ��� */
SELECT review_title, review_thumb, review_grade, review_good, review_rdate 
FROM review 
WHERE category_no=2;

/* �� ī�װ�(1)���� �� ȸ��(1)�� ����(1) Ȯ���ϱ� */
SELECT product_no, review_title, review_content, 
review_thumb, review_file, review_size, review_grade, 
review_good, review_cnt, review_reply_cnt, review_rdate, review_visible
FROM review 
WHERE member_no=1 AND category_no=1 AND review_no=1;

/* ����� ī�װ�(2)���� �� ȸ��(3)�� ����(1) Ȯ���ϱ� */
SELECT product_no,  review_title, review_content, 
review_thumb, review_file, review_size, review_grade, 
review_good, review_cnt, review_reply_cnt, review_rdate, review_visible
FROM review 
WHERE member_no=3 AND category_no=2 AND review_no=1;

/* �� ���信 ���� ��� ��ȸ */
SELECT review_reply_no, member_no, review_reply_content, review_reply_rdate 
FROM review_reply 
WHERE review_no = 4;

/* �� ī�װ� �� �� ������ ��� ���� */
SELECT review_reply_cnt 
FROM review 
WHERE review_no=1 
AND category_no=1;

SELECT category_no, category_title, category_rdate, category_cnt, category_seqno, category_visible
FROM Category
WHERE category_no=1;

SELECT *FROM review;

4. ����
/* ���� ���� */
UPDATE review 
SET review_title = '�����ھ� ����� �ı�'
WHERE review_no=1;

UPDATE review
SET review_reply_cnt = review_reply_cnt + 1
WHERE review_no = 15;

SELECT review_no, review_reply_cnt FROM review;

SELECT review_reply_cnt FROM review;

UPDATE review 
SET review_thumb = '3_1_t.jpg'
WHERE review_no=1;

UPDATE Category
SET goods_cnt=0;

SELECT *FROM Category;


UPDATE review_reply 
    SET review_reply_content='haha'
    WHERE review_reply_no=12
    
UPDATE review
SET REVIEW_THUMB='3.jpg'
WHERE review_no=4;

SELECT *FROM review;

UPDATE review
SET review_thumb='test_t.jpg'
WHERE category_no=1;

UPDATE review
SET category_no=1
WHERE review_no=3;

UPDATE product
SET product_img='product2.jpg'
WHERE product_no=3;

/* ��ȸ�� */
UPDATE review 
SET review_cnt = review_cnt + 1 
WHERE review_no=3;

UPDATE review
SET category_no=1
WHERE review_no=2;

/* ��� ���� */
UPDATE review_reply 
SET review_reply_content='�� �Գ׿�' 
WHERE review_reply_no=2;

/* ���ƿ� ���� */
UPDATE review 
SET review_good=review_good+1 
WHERE review_no=1;

/* ���ƿ� ���(����) */
UPDATE review 
SET review_good=review_good-1 
WHERE review_no=1;

/* ��� �ۼ��� ���� ���� */
UPDATE review 
SET review_reply_cnt=review_reply_cnt+1 
WHERE review_no=1;

/* visible ���� ���� */
UPDATE review 
SET review_visible='N' 
WHERE review_no=2;

UPDATE review
SET review_cnt=0
WHERE review_no=1;

SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
                  m.member_nickname
      FROM review r, member m 
      WHERE r.category_no=1 AND r.member_no = m.member_no
      ORDER BY r.review_no DESC;
      
5. ����
/* ���� �� �� ���� */
DELETE FROM review
WHERE review_no=1;

SELECT *FROM review;
SELECT *FROM pet;


SELECT *FROM review;

DELETE FROM Category
WHERE category_no=1;

SELECT *FROM Category;
SELECT *FROM review;

/* ���ƿ� ��� */
DELETE FROM review_reply 
WHERE review_no=1 AND member_no=1;

DELETE rgood 
WHERE member_no=2 AND review_no=2;

DELETE Category
WHERE category_no=5;

DELETE FROM review
WHERE category_no=1;

DELETE FROM Category;


-- �˻�
SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
                  m.member_nickname, r.review_file, p.product_no, p.product_name, p.product_price, p.product_img
      FROM review r, member m, product p 
      WHERE r.category_no=1 AND r.member_no = m.member_no AND r.product_no=p.product_no
      AND (r.review_title LIKE '%��%' OR p.product_name LIKE '%A%')
      ORDER BY review_no DESC
      
      

       SELECT review_no, review_title, review_thumb, review_grade, review_good, review_rdate, category_no, 
                  member_nickname, review_file, product_no, product_name, product_price, product_img, rownum as r
                  (               
											SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
                                  m.member_nickname, r.review_file, p.product_no, p.product_name, p.product_price, p.product_img
                      FROM review r, member m, product p                   
                      WHERE r.category_no=1 AND r.member_no = m.member_no AND r.product_no=p.product_no
                      AND (r.review_title LIKE '%�׽�%' OR p.product_name LIKE '%�׽�%' 
                        OR m.member_nickname LIKE '%�׽�%')
                      ORDER BY r.review_no DESC
                    )
      
      
