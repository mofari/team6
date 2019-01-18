package dev.mvc.review_reply;

public class ReviewReplyVO {
/*  review_reply_no                   NUMBER(10)     NOT NULL    PRIMARY KEY,
  review_no                         NUMBER(10)     NULL ,
  member_no                         NUMBER(10)     NOT NULL,
  review_reply_content              VARCHAR2(500)    NOT NULL,
  review_reply_rdate                VARCHAR2(10)     NULL ,*/
  
  private int review_reply_no;
  private int review_no;
  private int member_no;
  private String review_reply_content;
  private String review_reply_rdate;
  
  
  public ReviewReplyVO(int review_reply_no, int review_no, int member_no, String review_reply_content,
      String review_reply_rdate) {
    super();
    this.review_reply_no = review_reply_no;
    this.review_no = review_no;
    this.member_no = member_no;
    this.review_reply_content = review_reply_content;
    this.review_reply_rdate = review_reply_rdate;
  }


  public ReviewReplyVO() {
    super();
    // TODO Auto-generated constructor stub
  }


  public int getReview_reply_no() {
    return review_reply_no;
  }


  public void setReview_reply_no(int review_reply_no) {
    this.review_reply_no = review_reply_no;
  }


  public int getReview_no() {
    return review_no;
  }


  public void setReview_no(int review_no) {
    this.review_no = review_no;
  }


  public int getMember_no() {
    return member_no;
  }


  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }


  public String getReview_reply_content() {
    return review_reply_content;
  }


  public void setReview_reply_content(String review_reply_content) {
    this.review_reply_content = review_reply_content;
  }


  public String getReview_reply_rdate() {
    return review_reply_rdate;
  }


  public void setReview_reply_rdate(String review_reply_rdate) {
    this.review_reply_rdate = review_reply_rdate;
  }
  
   
}
