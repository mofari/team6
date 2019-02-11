1. ���

/**********************************/
/* Table Name: ������ �α��γ��� */
/**********************************/
CREATE TABLE loginhistory_admin(
      loginhistory_admin_loginno         NUMBER(10)       NOT NULL       PRIMARY KEY,
      loginhistory_admin_ip               VARCHAR2(30)       NOT NULL,
      loginhistory_admin_email            VARCHAR2(30)       NOT NULL,
      loginhistory_admin_time             DATE       NOT NULL,
      act_admin_no                         NUMBER(10)       NOT NULL,
      member_no                           NUMBER(10)       NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);
drop table loginhistory_admin;


CREATE TABLE act(
      act_no                              NUMBER(10)       NOT NULL       PRIMARY KEY,
      act_name                            VARCHAR2(10)       NOT NULL
);

COMMENT ON TABLE loginhistory_admin is '������ �α��γ���';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_loginno is '�α��� ��ȣ';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_ip is '������';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_email is '�̸���';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_time is '�α��νð�';
COMMENT ON COLUMN loginhistory_admin.act_admin_no is '���� ��ȣ';
COMMENT ON COLUMN loginhistory_admin.member_no is 'ȸ����ȣ';

drop table act;
/**********************************/
/* Table Name: ȸ�� ���� */
/**********************************/
CREATE TABLE member(
      member_no                           NUMBER(10)       NOT NULL       PRIMARY KEY,
      member_name                         VARCHAR2(10)       NOT NULL,
      member_email                        VARCHAR2(30)       NOT NULL,
      member_passwd                       VARCHAR2(20)       NOT NULL,
      member_nickname                     VARCHAR2(20)       NOT NULL,
      member_image                        VARCHAR2(50)       NULL ,
      member_tel                          VARCHAR2(30)       NOT NULL,
      member_zipcode                      NUMBER(10)       NOT NULL,
      member_address                      VARCHAR2(100)       NOT NULL,
      member_address2                     VARCHAR2(100)       NULL ,
      member_logintype                    CHAR(1)       NOT NULL,
      visible                                   CHAR(1)       NOT NULL,
      member_date                         DATE   NOT NULL,
      act_no                              NUMBER(10)       NULL ,
  FOREIGN KEY (act_no) REFERENCES act (act_no)
);
COMMENT ON TABLE member is 'ȸ�� ����';
COMMENT ON COLUMN member.member_no is 'ȸ����ȣ';
COMMENT ON COLUMN member.member_name is 'ȸ���̸�';
COMMENT ON COLUMN member.member_email is '�̸���';
COMMENT ON COLUMN member.member_passwd is '�н�����';
COMMENT ON COLUMN member.member_nickname is '����';
COMMENT ON COLUMN member.member_image is '�����ʻ���';
COMMENT ON COLUMN member.member_tel is '��ȭ��ȣ';
COMMENT ON COLUMN member.member_zipcode is '�����ȣ';
COMMENT ON COLUMN member.member_address is '�ּ�';
COMMENT ON COLUMN member.member_address2 is '���ּ�';
COMMENT ON COLUMN member.member_logintype is '�α��� Ÿ��';
COMMENT ON COLUMN member.visible is '����/����';
COMMENT ON COLUMN member.member_date is '������';
COMMENT ON COLUMN member.act_no is '���ѹ�ȣ';

drop table member;

/**********************************/
/* Table Name: ȸ�� �α��γ��� */
/**********************************/
CREATE TABLE loginhistory(
      loginhistory_loginno                NUMBER(10)       NOT NULL       PRIMARY KEY,
      loginhistory_ip                     VARCHAR2(30)       NOT NULL,
      loginhistory_email                  VARCHAR2(30)       NOT NULL,
      loginhistory_time                   DATE       NOT NULL,
      act_no                              NUMBER(10)       NOT NULL,
      member_no                           NUMBER(10)       NULL ,
      FOREIGN KEY (member_no) REFERENCES member (member_no)
);
COMMENT ON TABLE loginhistory is 'ȸ�� �α��γ���';
COMMENT ON COLUMN loginhistory.loginhistory_loginno is '�α��� ��ȣ';
COMMENT ON COLUMN loginhistory.loginhistory_ip is '������';
COMMENT ON COLUMN loginhistory.loginhistory_email is '�̸���';
COMMENT ON COLUMN loginhistory.loginhistory_time is '�α��νð�';
COMMENT ON COLUMN loginhistory.act_no is '���� ��ȣ';
COMMENT ON COLUMN loginhistory.member_no is 'ȸ����ȣ';

