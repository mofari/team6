1. 테이블 구조
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
    FROM review_reply), 4, 2, '다음에도 구매할거에요 궁금했었는데 도움됐어요 구매해볼게요! 또 구매해요', sysdate)

/**********************************/
/* Table Name: 리뷰 */
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

COMMENT ON TABLE review is '리뷰';
COMMENT ON COLUMN review.review_no is '리뷰 번호';
COMMENT ON COLUMN review.product_no is '상품 번호';
COMMENT ON COLUMN review.member_no is '회원 번호';
COMMENT ON COLUMN review.review_title is '제목';
COMMENT ON COLUMN review.review_content is '내용';
COMMENT ON COLUMN review.review_thumb is '썸네일';
COMMENT ON COLUMN review.review_file is '리뷰 이미지';
COMMENT ON COLUMN review.review_size is '리뷰 이미지 크기';
COMMENT ON COLUMN review.review_grade is '별점';
COMMENT ON COLUMN review.review_good is '좋아요';
COMMENT ON COLUMN review.review_cnt is '조회수';
COMMENT ON COLUMN review.review_reply_cnt is '리뷰 댓글 수';
COMMENT ON COLUMN review.review_rdate is '등록일';
COMMENT ON COLUMN review.review_visible is '출력여부';
COMMENT ON COLUMN review.category_no is '카테고리번호';

SELECT COUNT(*) as review_cnt
    FROM review
    WHERE category_no=1 AND review_title LIKE '%테스%'  
/**********************************/
/* Table Name: 리뷰 댓글 */
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

COMMENT ON TABLE review_reply is '리뷰 댓글';
COMMENT ON COLUMN review_reply.review_reply_no is '리뷰 댓글 번호';
COMMENT ON COLUMN review_reply.review_no is '리뷰 번호';
COMMENT ON COLUMN review_reply.member_no is '회원 번호';
COMMENT ON COLUMN review_reply.review_reply_content is '내용';
COMMENT ON COLUMN review_reply.review_reply_rdate is '등록일';

SELECT *FROM review_reply;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE Category(
		category_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		category_title                		VARCHAR2(10)		 NOT NULL,
		category_rdate                		DATE		 NOT NULL,
		category_cnt                  		NUMBER(10)		 NOT NULL,
		category_seqno                		NUMBER(10)		 NULL ,
		category_visible              		CHAR(1)		 NOT NULL
);

COMMENT ON TABLE Category is '카테고리';
COMMENT ON COLUMN Category.category_no is '카테고리번호';
COMMENT ON COLUMN Category.category_title is '카테고리이름';
COMMENT ON COLUMN Category.category_rdate is '등록일';
COMMENT ON COLUMN Category.category_cnt is '항목 갯수';
COMMENT ON COLUMN Category.category_seqno is '출력순서';
COMMENT ON COLUMN Category.category_visible is '출력모드';

SELECT *FROM Category;
ALTER TABLE Category add category_ids VARCHAR2(30) NULL; 
COMMENT ON COLUMN Category.category_ids is '접근 계정';

ALTER TABLE Category add procate_upno NUMBER(10) DEFAULT 0 NOT NULL;
COMMENT ON COLUMN Category.procate_upno is '상위 카테고리 번호';

ALTER TABLE Category add goods_cnt NUMBER(10) NULL;
COMMENT ON COLUMN Category.goods_cnt is '상품 갯수';

ALTER TABLE review add review_size VARCHAR2(1000) NULL; 
COMMENT ON COLUMN review.review_size is '파일 크기';

ALTER TABLE review add pet_no NUMBER NULL;
COMMENT ON COLUMN review.pet_no is '반려동물 번호';


ALTER TABLE review add word VARCHAR2(100) NULL;
COMMENT ON COLUMN review.word is '검색어';


/**********************************/
/* Table Name: 리뷰 좋아요 */
/**********************************/
CREATE TABLE rgood(
		rgood_no                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		rgood_rdate                   		DATE		 NULL ,
		review_no                     		NUMBER(10)		 NULL ,
		member_no                     		NUMBER(10)		 NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (review_no) REFERENCES review (review_no)
);

COMMENT ON TABLE rgood is '리뷰 좋아요';
COMMENT ON COLUMN rgood.rgood_no is '리뷰 좋아요 번호';
COMMENT ON COLUMN rgood.rgood_rdate is '등록일';
COMMENT ON COLUMN rgood.review_no is '리뷰 번호';
COMMENT ON COLUMN rgood.member_no is '회원 번호';

