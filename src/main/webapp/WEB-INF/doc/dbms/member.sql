1. 등록

/**********************************/
/* Table Name: 관리자 로그인내역 */
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

COMMENT ON TABLE loginhistory_admin is '관리자 로그인내역';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_loginno is '로그인 번호';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_ip is '아이피';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_email is '이메일';
COMMENT ON COLUMN loginhistory_admin.loginhistory_admin_time is '로그인시간';
COMMENT ON COLUMN loginhistory_admin.act_admin_no is '권한 번호';
COMMENT ON COLUMN loginhistory_admin.member_no is '회원번호';

drop table act;
/**********************************/
/* Table Name: 회원 정보 */
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
COMMENT ON TABLE member is '회원 정보';
COMMENT ON COLUMN member.member_no is '회원번호';
COMMENT ON COLUMN member.member_name is '회원이름';
COMMENT ON COLUMN member.member_email is '이메일';
COMMENT ON COLUMN member.member_passwd is '패스워드';
COMMENT ON COLUMN member.member_nickname is '별명';
COMMENT ON COLUMN member.member_image is '프로필사진';
COMMENT ON COLUMN member.member_tel is '전화번호';
COMMENT ON COLUMN member.member_zipcode is '우편번호';
COMMENT ON COLUMN member.member_address is '주소';
COMMENT ON COLUMN member.member_address2 is '상세주소';
COMMENT ON COLUMN member.member_logintype is '로그인 타입';
COMMENT ON COLUMN member.visible is '숨김/보임';
COMMENT ON COLUMN member.member_date is '가입일';
COMMENT ON COLUMN member.act_no is '권한번호';

drop table member;

/**********************************/
/* Table Name: 회원 로그인내역 */
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
COMMENT ON TABLE loginhistory is '회원 로그인내역';
COMMENT ON COLUMN loginhistory.loginhistory_loginno is '로그인 번호';
COMMENT ON COLUMN loginhistory.loginhistory_ip is '아이피';
COMMENT ON COLUMN loginhistory.loginhistory_email is '이메일';
COMMENT ON COLUMN loginhistory.loginhistory_time is '로그인시간';
COMMENT ON COLUMN loginhistory.act_no is '권한 번호';
COMMENT ON COLUMN loginhistory.member_no is '회원번호';

drop table loginhistory;
/**********************************/
/* Table Name: 반려동물 정보 */
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
COMMENT ON TABLE pet is '반려동물 정보';
COMMENT ON COLUMN pet.pet_no is '반려동물 번호';
COMMENT ON COLUMN pet.pet_name is '이름';
COMMENT ON COLUMN pet.pet_age is '나이';
COMMENT ON COLUMN pet.pet_weight is '무게';
COMMENT ON COLUMN pet.pet_gender is '성별';
COMMENT ON COLUMN pet.pet_kind is '품종';
COMMENT ON COLUMN pet.pet_image is '이미지';
COMMENT ON COLUMN pet.pet_specific is '특이사항';
COMMENT ON COLUMN pet.member_no is '회원번호';

drop table pet;
/**********************************/
/* Table Name: 질문과 답변 카테고리 */
/**********************************/
CREATE TABLE qnacategory(
      qnacategory_no                      NUMBER(10)       NOT NULL       PRIMARY KEY,
      qnacategory_name                    VARCHAR2(30)       NOT NULL
);
COMMENT ON TABLE qnacategory is '질문과 답변 카테고리';
COMMENT ON COLUMN qnacategory.qnacategory_no is 'QNA 카테고리 번호';
COMMENT ON COLUMN qnacategory.qnacategory_name is '카테고리 이름';
DELETE from QNACATEGORY;

drop table
/**********************************/
/* Table Name: 질문과 답변 */
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

COMMENT ON TABLE QNA is '질문과 답변';
COMMENT ON COLUMN QNA.qna_no is 'QNA 번호';
COMMENT ON COLUMN QNA.qna_title is '제목';
COMMENT ON COLUMN QNA.qna_word is '글 내용';
COMMENT ON COLUMN QNA.qna_image is '이미지';
COMMENT ON COLUMN QNA.visible is '숨김/보임';
COMMENT ON COLUMN QNA.qna_date is '날짜';
COMMENT ON COLUMN QNA.qnacategory_no is 'QNA 카테고리 번호';
COMMENT ON COLUMN QNA.member_no is '회원번호';
COMMENT ON COLUMN QNA.qna_grpno is '그룹번호';
COMMENT ON COLUMN QNA.qna_indent is '답변 차수';
COMMENT ON COLUMN QNA.qna_ansnum is '답변 순서';

drop table

/**********************************/
/* Table Name: 권한 */
/**********************************/
CREATE TABLE act(
      act_no                              NUMBER(10)       NOT NULL       PRIMARY KEY,
      act_name                            VARCHAR2(10)       NOT NULL
);

COMMENT ON TABLE act is '권한';
COMMENT ON COLUMN act.act_no is '권한번호';
COMMENT ON COLUMN act.act_name is '권한명';


