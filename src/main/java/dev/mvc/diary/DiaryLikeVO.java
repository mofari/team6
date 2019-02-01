package dev.mvc.diary;

public class DiaryLikeVO {
  /*diary_like_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
  diary_no    NUMBER(10)          NOT NULL, 
  member_no     NUMBER(10)          NOT NULL,*/
  
  private int diary_like_no ;
  private int diary_no;
  private int member_no;
  
  
  public DiaryLikeVO(int diary_like_no, int diary_no, int member_no) {
    super();
    this.diary_like_no = diary_like_no;
    this.diary_no = diary_no;
    this.member_no = member_no;
  }


  public int getDiary_like_no() {
    return diary_like_no;
  }


  public void setDiary_like_no(int diary_like_no) {
    this.diary_like_no = diary_like_no;
  }


  public int getDiary_no() {
    return diary_no;
  }


  public void setDiary_no(int diary_no) {
    this.diary_no = diary_no;
  }


  public int getMember_no() {
    return member_no;
  }


  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  
  
}