drop table loginhistory;
/**********************************/
/* Table Name: �ݷ����� ���� */
/**********************************/
CREATE TABLE pet(
      pet_no                              NUMBER       NOT NULL       PRIMARY KEY,
      pet_name                            VARCHAR2(10)       NULL ,
      pet_age                             NUMBER(20)       NULL ,
      pet_weight                          NUMBER(20)       NULL ,
      pet_gender                          VARCHAR2(10)       NULL,
      pet_kind                            VARCHAR2(16)       NULL ,
      pet_image                           VARCHAR2(100)       NULL ,
      pet_specific                        VARCHAR2(100)       NULL ,
      pet_thumbs                             VARCHAR2(100)       NULL ,
      pet_thumb                                VARCHAR2(100)       NULL ,
      member_no                           NUMBER(10)       NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);
COMMENT ON TABLE pet is '�ݷ����� ����';
COMMENT ON COLUMN pet.pet_no is '�ݷ����� ��ȣ';
COMMENT ON COLUMN pet.pet_name is '�̸�';
COMMENT ON COLUMN pet.pet_age is '����';
COMMENT ON COLUMN pet.pet_weight is '����';
COMMENT ON COLUMN pet.pet_gender is '����';
COMMENT ON COLUMN pet.pet_kind is 'ǰ��';
COMMENT ON COLUMN pet.pet_image is '�̹���';
COMMENT ON COLUMN pet.pet_specific is 'Ư�̻���';
COMMENT ON COLUMN pet.member_no is 'ȸ����ȣ';

drop table pet;
/**********************************/
/* Table Name: ������ �亯 ī�װ� */
/**********************************/
CREATE TABLE qnacategory(
      qnacategory_no                      NUMBER(10)       NOT NULL       PRIMARY KEY,
      qnacategory_name                    VARCHAR2(30)       NOT NULL
);
COMMENT ON TABLE qnacategory is '������ �亯 ī�װ�';
COMMENT ON COLUMN qnacategory.qnacategory_no is 'QNA ī�װ� ��ȣ';
COMMENT ON COLUMN qnacategory.qnacategory_name is 'ī�װ� �̸�';
DELETE from QNACATEGORY;

drop table
/**********************************/
/* Table Name: ������ �亯 */
/**********************************/
CREATE TABLE QNA(
      qna_no                              NUMBER(10)       NOT NULL       PRIMARY KEY,
      qna_title                           VARCHAR2(50)       NOT NULL,
      qna_word                            VARCHAR2(50)       NOT NULL,
      qna_image                           VARCHAR2(100)       NULL ,
      visible                             CHAR(1)       NOT NULL,
      qna_date                            DATE       NULL ,
      qna_cnt                                NUMBER(99)       NULL,
      qnacategory_no                      NUMBER(10)       NULL ,
      member_no                           NUMBER(10)       NULL ,
      qna_grpno                           NUMBER(10)       NULL ,
      qna_indent                          NUMBER(10)       NULL ,
      qna_ansnum                          NUMBER(10)       NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (qnacategory_no) REFERENCES qnacategory (qnacategory_no)
);

COMMENT ON TABLE QNA is '������ �亯';
COMMENT ON COLUMN QNA.qna_no is 'QNA ��ȣ';
COMMENT ON COLUMN QNA.qna_title is '����';
COMMENT ON COLUMN QNA.qna_word is '�� ����';
COMMENT ON COLUMN QNA.qna_image is '�̹���';
COMMENT ON COLUMN QNA.visible is '����/����';
COMMENT ON COLUMN QNA.qna_date is '��¥';
COMMENT ON COLUMN QNA.qnacategory_no is 'QNA ī�װ� ��ȣ';
COMMENT ON COLUMN QNA.member_no is 'ȸ����ȣ';
COMMENT ON COLUMN QNA.qna_grpno is '�׷��ȣ';
COMMENT ON COLUMN QNA.qna_indent is '�亯 ����';
COMMENT ON COLUMN QNA.qna_ansnum is '�亯 ����';

drop table

/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE act(
      act_no                              NUMBER(10)       NOT NULL       PRIMARY KEY,
      act_name                            VARCHAR2(10)       NOT NULL
);

COMMENT ON TABLE act is '����';
COMMENT ON COLUMN act.act_no is '���ѹ�ȣ';
COMMENT ON COLUMN act.act_name is '���Ѹ�';


2. ���
/* act ���̺� ��� */
INSERT INTO act(act_no, act_name) VALUES ((SELECT NVL(MAX(act_no), 0)+1 as act_no FROM act),'������');

INSERT INTO act(act_no, act_name) VALUES ((SELECT NVL(MAX(act_no), 0)+1 as act_no FROM act),'ȸ��');

INSERT INTO act(act_no, act_name) VALUES ((SELECT NVL(MAX(act_no), 0)+1 as act_no FROM act),'��ȸ��');