2. 등록
/* act 테이블 등록 */
INSERT INTO act(act_no, act_name) VALUES ((SELECT NVL(MAX(act_no), 0)+1 as act_no FROM act),'마스터');

INSERT INTO act(act_no, act_name) VALUES ((SELECT NVL(MAX(act_no), 0)+1 as act_no FROM act),'회원');

INSERT INTO act(act_no, act_name) VALUES ((SELECT NVL(MAX(act_no), 0)+1 as act_no FROM act),'비회원');


/* member 테이블 등록 */
INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'김준호', 'stuck1361@naver.com', '1234', 'Nickom', '1.jpg', '000-0000-0000', 00000, '충남 예산군',
'신장리','K','Y',sysdate,1);

INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'이승규', '1@naver.com', '1234', 'Q', '2.jpg', '000-0000-0000', 00000, '대전광역시',
'살기좋은동네','K','Y',sysdate,1);

INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'조수용', '2@naver.com', '1234', 'josu', '1.jpg', '000-0000-0000', 00000, '운정',
'신도시','K','Y',sysdate,1);

/* qnacategory 테이블 등록*/
INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'사이트 관련');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'개 관련');

INSERT INTO qnacategory(qnacategory_no, qnacategory_name) 
VALUES ((SELECT NVL(MAX(qnacategory_no), 0)+1 as qnacategory_no FROM qnacategory),'고양이 관련');

/* QNA 테이블 등록 */
INSERT INTO QNA(qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent, 
visible, qna_date, qnacategory_no, member_no)
VALUES ((SELECT NVL(MAX(qna_no), 0)+1 as qna_no FROM QNA), '궁금해요', '궁금', '1.jpg',1, 1,1,1, 'Y', sysdate, 1, 1);

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


/* loginhistory 테이블 등록 */
INSERT INTO loginhistory(loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_loginno), 0)+1 as loginhistory_loginno FROM loginhistory), '172.16.11.13', '1@naver.com',sysdate,act_no,member_no);

INSERT INTO loginhistory(loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_loginno), 0)+1 as loginhistory_loginno FROM loginhistory), '172.16.12.13', '2@naver.com',sysdate,act_no,member_no);

INSERT INTO loginhistory(loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_loginno), 0)+1 as loginhistory_loginno FROM loginhistory), '172.16.13.13', '3@naver.com',sysdate,act_no,member_no);


/* loginhistory_admin 테이블 등록 */
INSERT INTO loginhistory_admin(loginhistory_admin_loginno, loginhistory_admin_ip, 
loginhistory_admin_email, loginhistory_admin_time, act_admin_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_admin_loginno), 0)+1 as loginhistory_admin_loginno FROM loginhistory_admin),
'172.16.12.13', '1@naver.com',sysdate,act_admin_no,member_no);
 
INSERT INTO loginhistory_admin(loginhistory_admin_loginno, loginhistory_admin_ip, 
loginhistory_admin_email, loginhistory_admin_time, act_admin_no, member_no)
VALUES((SELECT NVL(MAX(loginhistory_admin_loginno), 0)+1 as loginhistory_admin_loginno FROM loginhistory_admin), 
'172.16.13.13', '2@naver.com',sysdate,act_admin_no,member_no);

delete from LOGINHISTORY_ADMIN

/* pet 테이블 등록 */
INSERT INTO pet(pet_no, pet_name, pet_age, pet_weight, pet_kind, pet_image, pet_gender, pet_specific, member_no)
VALUES ((SELECT NVL(MAX(pet_no), 0)+1 as pet_no FROM pet), '아롱이', 5,3, '토이푸들', '1.jpg','암컷', '너무귀엽다.',1);

INSERT INTO pet(pet_no, pet_name, pet_age, pet_weight, pet_kind, pet_image, pet_gender, pet_specific, member_no)
VALUES ((SELECT NVL(MAX(pet_no), 0)+1 as pet_no FROM pet), '다롱이', 2,3, '말티즈', '1.jpg', '암컷' ,'중성화수술 마침.',2);

INSERT INTO pet(pet_no, pet_name, pet_age, pet_weight, pet_kind, pet_image, pet_gender, pet_specific, member_no)
VALUES ((SELECT NVL(MAX(pet_no), 0)+1 as pet_no FROM pet), '코코', 10,9, '허스키', '3.jpg', '수컷' ,'눈에 염증.',3);



3. 조회(목록)
/* 회원 목록 */
-- member_no 오름차순
SELECT member_no, member_name, member_email,member_nickname, member_image, 
member_tel, member_zipcode, member_address,member_address2, member_date,act_no
FROM member ORDER BY member_no ASC;

/* 회원 조회 */
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no, visible
FROM member WHERE member_no = 1;


/* 회원 검색 */
-- 이름 검색
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no
FROM member
WHERE member_name LIKE '%member_name%'
ORDER BY member_no ASC;

