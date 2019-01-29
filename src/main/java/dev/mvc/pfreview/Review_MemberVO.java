package dev.mvc.pfreview;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import nation.web.tool.Tool;

/*
 * review_no                        NUMBER(10)     NOT NULL    PRIMARY KEY,
    product_no                        NUMBER(10)     NOT NULL,
    member_no                         NUMBER(10)     NOT NULL,
    review_title                      VARCHAR2(100)    NOT NULL,
    review_content                    VARCHAR2(500)    NOT NULL,
    review_thumb                      VARCHAR2(500)    NULL,
    review_file                       VARCHAR2(500)    NULL,
    review_size                       LONG     NULL,
    review_grade                      NUMBER(5)    NOT NULL,
    review_good                       NUMBER(10)     DEFAULT 0     NULL,
    review_cnt                        NUMBER(10)     DEFAULT 0     NULL,
    review_reply_cnt                  NUMBER(10)     DEFAULT 0     NULL,
    review_rdate                      DATE     NULL,
    review_visible                    CHAR(1)    NULL,
    category_no                       NUMBER(10)     NULL,
    pet_no                               NUMBER NULL
    word                                  VARCHAR2(100)  NULL
 */
public class Review_MemberVO {
  private int no;
  private int review_no;
  private int product_no;
  private int member_no;
  private String review_title;
  private String review_content;
  private String review_thumb;
  private String review_file;
  private String review_size;
  private int review_grade;
  private int review_good;
  private int review_cnt;
  private int review_reply_cnt;
  private String review_rdate;
  private String review_visible;
  private int category_no;
  private int pet_no;
  private String word;
  
  private String member_nickname;
  private String member_image;
  
  private int product_price;
  private String product_name;
  private String product_img;
  private String pet_specific;

  /** 
  Spring Framework에서 자동 주입되는 업로드 파일 객체,
  DBMS 상에 실제 컬럼은 존재하지 않고 파일 임시 저장 목적.
  여러개의 파일 업로드
  */    
  private List<MultipartFile> filesMF;
  
  
  public Review_MemberVO() {
    super();
    // TODO Auto-generated constructor stub
  }
  
  
  public Review_MemberVO(int no, int review_no, int product_no, int member_no, String review_title, String review_content,
      String review_thumb, String review_file, String review_size, int review_grade, int review_good, int review_cnt,
      int review_reply_cnt, String review_rdate, String review_visible, int category_no, String member_nickname,
      String product_name, String product_img, int product_price, int pet_no, String word, String member_image, String pet_specific) {
    super();
    this.no = no;
    this.review_no = review_no;
    this.product_no = product_no;
    this.member_no = member_no;
    this.review_title = review_title;
    this.review_content = review_content;
    this.review_thumb = review_thumb;
    this.review_file = review_file;
    this.review_size = review_size;
    this.review_grade = review_grade;
    this.review_good = review_good;
    this.review_cnt = review_cnt;
    this.review_reply_cnt = review_reply_cnt;
    this.review_rdate = review_rdate;
    this.review_visible = review_visible;
    this.category_no = category_no;
    this.member_nickname = member_nickname;
    this.member_image = member_image;
    this.word = word;
    
    this.product_name = product_name;
    this.product_price = product_price;
    this.product_img = product_img;
    this.pet_no = pet_no;
    this.pet_specific = pet_specific;
  }

  
  public int getNo() {
    return no;
  }


  public void setNo(int no) {
    this.no = no;
  }


  public int getReview_reply_cnt() {
    return review_reply_cnt;
  }


  public void setReview_reply_cnt(int review_reply_cnt) {
    this.review_reply_cnt = review_reply_cnt;
  }


  public int getPet_no() {
    return pet_no;
  }


  public void setPet_no(int pet_no) {
    this.pet_no = pet_no;
  }


  public String getWord() {
    return word;
  }


  public void setWord(String word) {
    this.word = word;
  }


  public int getReview_no() {
    return review_no;
  }
  public void setReview_no(int review_no) {
    this.review_no = review_no;
  }
  public int getProduct_no() {
    return product_no;
  }
  public void setProduct_no(int product_no) {
    this.product_no = product_no;
  }
  public int getMember_no() {
    return member_no;
  }
  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  public String getReview_title() {
    return review_title;
  }
  public void setReview_title(String review_title) {
    this.review_title = review_title;
  }
  public String getReview_content() {
    return review_content;
  }
  public void setReview_content(String review_content) {
    this.review_content = review_content;
  }
  public String getReview_thumb() {
    return review_thumb;
  }
  public void setReview_thumb(String review_thumb) {
    this.review_thumb = review_thumb;
  }
  public String getReview_file() {
    return review_file;
  }
  public void setReview_file(String review_file) {
    this.review_file = review_file;
  }
  public String getReview_size() {
    return review_size;
  }
  public void setReview_size(String review_size) {
    this.review_size = review_size;
  }
  public int getReview_grade() {
    return review_grade;
  }
  public void setReview_grade(int review_grade) {
    this.review_grade = review_grade;
  }
  public int getReview_good() {
    return review_good;
  }
  public void setReview_good(int review_good) {
    this.review_good = review_good;
  }
  public int getReview_cnt() {
    return review_cnt;
  }
  public void setReview_cnt(int review_cnt) {
    this.review_cnt = review_cnt;
  }
  public String getreview_rdate() {
    return review_rdate;
  }
  public void setreview_rdate(String review_rdate) {
    this.review_rdate = review_rdate;
  }
  public String getReview_visible() {
    return review_visible;
  }
  public void setReview_visible(String review_visible) {
    this.review_visible = review_visible;
  }
  public int getCategory_no() {
    return category_no;
  }
  public void setCategory_no(int category_no) {
    this.category_no = category_no;
  }
  public String getMember_nickname() {
    return member_nickname;
  }
  public void setMember_nickname(String member_nickname) {
    this.member_nickname = member_nickname;
  }
  
  public List<MultipartFile> getFilesMF() {
    return filesMF;
  }

  public void setFilesMF(List<MultipartFile> filesMF) {
    this.filesMF = filesMF;
  }


  public int getProduct_price() {
    return product_price;
  }


  public void setProduct_price(int product_price) {
    this.product_price = product_price;
  }


  public String getProduct_name() {
    return product_name;
  }


  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }


  public String getProduct_img() {
    return product_img;
  }


  public void setProduct_img(String product_img) {
    this.product_img = product_img;
  }


  public String getMember_image() {
    return member_image;
  }


  public void setMember_image(String member_image) {
    this.member_image = member_image;
  }


  public String getPet_specific() {
    return pet_specific;
  }


  public void setPet_specific(String pet_specific) {
    this.pet_specific = pet_specific;
  }
  
  
}