/* member ���̺� ��� */
INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'����ȣ', 'stuck1361@naver.com', '1234', 'Nickom', '1.jpg', '000-0000-0000', 00000, '�泲 ���걺',
'���帮','K','Y',sysdate,1);

INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'�̽±�', '1@naver.com', '1234', 'Q', '2.jpg', '000-0000-0000', 00000, '����������',
'�����������','K','Y',sysdate,1);

INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'������', '2@naver.com', '1234', 'josu', '1.jpg', '000-0000-0000', 00000, '����',
'�ŵ���','K','Y',sysdate,1);

/* qnacategory ���̺� ���*/
INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'����Ʈ ����');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'�� ����');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'����� ����');

/* QNA ���̺� ��� */
INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent, 
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '�ñ��ؿ�', '�ñ�', '1.jpg',1, 1,1,1, 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '�̰� ����', '�ñ�', '1.jpg',1, 1,1,1, 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '�ذ� �ƾ��', '�ذ�', '1.jpg',1, 1,1,1, 'Y', sysdate, 1, 1);


/* QNA ���̺� �亯 ��� */
-- grpno: �ִ밪 + 1
-- indent: 0, �亯�� �ƴϰ� �鿩���� �ʿ� ����.
-- ansnum: 0, �亯�� �ƴϰ� ���� ���� ���
INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA),'�亯', '�亯', '3.jpg',2, 0,0,1 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA),'�ذ�ƾ��', '����', '3.jpg',2, 0,0,1 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA),'�̷��� �ذ��ϼ���', '�ذ�', '3.jpg',2, 0,0,1 'Y', sysdate, 1, 1);


/* loginhistory ���̺� ��� */
INSERT INTO loginhistory(loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_loginno), 0)+1 as loginhistory_loginno FROM loginhistory), '172.16.11.13', '1@naver.com',sysdate,act_no,member_no);

INSERT INTO loginhistory(loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_loginno), 0)+1 as loginhistory_loginno FROM loginhistory), '172.16.12.13', '2@naver.com',sysdate,act_no,member_no);

INSERT INTO loginhistory(loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_loginno), 0)+1 as loginhistory_loginno FROM loginhistory), '172.16.13.13', '3@naver.com',sysdate,act_no,member_no);


/* loginhistory_admin ���̺� ��� */
INSERT INTO loginhistory_admin(loginhistory_admin_loginno, loginhistory_admin_ip, 
loginhistory_admin_email, loginhistory_admin_time, act_admin_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_admin_loginno), 0)+1 as loginhistory_admin_loginno FROM loginhistory_admin),
'172.16.12.13', '1@naver.com',sysdate,act_admin_no,member_no);
 
INSERT INTO loginhistory_admin(loginhistory_admin_loginno, loginhistory_admin_ip, 
loginhistory_admin_email, loginhistory_admin_time, act_admin_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_admin_loginno), 0)+1 as loginhistory_admin_loginno FROM loginhistory_admin), 
'172.16.13.13', '2@naver.com',sysdate,act_admin_no,member_no);

delete from LOGINHISTORY_ADMIN

/* pet ���̺� ��� */
INSERT INTO pet(pet_no, pet_name, pet_age, pet_weight, pet_kind, pet_image, pet_gender, pet_specific, member_no)
VALUES ((SELECT NVL(MAX(pet_no), 0)+1 as pet_no FROM pet), '�Ʒ���', 5,3, '����Ǫ��', '1.jpg','����', '�ʹ��Ϳ���.',1);

INSERT INTO pet(pet_no, pet_name, pet_age, pet_weight, pet_kind, pet_image, pet_gender, pet_specific, member_no)
VALUES ((SELECT NVL(MAX(pet_no), 0)+1 as pet_no FROM pet), '�ٷ���', 2,3, '��Ƽ��', '1.jpg', '����' ,'�߼�ȭ���� ��ħ.',2);

INSERT INTO pet(pet_no, pet_name, pet_age, pet_weight, pet_kind, pet_image, pet_gender, pet_specific, member_no)
VALUES ((SELECT NVL(MAX(pet_no), 0)+1 as pet_no FROM pet), '����', 10,9, '�㽺Ű', '3.jpg', '����' ,'���� ����.',3);



3. ��ȸ(���)
/* ȸ�� ��� */
-- member_no ��������
SELECT member_no, member_name, member_email,member_nickname, member_image, 
member_tel, member_zipcode, member_address,member_address2, member_date,act_no
FROM member ORDER BY member_no ASC;

/* ȸ�� ��ȸ */
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no, visible
FROM member WHERE member_no = 1;