INSERT INTO review(review_no, product_no, member_no, review_title, 
                                    review_content, review_thumb, review_file, review_size, 
                                   review_grade,
                                   review_rdate) 
      VALUES((SELECT NVL(MAX(review_no), 0)+1 as review_no FROM review),3, 1,
      '냠냠 잘 먹어요', '우리 뚱이가 잘 먹었습니다!!',    
      'product1.jpg', '', 500, 5, sysdate);
      
      SELECT *FROM review;
     
      
2. 등록 
INSERT INTO member(member_no, member_name, member_email, member_passwd, 
member_nickname, member_image, member_tel, member_zipcode, member_address,member_address2
,member_logintype,visible,member_date,act_no)
VALUES ((SELECT NVL(MAX(member_no), 0)+1 as member_no FROM member),
'이승규', '1@naver.com', '1234', 'Q', '2.jpg', '000-0000-0000', 00000, '대전광역시',
'살기좋은동네','K','Y',sysdate,1);

INSERT INTO procate(procate_no, procate_name, procate_upno) VALUES
((SELECT NVL(MAX(procate_no), 0)+1 AS procate_no FROM procate), 'DOG', 0);

INSERT INTO manufacturer(manufacturer_no,
                           manufacturer_name, manufacturer_img, manufacturer_callnumber, manufacturer_zipcode, manufacturer_webpageurl)
VALUES((SELECT NVL(MAX(manufacturer_no), 0)+1 as manufacturer_no FROM manufacturer),
                           'ANF', 'imageroot', '02-548-8186', '서울특별시 강남구 테헤란로 508, 9층(대치동, 해성2빌딩)', 'https://anf.co.kr/');
                           
INSERT INTO country(country_no,country_name) VALUES
((SELECT NVL(MAX(country_no), 0)+1 AS country_no FROM country), '대한민국');

INSERT INTO product(product_no, 
                     manufacturer_no, country_no, procate_no, product_name, product_img, manufacturer, product_introimg, product_target, 
                     product_weight, product_price, product_wprotein, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp, 
                     product_like, product_visible, product_rpcnt, product_rvcnt, product_rdate, product_udate)
VALUES((SELECT NVL(MAX(product_no), 0)+1 AS product_no FROM product), 
                     1, 1, 1, 'ANF 램 홀리스틱 시니어', 'imageroot', '1/2/3/4', 'introimgroot', '7세이상 노령견 용',
                     '2.72kg', 25530, 19.0, 8.0, 11.0, 4.5, 1.45, 1.5, 0, 'Y', 0, 0, sysdate, null);
                     
INSERT INTO product(product_no, 
                     manufacturer_no, country_no, procate_no, product_name, product_img, manufacturer, product_introimg, product_target, 
                     product_weight, product_price, product_wprotein, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp, 
                     product_like, product_visible, product_rpcnt, product_rvcnt, product_rdate, product_udate)
VALUES((SELECT NVL(MAX(product_no), 0)+1 AS product_no FROM product), 
                     1, 1, 1, 'WellPet 램 웰니스 심플 시니어 스몰브리드 살몬 앤 포테이토', 'product3.jpg', '1/2/3/4', 'introimgroot', '성견 용',
                     '2.72kg', 30000, 19.0, 8.0, 11.0, 4.5, 1.45, 1.5, 0, 'Y', 0, 0, sysdate, null);                     
                     
                     INSERT INTO product(product_no, 
                     manufacturer_no, country_no, procate_no, product_name, product_img, manufacturer, product_introimg, product_target, 
                     product_weight, product_price, product_wprotein, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp, 
                     product_like, product_visible, product_rpcnt, product_rvcnt, product_rdate, product_udate)
VALUES((SELECT NVL(MAX(product_no), 0)+1 AS product_no FROM product), 
                     1, 1, 1, '램 펫큐리안 나우 그레인프리 스몰브리드 어덜트', 'imageroot', '1/2/3/4', 'introimgroot', '7세이상 노령견 용',
                     '2.72kg', 25530, 19.0, 8.0, 11.0, 4.5, 1.45, 1.5, 0, 'Y', 0, 0, sysdate, null);
                     SELECT *FROM product;
                     
/* review 테이블 등록 */
INSERT INTO review(review_no, product_no, member_no, review_title, 
																	review_content, review_thumb, review_file, review_size, 
																 review_grade, review_good, review_cnt, review_reply_cnt, 	
																 review_rdate, review_visible) 
VALUES((SELECT NVL(MAX(review_no), 0)+1 as review_no FROM review),1, 1,
'네츄럴코어 유기농 강아지 사료 후기 남겨요!', '저희 집 강아지 코코가 맛있게 잘 먹어요~',		
'', '', 200, 5, 10, 10, 3, sysdate, 'Y');


