CREATE TABLE act(
		act_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		act_name                      		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE act is '권한';
COMMENT ON COLUMN act.act_no is '권한번호';
COMMENT ON COLUMN act.act_name is '권한명';


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


/**********************************/
/* Table Name: 이벤트 게시판 */
/**********************************/
CREATE TABLE petfood_event(
event_no                         NUMBER(10)    NOT NULL    PRIMARY KEY,
event_title                      VARCHAR2(500)    NOT NULL,
event_content                    CLOB    NOT NULL,
event_thumb                      VARCHAR2(500)    NULL ,
event_img                        VARCHAR2(500)    NULL ,
event_imgsize                    VARCHAR2(100)    NULL ,
event_good                       NUMBER(10)    NULL ,
event_view                       NUMBER(10)    NULL ,
event_comment                    NUMBER(10)    NULL ,
event_rdate                      DATE    NOT NULL,
event_endrdate                   DATE    NULL,
event_site                       VARCHAR2(300)    NULL,
event_visibel                    CHAR(1)    DEFAULT 'Y'     NOT NULL ,
event_ck                         CHAR(1)    DEFAULT 'Y'    NOT NULL ,
member_no                        NUMBER(10)    NULL ,
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

COMMENT ON TABLE petfood_event is '이벤트 게시판';
COMMENT ON COLUMN petfood_event.event_no is '이벤트 번호';
COMMENT ON COLUMN petfood_event.event_title is '제목';
COMMENT ON COLUMN petfood_event.event_content is '내용';
COMMENT ON COLUMN petfood_event.event_thumb is '썸네일';
COMMENT ON COLUMN petfood_event.event_img is '이벤트 이미지';
COMMENT ON COLUMN petfood_event.event_imgsize is '이벤트 이미지 크기';
COMMENT ON COLUMN petfood_event.event_good is '좋아요수';
COMMENT ON COLUMN petfood_event.event_view is '조회수';
COMMENT ON COLUMN petfood_event.event_comment is '이벤트 댓글수';
COMMENT ON COLUMN petfood_event.event_rdate is '이벤트 등록일';
COMMENT ON COLUMN petfood_event.event_endrdate is '이벤트 종료일';
COMMENT ON COLUMN petfood_event.event_site is '이벤트 사이트';
COMMENT ON COLUMN petfood_event.event_visibel is '숨김';
COMMENT ON COLUMN petfood_event.event_ck is '이벤트 체크';
COMMENT ON COLUMN petfood_event.member_no is '회원번호';


/**********************************/
/* Table Name: 이벤트 신청서 */
/**********************************/
CREATE TABLE event_request(
event_requestno                  NUMBER(10)    NOT NULL    PRIMARY KEY,
event_requestman                 VARCHAR2(100)    NOT NULL,
event_requestphone               VARCHAR2(100)    NOT NULL,
event_requestaddr                VARCHAR2(300)    NOT NULL,
event_no                         NUMBER(10)    NULL ,
event_requestprize               CHAR(1)    DEFAULT 'N'    NOT NULL ,
member_no                        NUMBER(10)    NULL , 
  FOREIGN KEY (event_no) REFERENCES petfood_event (event_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);


COMMENT ON TABLE event_request is '이벤트 신청서';
COMMENT ON COLUMN event_request.event_requestno is '이벤트 신청서 번호';
COMMENT ON COLUMN event_request.event_requestman is '배송 받는사람';
COMMENT ON COLUMN event_request.event_requestphone is '휴대폰 번호';
COMMENT ON COLUMN event_request.event_requestaddr is '주소';
COMMENT ON COLUMN event_request.event_no is '이벤트 번호';
COMMENT ON COLUMN event_request.event_requestprize is '당첨여부';
COMMENT ON COLUMN event_request.member_no is '회원번호';


/**********************************/
/* Table Name: 이벤트 좋아요 */
/**********************************/
CREATE TABLE event_like(
event_likeno                     NUMBER(10)    NOT NULL    PRIMARY KEY,
event_likerdate                  DATE    NOT NULL,
event_no                         NUMBER(10)    NULL ,
member_no                        NUMBER(10)    NULL ,
  FOREIGN KEY (event_no) REFERENCES petfood_event (event_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

COMMENT ON TABLE event_like is '이벤트 좋아요';
COMMENT ON COLUMN event_like.event_likeno is '이벤트좋아요번호';
COMMENT ON COLUMN event_like.event_likerdate is '등록일';
COMMENT ON COLUMN event_like.event_no is '이벤트 번호';
COMMENT ON COLUMN event_like.member_no is '회원번호';



/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE Category(
		category_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		category_title                		VARCHAR2(20)		 NOT NULL,
		category_rdate                		DATE		 NOT NULL,
		category_cnt                  		NUMBER(10)		 NOT NULL,
		category_seqno                		NUMBER(10)		 NULL ,
		category_visible              		CHAR(1)		 NOT NULL,
		category_ids												VARCHAR2(30) NULL,
		procate_upno NUMBER(10) DEFAULT 0 NOT NULL,
		goods_cnt NUMBER(10) DEFAULT 0 NULL
);

COMMENT ON TABLE Category is '카테고리';
COMMENT ON COLUMN Category.category_no is '카테고리번호';
COMMENT ON COLUMN Category.category_title is '카테고리이름';
COMMENT ON COLUMN Category.category_rdate is '등록일';
COMMENT ON COLUMN Category.category_cnt is '항목 갯수';
COMMENT ON COLUMN Category.category_seqno is '출력순서';
COMMENT ON COLUMN Category.category_visible is '출력모드';
COMMENT ON COLUMN Category.category_ids is '접근 계정';
COMMENT ON COLUMN Category.procate_upno is '상위 카테고리 번호';
COMMENT ON COLUMN Category.goods_cnt is '상품 갯수';



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



CREATE TABLE manufacturer(
      manufacturer_no                     NUMBER(10)       NOT NULL PRIMARY KEY,
      manufacturer_name                   VARCHAR2(100)       NOT NULL,
      manufacturer_img                    VARCHAR2(500)       NULL ,
      manufacturer_callnumber             VARCHAR2(15)       NULL ,
      manufacturer_zipcode                VARCHAR2(200)       NULL ,
      manufacturer_webpageurl             VARCHAR2(255)       NULL 
);

COMMENT ON TABLE manufacturer is '제조사';
COMMENT ON COLUMN manufacturer.manufacturer_no is '제조사번호';
COMMENT ON COLUMN manufacturer.manufacturer_name is '제조사명';
COMMENT ON COLUMN manufacturer.manufacturer_img is '제조사로고';
COMMENT ON COLUMN manufacturer.manufacturer_callnumber is '제조사 전화번호';
COMMENT ON COLUMN manufacturer.manufacturer_zipcode is '제조사 주소';
COMMENT ON COLUMN manufacturer.manufacturer_webpageurl is '제조사 홈페이지';


CREATE TABLE country(
      country_no                          NUMBER(10)       NOT NULL PRIMARY KEY,
      country_name                        VARCHAR2(50)       NOT NULL
);

COMMENT ON TABLE country is '제조국';
COMMENT ON COLUMN country.country_no is '국가번호';
COMMENT ON COLUMN country.country_name is '국가명';



CREATE TABLE product(
      product_no                          NUMBER(10)       NOT NULL PRIMARY KEY,
      manufacturer_no                     NUMBER(10)       NOT NULL,
      country_no                          NUMBER(10)       NOT NULL,
      category_no                          NUMBER(10)       NOT NULL,
      product_name                        VARCHAR2(100)       NOT NULL,
      product_img                         VARCHAR2(500)       NULL ,
      material                              VARCHAR2(1000)       NULL ,
      product_introimg                    VARCHAR2(500)       NULL ,
      product_target                      VARCHAR2(30)       NULL ,
      product_weight                      VARCHAR2(20)       NULL ,
      product_price                       NUMBER(10)       NULL ,
      product_wprotein                 FLOAT              NULL ,
      product_wfat                        FLOAT              NULL ,
      product_wash                        FLOAT              NULL ,
      product_wfiber                      FLOAT              NULL ,
      product_wcalcium                 FLOAT              NULL ,
      product_wp                          FLOAT              NULL ,
      product_like                        NUMBER(10)       DEFAULT 0       NOT NULL,
      product_visible                     CHAR(1)       DEFAULT 'Y'       NOT NULL,
      product_rpcnt                       NUMBER(10)       DEFAULT 0       NOT NULL,
      product_rvcnt                       NUMBER(10)       DEFAULT 0       NOT NULL,
      product_rdate                       DATE             NOT NULL,
      product_udate                       DATE               NULL 
);

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.product_no is '상품번호';
COMMENT ON COLUMN product.manufacturer_no is '제조사번호';
COMMENT ON COLUMN product.country_no is '제조국가번호';
COMMENT ON COLUMN product.category_no is '상품카테고리';
COMMENT ON COLUMN product.product_name is '상품명';
COMMENT ON COLUMN product.product_img is '상품이미지';
COMMENT ON COLUMN product.material is '재료';
COMMENT ON COLUMN product.product_introimg is '상품설명이미지';
COMMENT ON COLUMN product.product_target is '상품타겟';
COMMENT ON COLUMN product.product_weight is '상품중량';
COMMENT ON COLUMN product.product_price is '상품가격';
COMMENT ON COLUMN product.product_wprotein is '조단백';
COMMENT ON COLUMN product.product_wfat is '조지방';
COMMENT ON COLUMN product.product_wash is '조회분';
COMMENT ON COLUMN product.product_wfiber is '조섬유';
COMMENT ON COLUMN product.product_wcalcium is '칼슘';
COMMENT ON COLUMN product.product_wp is '인';
COMMENT ON COLUMN product.product_like is '좋아요수';
COMMENT ON COLUMN product.product_visible is '숨김';
COMMENT ON COLUMN product.product_rpcnt is '수정요청수';
COMMENT ON COLUMN product.product_rvcnt is '상품리뷰수';
COMMENT ON COLUMN product.product_rdate is '등록일자';
COMMENT ON COLUMN product.product_udate is '수정일자';



CREATE TABLE prolike(
      prolike_no                          NUMBER(10)       NOT NULL PRIMARY KEY,
      member_no                           NUMBER(10)       NOT NULL,
      product_no                          NUMBER(10)       NOT NULL,
      prolike_rdate                       DATE       NOT NULL
);

COMMENT ON TABLE prolike is '상품좋아요';
COMMENT ON COLUMN prolike.prolike_no is '상품좋아요번호';
COMMENT ON COLUMN prolike.member_no is '회원번호';
COMMENT ON COLUMN prolike.product_no is '상품번호';
COMMENT ON COLUMN prolike.prolike_rdate is '좋아요한날짜';



CREATE TABLE proreport(
      proreport_no                        NUMBER(10)       NOT NULL PRIMARY KEY,
      member_no                           NUMBER(10)       NOT NULL,
      product_no                          NUMBER(10)       NOT NULL,
      proreport_title                  VARCHAR2(100)      NOT NULL,
      proreport_doc                       VARCHAR2(1000)       NOT NULL,
      proreport_img                       VARCHAR2(500)       NULL ,
      proreport_rdate                     DATE       NOT NULL
);

COMMENT ON TABLE proreport is '상품수정요청';
COMMENT ON COLUMN proreport.proreport_no is '상품수정요청번호';
COMMENT ON COLUMN proreport.member_no is '회원번호';
COMMENT ON COLUMN proreport.product_no is '상품번호';
COMMENT ON COLUMN proreport.proreport_doc is '수정요청내용';
COMMENT ON COLUMN proreport.proreport_img is '참고이미지';
COMMENT ON COLUMN proreport.proreport_rdate is '요청일자';


/**********************************/
/* Table Name: 리뷰 */
/**********************************/
CREATE TABLE review(
		review_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		member_no                     		NUMBER(10)		 NOT NULL,
		review_title                  		VARCHAR2(100)		 NOT NULL,
		review_content                		CLOB		 NOT NULL,
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
		pet_no																NUMBER NULL,
		word															  VARCHAR2(100) NULL,
		product_no                    		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (product_no) REFERENCES product (product_no),
  FOREIGN KEY (category_no) REFERENCES Category (category_no),
  FOREIGN KEY (pet_no) REFERENCES pet (pet_no)
);

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
COMMENT ON COLUMN review.pet_no is '반려동물 번호';
COMMENT ON COLUMN review.word is '검색어';



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



/**********************************/
/* Table Name: diary */
/**********************************/
CREATE TABLE diary(  
  diary_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
  category_no    NUMBER(10)          NOT NULL, 
  member_no     NUMBER(10)          NOT NULL,
  diary_title        VARCHAR2(100)     NOT NULL ,
  diary_content   CLOB              NOT NULL,
  diary_like        NUMBER(10)          DEFAULT 0 NOT NULL,
  diary_cnt         NUMBER(10)         DEFAULT 0 NOT NULL, 
  diary_rcnt        NUMBER(10)         DEFAULT 0 NOT NULL, 
  diary_rdate      DATE             NOT NULL ,
  diary_file      VARCHAR2(1000)      NULL ,
  diary_thumb     VARCHAR2(1000)     NULL ,
  diary_size    LONG         NULL ,
  diary_place       VARCHAR2(100)     NULL ,
  diary_visible     CHAR(1)       DEFAULT 'Y' NOT NULL,
  pet_no            NUMBER(10) NULL,

  FOREIGN KEY (category_no) REFERENCES category(category_no),
  FOREIGN KEY (member_no) REFERENCES member(member_no)
);

COMMENT ON TABLE diary is '다이어리';
COMMENT ON COLUMN diary.diary_no is '다이어리 번호';
COMMENT ON COLUMN diary.category_no is '카테고리 번호';
COMMENT ON COLUMN diary.member_no is '회원 번호';
COMMENT ON COLUMN diary.diary_content is '다이어리 내용';
COMMENT ON COLUMN diary.diary_like is '다이어리 내용';
COMMENT ON COLUMN diary.diary_cnt is '다이어리 조회수';
COMMENT ON COLUMN diary.diary_rcnt is '다이어리 댓글수';
COMMENT ON COLUMN diary.diary_like is '다이어리 좋아요 수';
COMMENT ON COLUMN diary.diary_rdate is '등록 날짜';
COMMENT ON COLUMN diary.diary_files is '이미지 파일';
COMMENT ON COLUMN diary.diary_thumbs is '대표 이미지';
COMMENT ON COLUMN diary.diary_sizes is '이미지 사이즈';
COMMENT ON COLUMN diary.diary_place is '다이어리 장소';
COMMENT ON COLUMN diary.diary_visible is '출력모드';
COMMENT ON COLUMN diary.pet_no is '반려동물 번호';


 /**********************************/
/* Table Name: diary_reply */
/**********************************/

--생성
CREATE TABLE diary_reply(
    diary_reply_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
  diary_no    NUMBER(10)          NOT NULL, 
  member_no     NUMBER(10)          NOT NULL,
  diary_reply_content        VARCHAR2(300)     NOT NULL ,
  diary_reply_rdate      DATE             NOT NULL ,
  
  FOREIGN KEY (diary_no) REFERENCES diary(diary_no),
  FOREIGN KEY (member_no) REFERENCES member(member_no)
)
COMMENT ON COLUMN diary_reply.diary_reply_no is '댓글 번호';
COMMENT ON COLUMN diary_reply.diary_no is '다이어리 번호';
COMMENT ON COLUMN diary_reply.member_no is '회원 번호';
COMMENT ON COLUMN diary_reply.diary_reply_content is '댓글 내용';
COMMENT ON COLUMN diary_reply.diary_reply_rdate is '댓글 등록일';


CREATE TABLE diary_like(
   diary_like_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
   diary_no    NUMBER(10)          NOT NULL, 
   member_no     NUMBER(10)          NOT NULL,
   diary_like_rdate  DATE             NOT NULL ,
  FOREIGN KEY (diary_no) REFERENCES diary(diary_no),
  FOREIGN KEY (member_no) REFERENCES member(member_no)
);
COMMENT ON TABLE diary_like is '이벤트 좋아요';
COMMENT ON COLUMN diary_like.diary_like_no is '이벤트좋아요번호';
COMMENT ON COLUMN diary_like.diary_like_rdate is '등록일';
COMMENT ON COLUMN diary_like.diary_no is '이벤트 번호';
COMMENT ON COLUMN diary_like.member_no is '회원번호';
