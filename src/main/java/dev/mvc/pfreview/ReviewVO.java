package dev.mvc.pfreview;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
 */
public class ReviewVO {
  private int review_no;
  private int product_no;
  private int member_no;
  private int category_no;
  private String review_title;
  private String review_content;
  private String review_thumb;
  private String review_file;
  private String review_size;


  /** 
  Spring Framework에서 자동 주입되는 업로드 파일 객체,
  DBMS 상에 실제 컬럼은 존재하지 않고 파일 임시 저장 목적.
  여러개의 파일 업로드
  */    
  private List<MultipartFile> filesMF;
  
  
  public ReviewVO() {
    super();
    // TODO Auto-generated constructor stub
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


  public int getCategory_no() {
    return category_no;
  }


  public void setCategory_no(int category_no) {
    this.category_no = category_no;
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


  public List<MultipartFile> getFilesMF() {
    return filesMF;
  }


  public void setFilesMF(List<MultipartFile> filesMF) {
    this.filesMF = filesMF;
  }
  
  

  
  
}