INSERT INTO review(review_no, product_no, member_no, review_title, 
																	review_content, review_thumb, review_file, review_size, 
																 review_grade, review_good, review_cnt, review_reply_cnt, 	
																 review_rdate, review_visible) 
VALUES((SELECT NVL(MAX(review_no), 0)+1 as review_no FROM review),1, 2,
'우리 고양이 간식 후기!!', '냥이가 잘 먹네요^^ 앞으로도 자주 사줘야겠어요',		
'', '', 300, 4, 7, 3, 4, sysdate, 'Y');						 

SELECT *FROM review;
SELECT *FROM review_reply;


/* review_reply 테이블 등록 */						 
INSERT INTO review_reply(review_reply_no,review_no, 
member_no, review_reply_content, review_reply_rdate) 
VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
FROM review_reply), 1, 2, '저희 집 아롱이도 사줘봐야겠네요: )',sysdate);		

INSERT INTO review_reply(review_reply_no,review_no, 
member_no, review_reply_content, review_reply_rdate) 
VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
FROM review_reply), 4, 3, '궁금했었는데 도움됐어요 구매해볼게요!',  sysdate);		

INSERT INTO review_reply(review_reply_no,review_no, 
member_no, review_reply_content, review_reply_rdate) 
VALUES ((SELECT NVL(MAX(review_reply_no), 0)+1 as review_reply_no 
FROM review_reply), 4, 3, '저희 밍밍이도 잘 먹었어요!! 추천',  sysdate);		

SELECT *FROM review_reply;
/* rgood 테이블 등록 */
INSERT INTO rgood(rgood_no, rgood_rdate, review_no, member_no)
VALUES ((SELECT NVL(MAX(rgood_no), 0)+1 as rgood_no 
FROM rgood), sysdate, 1, 2);

INSERT INTO rgood(rgood_no, rgood_rdate, review_no, member_no)
VALUES ((SELECT NVL(MAX(rgood_no), 0)+1 as rgood_no 
FROM rgood), sysdate, 2, 3);

SELECT *FROM rgood;
SELECT *FROM review;


/* Category 테이블 등록 */
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '개', sysdate, 2, 'Y');

INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '고양이', sysdate, 5, 'Y');

INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '기타', sysdate, 5, 'Y');

-- 강아지 사료
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '사료', sysdate, 0, 'Y', 'admin', 1);

-- 고양이 사료
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '사료', sysdate, 0, 'Y', 'admin', 2);

-- 강아지 건식 사료(6)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '건식 사료', sysdate, 0, 'Y', 'admin', 4);

-- 강아지 습식 사료(7)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '습식 사료', sysdate, 0, 'Y', 'admin', 4);

-- 고양이 건식 사료(8)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '건식 사료', sysdate, 0, 'Y', 'admin', 5);

-- 고양이 습식 사료(9)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '습식 사료', sysdate, 0, 'Y', 'admin', 5);

-- 강아지 간식(10)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '간식', sysdate, 0, 'Y', 'admin', 1);

-- 고양이 간식(11)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '간식', sysdate, 0, 'Y', 'admin', 2);

-- 강아지 건식 간식(12)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '건식 간식', sysdate, 0, 'Y', 'admin', 10);

-- 강아지 건식 간식(13)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '습식 간식', sysdate, 0, 'Y', 'admin', 10);

-- 고양이 건식 간식(14)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '건식 간식', sysdate, 0, 'Y', 'admin', 11);

-- 고양이 건식 간식(15)
INSERT INTO Category(category_no, category_title, category_rdate, 
category_cnt, category_visible, category_ids, procate_upno)
VALUES ((SELECT NVL(MAX(category_no), 0)+1 as category_no 
FROM Category), '습식 간식', sysdate, 0, 'Y', 'admin', 11);



3. 목록(조회)
/* 전체 목록 검색 */
SELECT *FROM review;
SELECT *FROM reply;
SELECT *FROM rgood;

/* 리뷰 전체 목록 */
SELECT review_title, review_thumb, review_grade, review_good, rdate 
FROM review;

SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
          m.member_nickname
FROM review r, member m 
WHERE r.category_no=1 AND r.member_no = m.member_no AND r.review_no=3;

/* 리뷰마다 상품 정보 */
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

/* 리뷰 목록 페이징 */
SELECT review_title, review_thumb, review_grade, review_good, rdate 
FROM review 
ORDER BY review_no 
ASC LIMIT 0, 10;

