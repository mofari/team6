CREATE TABLE act(
		act_no                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		act_name                      		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE act is '����';
COMMENT ON COLUMN act.act_no is '���ѹ�ȣ';
COMMENT ON COLUMN act.act_name is '���Ѹ�';


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


/**********************************/
/* Table Name: �̺�Ʈ �Խ��� */
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

COMMENT ON TABLE petfood_event is '�̺�Ʈ �Խ���';
COMMENT ON COLUMN petfood_event.event_no is '�̺�Ʈ ��ȣ';
COMMENT ON COLUMN petfood_event.event_title is '����';
COMMENT ON COLUMN petfood_event.event_content is '����';
COMMENT ON COLUMN petfood_event.event_thumb is '�����';
COMMENT ON COLUMN petfood_event.event_img is '�̺�Ʈ �̹���';
COMMENT ON COLUMN petfood_event.event_imgsize is '�̺�Ʈ �̹��� ũ��';
COMMENT ON COLUMN petfood_event.event_good is '���ƿ��';
COMMENT ON COLUMN petfood_event.event_view is '��ȸ��';
COMMENT ON COLUMN petfood_event.event_comment is '�̺�Ʈ ��ۼ�';
COMMENT ON COLUMN petfood_event.event_rdate is '�̺�Ʈ �����';
COMMENT ON COLUMN petfood_event.event_endrdate is '�̺�Ʈ ������';
COMMENT ON COLUMN petfood_event.event_site is '�̺�Ʈ ����Ʈ';
COMMENT ON COLUMN petfood_event.event_visibel is '����';
COMMENT ON COLUMN petfood_event.event_ck is '�̺�Ʈ üũ';
COMMENT ON COLUMN petfood_event.member_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: �̺�Ʈ ��û�� */
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


COMMENT ON TABLE event_request is '�̺�Ʈ ��û��';
COMMENT ON COLUMN event_request.event_requestno is '�̺�Ʈ ��û�� ��ȣ';
COMMENT ON COLUMN event_request.event_requestman is '��� �޴»��';
COMMENT ON COLUMN event_request.event_requestphone is '�޴��� ��ȣ';
COMMENT ON COLUMN event_request.event_requestaddr is '�ּ�';
COMMENT ON COLUMN event_request.event_no is '�̺�Ʈ ��ȣ';
COMMENT ON COLUMN event_request.event_requestprize is '��÷����';
COMMENT ON COLUMN event_request.member_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: �̺�Ʈ ���ƿ� */
/**********************************/
CREATE TABLE event_like(
event_likeno                     NUMBER(10)    NOT NULL    PRIMARY KEY,
event_likerdate                  DATE    NOT NULL,
event_no                         NUMBER(10)    NULL ,
member_no                        NUMBER(10)    NULL ,
  FOREIGN KEY (event_no) REFERENCES petfood_event (event_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

COMMENT ON TABLE event_like is '�̺�Ʈ ���ƿ�';
COMMENT ON COLUMN event_like.event_likeno is '�̺�Ʈ���ƿ��ȣ';
COMMENT ON COLUMN event_like.event_likerdate is '�����';
COMMENT ON COLUMN event_like.event_no is '�̺�Ʈ ��ȣ';
COMMENT ON COLUMN event_like.member_no is 'ȸ����ȣ';



/**********************************/
/* Table Name: ī�װ� */
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

COMMENT ON TABLE Category is 'ī�װ�';
COMMENT ON COLUMN Category.category_no is 'ī�װ���ȣ';
COMMENT ON COLUMN Category.category_title is 'ī�װ��̸�';
COMMENT ON COLUMN Category.category_rdate is '�����';
COMMENT ON COLUMN Category.category_cnt is '�׸� ����';
COMMENT ON COLUMN Category.category_seqno is '��¼���';
COMMENT ON COLUMN Category.category_visible is '��¸��';
COMMENT ON COLUMN Category.category_ids is '���� ����';
COMMENT ON COLUMN Category.procate_upno is '���� ī�װ� ��ȣ';
COMMENT ON COLUMN Category.goods_cnt is '��ǰ ����';



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



CREATE TABLE manufacturer(
      manufacturer_no                     NUMBER(10)       NOT NULL PRIMARY KEY,
      manufacturer_name                   VARCHAR2(100)       NOT NULL,
      manufacturer_img                    VARCHAR2(500)       NULL ,
      manufacturer_callnumber             VARCHAR2(15)       NULL ,
      manufacturer_zipcode                VARCHAR2(200)       NULL ,
      manufacturer_webpageurl             VARCHAR2(255)       NULL 
);

COMMENT ON TABLE manufacturer is '������';
COMMENT ON COLUMN manufacturer.manufacturer_no is '�������ȣ';
COMMENT ON COLUMN manufacturer.manufacturer_name is '�������';
COMMENT ON COLUMN manufacturer.manufacturer_img is '������ΰ�';
COMMENT ON COLUMN manufacturer.manufacturer_callnumber is '������ ��ȭ��ȣ';
COMMENT ON COLUMN manufacturer.manufacturer_zipcode is '������ �ּ�';
COMMENT ON COLUMN manufacturer.manufacturer_webpageurl is '������ Ȩ������';


CREATE TABLE country(
      country_no                          NUMBER(10)       NOT NULL PRIMARY KEY,
      country_name                        VARCHAR2(50)       NOT NULL
);

COMMENT ON TABLE country is '������';
COMMENT ON COLUMN country.country_no is '������ȣ';
COMMENT ON COLUMN country.country_name is '������';



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

COMMENT ON TABLE product is '��ǰ';
COMMENT ON COLUMN product.product_no is '��ǰ��ȣ';
COMMENT ON COLUMN product.manufacturer_no is '�������ȣ';
COMMENT ON COLUMN product.country_no is '����������ȣ';
COMMENT ON COLUMN product.category_no is '��ǰī�װ�';
COMMENT ON COLUMN product.product_name is '��ǰ��';
COMMENT ON COLUMN product.product_img is '��ǰ�̹���';
COMMENT ON COLUMN product.material is '���';
COMMENT ON COLUMN product.product_introimg is '��ǰ�����̹���';
COMMENT ON COLUMN product.product_target is '��ǰŸ��';
COMMENT ON COLUMN product.product_weight is '��ǰ�߷�';
COMMENT ON COLUMN product.product_price is '��ǰ����';
COMMENT ON COLUMN product.product_wprotein is '���ܹ�';
COMMENT ON COLUMN product.product_wfat is '������';
COMMENT ON COLUMN product.product_wash is '��ȸ��';
COMMENT ON COLUMN product.product_wfiber is '������';
COMMENT ON COLUMN product.product_wcalcium is 'Į��';
COMMENT ON COLUMN product.product_wp is '��';
COMMENT ON COLUMN product.product_like is '���ƿ��';
COMMENT ON COLUMN product.product_visible is '����';
COMMENT ON COLUMN product.product_rpcnt is '������û��';
COMMENT ON COLUMN product.product_rvcnt is '��ǰ�����';
COMMENT ON COLUMN product.product_rdate is '�������';
COMMENT ON COLUMN product.product_udate is '��������';



CREATE TABLE prolike(
      prolike_no                          NUMBER(10)       NOT NULL PRIMARY KEY,
      member_no                           NUMBER(10)       NOT NULL,
      product_no                          NUMBER(10)       NOT NULL,
      prolike_rdate                       DATE       NOT NULL
);

COMMENT ON TABLE prolike is '��ǰ���ƿ�';
COMMENT ON COLUMN prolike.prolike_no is '��ǰ���ƿ��ȣ';
COMMENT ON COLUMN prolike.member_no is 'ȸ����ȣ';
COMMENT ON COLUMN prolike.product_no is '��ǰ��ȣ';
COMMENT ON COLUMN prolike.prolike_rdate is '���ƿ��ѳ�¥';



CREATE TABLE proreport(
      proreport_no                        NUMBER(10)       NOT NULL PRIMARY KEY,
      member_no                           NUMBER(10)       NOT NULL,
      product_no                          NUMBER(10)       NOT NULL,
      proreport_title                  VARCHAR2(100)      NOT NULL,
      proreport_doc                       VARCHAR2(1000)       NOT NULL,
      proreport_img                       VARCHAR2(500)       NULL ,
      proreport_rdate                     DATE       NOT NULL
);

COMMENT ON TABLE proreport is '��ǰ������û';
COMMENT ON COLUMN proreport.proreport_no is '��ǰ������û��ȣ';
COMMENT ON COLUMN proreport.member_no is 'ȸ����ȣ';
COMMENT ON COLUMN proreport.product_no is '��ǰ��ȣ';
COMMENT ON COLUMN proreport.proreport_doc is '������û����';
COMMENT ON COLUMN proreport.proreport_img is '�����̹���';
COMMENT ON COLUMN proreport.proreport_rdate is '��û����';


/**********************************/
/* Table Name: ���� */
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
COMMENT ON COLUMN review.pet_no is '�ݷ����� ��ȣ';
COMMENT ON COLUMN review.word is '�˻���';



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

COMMENT ON TABLE diary is '���̾';
COMMENT ON COLUMN diary.diary_no is '���̾ ��ȣ';
COMMENT ON COLUMN diary.category_no is 'ī�װ� ��ȣ';
COMMENT ON COLUMN diary.member_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN diary.diary_content is '���̾ ����';
COMMENT ON COLUMN diary.diary_like is '���̾ ����';
COMMENT ON COLUMN diary.diary_cnt is '���̾ ��ȸ��';
COMMENT ON COLUMN diary.diary_rcnt is '���̾ ��ۼ�';
COMMENT ON COLUMN diary.diary_like is '���̾ ���ƿ� ��';
COMMENT ON COLUMN diary.diary_rdate is '��� ��¥';
COMMENT ON COLUMN diary.diary_files is '�̹��� ����';
COMMENT ON COLUMN diary.diary_thumbs is '��ǥ �̹���';
COMMENT ON COLUMN diary.diary_sizes is '�̹��� ������';
COMMENT ON COLUMN diary.diary_place is '���̾ ���';
COMMENT ON COLUMN diary.diary_visible is '��¸��';
COMMENT ON COLUMN diary.pet_no is '�ݷ����� ��ȣ';


 /**********************************/
/* Table Name: diary_reply */
/**********************************/

--����
CREATE TABLE diary_reply(
    diary_reply_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
  diary_no    NUMBER(10)          NOT NULL, 
  member_no     NUMBER(10)          NOT NULL,
  diary_reply_content        VARCHAR2(300)     NOT NULL ,
  diary_reply_rdate      DATE             NOT NULL ,
  
  FOREIGN KEY (diary_no) REFERENCES diary(diary_no),
  FOREIGN KEY (member_no) REFERENCES member(member_no)
)
COMMENT ON COLUMN diary_reply.diary_reply_no is '��� ��ȣ';
COMMENT ON COLUMN diary_reply.diary_no is '���̾ ��ȣ';
COMMENT ON COLUMN diary_reply.member_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN diary_reply.diary_reply_content is '��� ����';
COMMENT ON COLUMN diary_reply.diary_reply_rdate is '��� �����';


CREATE TABLE diary_like(
   diary_like_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
   diary_no    NUMBER(10)          NOT NULL, 
   member_no     NUMBER(10)          NOT NULL,
   diary_like_rdate  DATE             NOT NULL ,
  FOREIGN KEY (diary_no) REFERENCES diary(diary_no),
  FOREIGN KEY (member_no) REFERENCES member(member_no)
);
COMMENT ON TABLE diary_like is '�̺�Ʈ ���ƿ�';
COMMENT ON COLUMN diary_like.diary_like_no is '�̺�Ʈ���ƿ��ȣ';
COMMENT ON COLUMN diary_like.diary_like_rdate is '�����';
COMMENT ON COLUMN diary_like.diary_no is '�̺�Ʈ ��ȣ';
COMMENT ON COLUMN diary_like.member_no is 'ȸ����ȣ';
