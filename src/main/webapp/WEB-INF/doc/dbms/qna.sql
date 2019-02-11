--조회
SELECT qnacategory_no, qnacategory_name, qnacategory_ids FROM qnacategory;
SELECT qna_no,qna_visible, qna_title, qna_ansnum, qna_grpno, qna_indent FROM qna;
SELECT* FROM qna;

 QNA_NO QNA_TITLE      							QNA_ANSNUM 		QNA_GRPNO 		QNA_INDENT
 ------ --------------															 ---------- 						--------- 						----------
      1 상품 문의 있어요             									  0        								 1          							0
      2 리뷰 작성 어떻게 해요??          					0        								 2        							  0

SELECT COUNT(*) as cnt FROM qna WHERE qna_no=6 AND qna_pw=1111
      
DROP TABLE qna;
DROP TABLE qnacategory;
--생성

/**********************************/
/* Table Name: 질문과 답변 카테고리 */
/**********************************/
CREATE TABLE qnacategory(
		qnacategory_no                		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		qnacategory_name              		VARCHAR2(16)		 NOT NULL,
		qnacategory_ids										VARCHAR2(30)  NULL
);

COMMENT ON TABLE qnacategory is '질문과 답변 카테고리';
COMMENT ON COLUMN qnacategory.qnacategory_no is 'QNA 카테고리 번호';
COMMENT ON COLUMN qnacategory.qnacategory_name is '카테고리 이름';
COMMENT ON COLUMN qnacategory.qnacategory_ids is '접근 계정';

/**********************************/
/* Table Name: 질문과 답변 */
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

COMMENT ON TABLE qna is '질문과 답변';
COMMENT ON COLUMN qna.qna_no is 'QNA 번호';
COMMENT ON COLUMN qna.qna_title is '제목';
COMMENT ON COLUMN qna.qna_content is '글 내용';
COMMENT ON COLUMN qna.qna_image is '이미지';
COMMENT ON COLUMN qna.qna_visible is '숨김/보임';
COMMENT ON COLUMN qna.qna_pw is '비밀번호';
COMMENT ON COLUMN qna.qna_date is '날짜';
COMMENT ON COLUMN qna.qnacategory_no is 'QNA 카테고리 번호';
COMMENT ON COLUMN qna.member_no is '회원번호';
COMMENT ON COLUMN qna.qna_grpno is '그룹번호';
COMMENT ON COLUMN qna.qna_indent is '답변 차수';
COMMENT ON COLUMN qna.qna_ansnum is '답변 순서';
COMMENT ON COLUMN qna.word is '검색어';



ALTER TABLE qna add word VARCHAR2(100) NULL;
COMMENT ON COLUMN qna.word is '검색어';
--등록

/* qnacategory 테이블 등록*/
INSERT INTO qnacategory(qnacategory_no, qnacategory_name, qnacategory_ids) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'상품 문의', 'admin');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'리뷰 문의');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'고양이 관련');

/* QNA 테이블 등록 */
INSERT INTO qna(qna_no, qna_title, qna_content, qna_grpno, qna_ansnum, qna_indent, 
qna_visible, qna_pw, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '궁금해요', '궁금 내용', 
(SELECT NVL(MAX(qna_grpno), 0) + 1 as qna_grpno FROM qna),1,1, 'Y', '1234', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '이건 뭐죠', '궁금', '1.jpg',1, 1,1,1, 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '해결 됐어요', '해결', '1.jpg',1, 1,1,1, 'Y', sysdate, 1, 1);


/* QNA 테이블 답변 등록 */
-- grpno: 최대값 + 1
-- indent: 0, 답변이 아니고 들여쓰기 필요 없음.
-- ansnum: 0, 답변이 아니고 가장 먼저 출력
INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA),'답변', '답변', '3.jpg',2, 0,0,1 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA),'해결됐어요', '감사', '3.jpg',2, 0,0,1 'Y', sysdate, 1, 1);

INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA),'이렇게 해결하세요', '해결', '3.jpg',2, 0,0,1 'Y', sysdate, 1, 1);


DELETE FROM qna WHERE qna_no=4;