-- visible 검색
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no
FROM member
WHERE visible LIKE '%Y%'
ORDER BY member_no ASC;

-- 권한으로 검색
SELECT member_no, member_name, member_email, member_nickname, member_image, member_date, act_no
FROM member
WHERE act_no LIKE '%1%'
ORDER BY member_no ASC;


/* QNA 목록 */
-- qna_no 오름차순
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA ORDER BY qna_no ASC;

/* QNA 조회 */
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA WHERE qna_no = 1;

/* QNA 검색 */
-- 카테고리 검색
SELECT  qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA
WHERE qnacategory_no LIKE '%1%'
ORDER BY qna_no ASC;

-- title 검색
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, qna_date, qnacategory_no, member_no
FROM QNA
WHERE qna_title LIKE '%qna_title%'
ORDER BY qna_no ASC;

/**
 * qna 페이징
 */
SELECT qna_no, qna_title, qna_word, qna_image, qna_cnt, qna_grpno, qna_ansnum, qna_indent,
visible, SUBSTRING(qna_date, 1, 10) as qna_date, qnacategory_no, member_no 
FROM QNA
WHERE qna_title LIKE '%qna_title%'
ORDER BY qna_no DESC
LIMIT 0, 5;


/* 로그인 내역*/
SELECT loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no
FROM loginhistory
ORDER BY loginhistory_loginno ASC;

/* 로그인 내역 조회 */
SELECT loginhistory_loginno, loginhistory_ip, loginhistory_email, loginhistory_time, act_no, member_no
FROM loginhistory
WHERE loginhistory_loginno = 1;


/* 펫 목록 */
-- pet_no 오름차순
SELECT pet_no, pet_name, pet_age, pet_weight, 
pet_kind, pet_image, pet_gender, pet_specific, member_no
FROM pet
ORDER BY pet_no ASC;

/* 펫 조회 */
SELECT pet_no, pet_name, pet_age, pet_weight, pet_thumbs, pet_thumb,
pet_kind, pet_image, pet_gender, pet_specific, member_no
FROM pet
WHERE pet_no = 1;


4. 수정
/* 회원 정보 수정 */
UPDATE member
SET member_nickname = '닉네임', member_image='3.jpg',
     member_tel= '010-3071-1323', member_zipcode =00000, member_address = '예산군', member_address2='신장리'
WHERE member_no= 1;

/* 회원 비밀번호 수정 */
UPDATE member
SET member_passwd='12345'
WHERE member_no= 1;

/* 회원 숨김/출력 변경 */
-- 출력 변경
UPDATE member
SET visible='Y' -- 출력
WHERE member_no=1;

UPDATE member
SET visible='N' -- 숨기기
WHERE member_no=1;


/* 회원 권한 변경 */
-- 권한 지정
UPDATE member
SET act_no= 1
WHERE member_no=1;

/* QNA 수정 */
UPDATE QNA
SET qna_title = '수정했음', qna_word='수정됨',qna_image= '3.jpg', visible ='Y'
WHERE member_no= 1;

/* qna 숨김/출력 변경 */
-- 출력 변경
UPDATE QNA
SET visible='Y' -- 출력
WHERE qna_no=1;

UPDATE QNA
SET visible='N' -- 숨기기
WHERE qna_no=1;

/* 기존에 등록된 답변의 증가 처리 */
UPDATE qna
SET qna_ansnum = qna_ansnum + 1
WHERE qnacategory_no = 1 AND qna_grpno = 1 AND ansnum > 부모의 ansnum 컬럼의 값; 'ansnum'

UPDATE qna
SET qna_ansnum = qna_ansnum + 1
WHERE qnacategory_no = 1 AND qna_grpno = 1 AND ansnum > 0;

/* 펫 정보 수정  */
UPDATE pet
SET pet_name = '아롱', pet_age=4,
     pet_weight=5, pet_image = '3.jpg', pet_specific='아련한 표정 잘지음'
WHERE pet_no= 1;

5. 삭제
/* 회원 삭제 */
-- 모두 삭제
DELETE FROM member;
drop from member;
drop from act;

-- 특정 레코드 삭제
DELETE FROM member
WHERE member_no=1;

/* qna 삭제 */
-- 모두 삭제
DELETE FROM QNA;

-- 특정 레코드 삭제
DELETE FROM QNA
WHERE qna_no=1;

/* 로그인 내역 삭제 */
-- 모두 삭제
DELETE FROM loginhistory;
 
-- 특정 레코드 삭제
DELETE FROM loginhistory
WHERE loginhistory_loginno=1;
 
-- FK 테이블에서 사용안되는 레코의 삭제
DELETE FROM loginhistory
WHERE loginhistory_loginno=7;

/* pet 삭제 */
-- 모두 삭제
DELETE FROM pet;
WHERE pet_no = 2;
drop table pet;

-- 특정 레코드 삭제
DELETE FROM pet
WHERE pet_no=1;