/* ȸ�� �˻� */
-- �̸� �˻�
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no
FROM member
WHERE member_name LIKE '%member_name%'
ORDER BY member_no ASC;

-- visible �˻�
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no
FROM member
WHERE visible LIKE '%Y%'
ORDER BY member_no ASC;

-- �������� �˻�
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no
FROM member
WHERE act_no LIKE '%1%'
ORDER BY member_no ASC;


/* QNA ��� */
-- qna_no ��������
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA ORDER BY qna_no ASC;

/* QNA ��ȸ */
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA WHERE qna_no = 1;

/* QNA �˻� */
-- ī�װ� �˻�
SELECT  qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA
WHERE qnacategory_no LIKE '%1%'
ORDER BY qna_no ASC;

-- title �˻�
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA
WHERE qna_title LIKE '%qna_title%'
ORDER BY qna_no ASC;

/**
 * qna ����¡
 */
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, SUBSTRING(qna_date, 1, 10) as qna_date, qnacategory_no, member_no 
FROM QNA
WHERE qna_title LIKE '%qna_title%'
ORDER BY qna_no DESC
LIMIT 0, 5;


/* �α��� ����*/
SELECT loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no
FROM loginhistory
ORDER BY loginhistory_loginno ASC;

/* �α��� ���� ��ȸ */
SELECT loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no
FROM loginhistory
WHERE loginhistory_loginno = 1;


/* �� ��� */
-- pet_no ��������
SELECT pet_no, pet_name, pet_age, pet_weight, 
pet_kind, pet_image, pet_gender, pet_specific, member_no
FROM pet
ORDER BY pet_no ASC;

/* �� ��ȸ */
SELECT pet_no, pet_name, pet_age, pet_weight, pet_thumbs, pet_thumb,
pet_kind, pet_image, pet_gender, pet_specific, member_no
FROM pet
WHERE pet_no = 1;


4. ����
/* ȸ�� ���� ���� */
UPDATE member
SET member_nickname = '�г���', member_image='3.jpg',
     member_tel= '010-3071-1323', member_zipcode =00000, member_address = '���걺', member_address2='���帮'
WHERE member_no= 1;

/* ȸ�� ��й�ȣ ���� */
UPDATE member
SET member_passwd='12345'
WHERE member_no= 1;

/* ȸ�� ����/��� ���� */
-- ��� ����
UPDATE member
SET visible='Y' -- ���
WHERE member_no=1;

UPDATE member
SET visible='N' -- �����
WHERE member_no=1;


/* ȸ�� ���� ���� */
-- ���� ����
UPDATE member
SET act_no= 1
WHERE member_no=1;

/* QNA ���� */
UPDATE QNA
SET qna_title = '��������', qna_word='������',qna_image= '3.jpg', visible ='Y'
WHERE member_no= 1;

/* qna ����/��� ���� */
-- ��� ����
UPDATE QNA
SET visible='Y' -- ���
WHERE qna_no=1;

UPDATE QNA
SET visible='N' -- �����
WHERE qna_no=1;

/* ������ ��ϵ� �亯�� ���� ó�� */
UPDATE qna
SET qna_ansnum = qna_ansnum + 1
WHERE qnacategory_no = 1 AND qna_grpno = 1 AND ansnum > �θ��� ansnum �÷��� ��; 'ansnum'

UPDATE qna
SET qna_ansnum = qna_ansnum + 1
WHERE qnacategory_no = 1 AND qna_grpno = 1 AND ansnum > 0;

/* �� ���� ����  */
UPDATE pet
SET pet_name = '�Ʒ�', pet_age=4,
     pet_weight=5, pet_image = '3.jpg', pet_specific='�Ʒ��� ǥ�� ������'
WHERE pet_no= 1;

5. ����
/* ȸ�� ���� */
-- ��� ����
DELETE FROM member;
drop from member;
drop from act;

-- Ư�� ���ڵ� ����
DELETE FROM member
WHERE member_no=1;

/* qna ���� */
-- ��� ����
DELETE FROM QNA;

-- Ư�� ���ڵ� ����
DELETE FROM QNA
WHERE qna_no=1;

/* �α��� ���� ���� */
-- ��� ����
DELETE FROM loginhistory;
 
-- Ư�� ���ڵ� ����
DELETE FROM loginhistory
WHERE loginhistory_loginno=1;
 
-- FK ���̺��� ���ȵǴ� ������ ����
DELETE FROM loginhistory
WHERE loginhistory_loginno=7;

/* pet ���� */
-- ��� ����
DELETE FROM pet;
WHERE pet_no = 2;
drop table pet;

-- Ư�� ���ڵ� ����
DELETE FROM pet
WHERE pet_no=1;