--��ȸ
SELECT qnacategory_no, qnacategory_name, qnacategory_ids FROM qnacategory;
SELECT qna_no,qna_visible, qna_title, qna_ansnum, qna_grpno, qna_indent FROM qna;
SELECT* FROM qna;

 QNA_NO QNA_TITLE      							QNA_ANSNUM 		QNA_GRPNO 		QNA_INDENT
 ------ --------------															 ---------- 						--------- 						----------
      1 ��ǰ ���� �־��             									  0        								 1          							0
      2 ���� �ۼ� ��� �ؿ�??          					0        								 2        							  0

SELECT COUNT(*) as cnt FROM qna WHERE qna_no=6 AND qna_pw=1111
      
DROP TABLE qna;
DROP TABLE qnacategory;
--����

/**********************************/
/* Table Name: ������ �亯 ī�װ� */
/**********************************/
CREATE TABLE qnacategory(
		qnacategory_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		qnacategory_name              		VARCHAR2(16)		 NOT NULL,
		qnacategory_ids										VARCHAR2(30)  NULL
);

COMMENT ON TABLE qnacategory is '������ �亯 ī�װ�';
COMMENT ON COLUMN qnacategory.qnacategory_no is 'QNA ī�װ� ��ȣ';
COMMENT ON COLUMN qnacategory.qnacategory_name is 'ī�װ� �̸�';
COMMENT ON COLUMN qnacategory.qnacategory_ids is '���� ����';

/**********************************/
/* Table Name: ������ �亯 */
/**********************************/
CREATE TABLE qna(
		qna_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		qna_title                     		VARCHAR2(50)		 NOT NULL,
		qna_content                      		VARCHAR2(500)		 NOT NULL,
		qna_image                     		VARCHAR2(100)		 NULL ,
		qna_visible                       		VARCHAR2(100)	DEFAULT 'Y' NOT NULL,
		qna_pw														VARCHAR2(50)			NULL,
		qna_date                      		DATE		 NULL ,
		qnacategory_no                		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NULL ,
		qna_grpno                     		NUMBER(10)		 NULL ,
		qna_indent                    		NUMBER(10)	DEFAULT 0 NOT	 NULL ,
		qna_ansnum                    		NUMBER(10)	DEFAULT 0 NOT	 NULL ,
		word																	 VARCHAR2(100) NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (qnacategory_no) REFERENCES qnacategory (qnacategory_no)
);

COMMENT ON TABLE qna is '������ �亯';
COMMENT ON COLUMN qna.qna_no is 'QNA ��ȣ';
COMMENT ON COLUMN qna.qna_title is '����';
COMMENT ON COLUMN qna.qna_content is '�� ����';
COMMENT ON COLUMN qna.qna_image is '�̹���';
COMMENT ON COLUMN qna.qna_visible is '����/����';
COMMENT ON COLUMN qna.qna_pw is '��й�ȣ';
COMMENT ON COLUMN qna.qna_date is '��¥';
COMMENT ON COLUMN qna.qnacategory_no is 'QNA ī�װ� ��ȣ';
COMMENT ON COLUMN qna.member_no is 'ȸ����ȣ';
COMMENT ON COLUMN qna.qna_grpno is '�׷��ȣ';
COMMENT ON COLUMN qna.qna_indent is '�亯 ����';
COMMENT ON COLUMN qna.qna_ansnum is '�亯 ����';
COMMENT ON COLUMN qna.word is '�˻���';



ALTER TABLE qna add word VARCHAR2(100) NULL;
COMMENT ON COLUMN qna.word is '�˻���';
--���

/* qnacategory ���̺� ���*/
INSERT INTO qnacategory(qnacategory_no, qnacategory_name, qnacategory_ids) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'��ǰ ����', 'admin');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'���� ����');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'����� ����');

/* QNA ���̺� ��� */
INSERT INTO qna(qna_no, qna_title, qna_content, qna_grpno, qna_ansnum, qna_indent, 
qna_visible, qna_pw, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '�ñ��ؿ�', '�ñ� ����', 
(SELECT NVL(MAX(qna_grpno), 0) + 1 as qna_grpno FROM qna),1,1, 'Y', '1234', sysdate, 1, 1);

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


DELETE FROM qna WHERE qna_no=4;