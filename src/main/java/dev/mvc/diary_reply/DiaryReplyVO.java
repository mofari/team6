package dev.mvc.diary_reply;

public class DiaryReplyVO {
//  diary_reply_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
// diary_no    NUMBER(10)          NOT NULL, 
// member_no     NUMBER(10)          NOT NULL,
// diary_reply_content        VARCHAR2(300)     NOT NULL ,
// diary_reply_rdate      DATE             NOT NULL ,
  
  /** 닉네임, member*/
  private String member_nickname;
  /** 이미지, member*/
  private String member_image;
  /** 멤버 번호 **/
  private int member_no;
  /**댓글 번호*/
  private int diary_reply_no;
  /**리뷰 번호*/
  private int diary_no;
  /**댓글 내용*/
  private String diary_reply_content;
  /** 등록일 */
  private String diary_reply_rdate;
  
  public DiaryReplyVO(){
    super();
  }

  public DiaryReplyVO(int member_no, int diary_reply_no, int diary_no, String diary_reply_content,
      String diary_reply_rdate, String member_nickname, String member_image) {
    super();
    this.member_no = member_no;
    this.diary_reply_no = diary_reply_no;
    this.diary_no = diary_no;
    this.diary_reply_content = diary_reply_content;
    this.diary_reply_rdate = diary_reply_rdate;
    this.member_image = member_image;
    this.member_nickname = member_nickname;
  }

  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }

  public int getDiary_reply_no() {
    return diary_reply_no;
  }

  public void setDiary_reply_no(int diary_reply_no) {
    this.diary_reply_no = diary_reply_no;
  }

  public int getDiary_no() {
    return diary_no;
  }

  public void setDiary_no(int diary_no) {
    this.diary_no = diary_no;
  }

  public String getDiary_reply_content() {
    return diary_reply_content;
  }

  public void setDiary_reply_content(String diary_reply_content) {
    this.diary_reply_content = diary_reply_content;
  }

  public String getDiary_reply_rdate() {
    return diary_reply_rdate;
  }

  public void setDiary_reply_rdate(String diary_reply_rdate) {
    this.diary_reply_rdate = diary_reply_rdate;
  }

  public String getMember_nickname() {
    return member_nickname;
  }

  public void setMember_nickname(String member_nickname) {
    this.member_nickname = member_nickname;
  }

  public String getMember_image() {
    return member_image;
  }

  public void setMember_image(String member_image) {
    this.member_image = member_image;
  }
  
  
  
}