/* 개 카테고리 리뷰 목록 갯수 */
SELECT COUNT(*) as cnt 
FROM review 
WHERE category_no=1;

/* 고양이 카테고리 리뷰 목록 갯수 */
SELECT COUNT(*) as cnt 
FROM review 
WHERE category_no=2;

/* 개 카테고리의 리뷰 목록 */
SELECT review_no, review_title, review_thumb, review_grade, review_good, review_rdate,category_no 
FROM review 
WHERE category_no=1;

/* 고양이 카테고리의 리뷰 목록 */
SELECT review_title, review_thumb, review_grade, review_good, review_rdate 
FROM review 
WHERE category_no=2;

/* 개 카테고리(1)에서 한 회원(1)의 리뷰(1) 확인하기 */
SELECT product_no, review_title, review_content, 
review_thumb, review_file, review_size, review_grade, 
review_good, review_cnt, review_reply_cnt, review_rdate, review_visible
FROM review 
WHERE member_no=1 AND category_no=1 AND review_no=1;

/* 고양이 카테고리(2)에서 한 회원(3)의 리뷰(1) 확인하기 */
SELECT product_no,  review_title, review_content, 
review_thumb, review_file, review_size, review_grade, 
review_good, review_cnt, review_reply_cnt, review_rdate, review_visible
FROM review 
WHERE member_no=3 AND category_no=2 AND review_no=1;

/* 한 리뷰에 대한 댓글 조회 */
SELECT review_reply_no, member_no, review_reply_content, review_reply_rdate 
FROM review_reply 
WHERE review_no = 4;

/* 개 카테고리 내 한 리뷰의 댓글 갯수 */
SELECT review_reply_cnt 
FROM review 
WHERE review_no=1 
AND category_no=1;

SELECT category_no, category_title, category_rdate, category_cnt, category_seqno, category_visible
FROM Category
WHERE category_no=1;

SELECT *FROM review;

4. 수정
/* 제목 수정 */
UPDATE review 
SET review_title = '네츄럴코어 유기농 후기'
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

/* 조회수 */
UPDATE review 
SET review_cnt = review_cnt + 1 
WHERE review_no=3;

UPDATE review
SET category_no=1
WHERE review_no=2;

/* 댓글 수정 */
UPDATE review_reply 
SET review_reply_content='잘 먹네요' 
WHERE review_reply_no=2;

/* 좋아요 증가 */
UPDATE review 
SET review_good=review_good+1 
WHERE review_no=1;

/* 좋아요 취소(감소) */
UPDATE review 
SET review_good=review_good-1 
WHERE review_no=1;

/* 댓글 작성시 갯수 증가 */
UPDATE review 
SET review_reply_cnt=review_reply_cnt+1 
WHERE review_no=1;

/* visible 여부 변경 */
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
      
5. 삭제
/* 리뷰 한 건 삭제 */
DELETE FROM review
WHERE review_no=1;

SELECT *FROM review;
SELECT *FROM pet;


SELECT *FROM review;

DELETE FROM Category
WHERE category_no=1;

SELECT *FROM Category;
SELECT *FROM review;

/* 좋아요 취소 */
DELETE FROM review_reply 
WHERE review_no=1 AND member_no=1;

DELETE rgood 
WHERE member_no=2 AND review_no=2;

DELETE Category
WHERE category_no=5;

DELETE FROM review
WHERE category_no=1;

DELETE FROM Category;


-- 검색
SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
                  m.member_nickname, r.review_file, p.product_no, p.product_name, p.product_price, p.product_img
      FROM review r, member m, product p 
      WHERE r.category_no=1 AND r.member_no = m.member_no AND r.product_no=p.product_no
      AND (r.review_title LIKE '%테%' OR p.product_name LIKE '%A%')
      ORDER BY review_no DESC
      
      

       SELECT review_no, review_title, review_thumb, review_grade, review_good, review_rdate, category_no, 
                  member_nickname, review_file, product_no, product_name, product_price, product_img, rownum as r
                  (               
											SELECT r.review_no, r.review_title, r.review_thumb, r.review_grade, r.review_good, r.review_rdate, r.category_no, 
                                  m.member_nickname, r.review_file, p.product_no, p.product_name, p.product_price, p.product_img
                      FROM review r, member m, product p                   
                      WHERE r.category_no=1 AND r.member_no = m.member_no AND r.product_no=p.product_no
                      AND (r.review_title LIKE '%테스%' OR p.product_name LIKE '%테스%' 
                        OR m.member_nickname LIKE '%테스%')
                      ORDER BY r.review_no DESC
                    )
      
      
