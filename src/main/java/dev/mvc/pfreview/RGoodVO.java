package dev.mvc.pfreview;

public class RGoodVO {
/*  rgood_no                          NUMBER(10)     NOT NULL    PRIMARY KEY,
  rgood_rdate                       DATE     NULL ,
  review_no                         NUMBER(10)     NULL ,
  member_no                         NUMBER(10)     NULL ,*/
  private int rgood_no;
  private String rgood_rdate;
  private int review_no;
  private int member_no;
  
  
  public RGoodVO() {
    super();
    // TODO Auto-generated constructor stub
  }


  public RGoodVO(int rgood_no, String rgood_rdate, int review_no, int member_no) {
    super();
    this.rgood_no = rgood_no;
    this.rgood_rdate = rgood_rdate;
    this.review_no = review_no;
    this.member_no = member_no;
  }


  public int getRgood_no() {
    return rgood_no;
  }


  public void setRgood_no(int rgood_no) {
    this.rgood_no = rgood_no;
  }


  public String getRgood_rdate() {
    return rgood_rdate;
  }


  public void setRgood_rdate(String rgood_rdate) {
    this.rgood_rdate = rgood_rdate;
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
  
  
}
