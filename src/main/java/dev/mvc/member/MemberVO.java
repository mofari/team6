package dev.mvc.member;

import oracle.sql.CHAR;

/*CREATE TABLE member(
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
);*/
public class MemberVO {
  private int member_no;
  private String member_name;
  private String member_email;
  private String member_passwd;
  private String member_nickname;
  private String member_image;
  private String member_tel;
  private int member_zipcode;
  private String member_address;
  private String member_address2;
  private char member_logintype;
  private char visible;
  private String member_date;
  private int act_no;



  public MemberVO() {

  }





  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }

  public String getMember_name() {
    return member_name;
  }

  public void setMember_name(String member_name) {
    this.member_name = member_name;
  }

  public String getMember_email() {
    return member_email;
  }

  public void setMember_email(String member_email) {
    this.member_email = member_email;
  }

  public String getMember_passwd() {
    return member_passwd;
  }

  public void setMember_passwd(String member_passwd) {
    this.member_passwd = member_passwd;
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

  public String getMember_tel() {
    return member_tel;
  }

  public void setMember_tel(String member_tel) {
    this.member_tel = member_tel;
  }

  public int getMember_zipcode() {
    return member_zipcode;
  }

  public void setMember_zipcode(int member_zipcode) {
    this.member_zipcode = member_zipcode;
  }

  public String getMember_address() {
    return member_address;
  }

  public void setMember_address(String member_address) {
    this.member_address = member_address;
  }

  public String getMember_address2() {
    return member_address2;
  }

  public void setMember_address2(String member_address2) {
    this.member_address2 = member_address2;
  }

  public char getMember_logintype() {
    return member_logintype;
  }

  public void setMember_logintype(char member_logintype) {
    this.member_logintype = member_logintype;
  }

  public char getVisible() {
    return visible;
  }

  public void setVisible(char visible) {
    this.visible = visible;
  }

  public String getMember_date() {
    return member_date;
  }

  public void setMember_date(String member_date) {
    this.member_date = member_date;
  }

  public int getAct_no() {
    return act_no;
  }

  public void setAct_no(int act_no) {
    this.act_no = act_no;
  }

  @Override
  public String toString() {
    return "memberVO [member_no=" + member_no + ", member_name=" + member_name + ", member_email=" + member_email
        + ", member_passwd=" + member_passwd + ", member_nickname=" + member_nickname + ", member_image=" + member_image
        + ", member_tel=" + member_tel + ", member_zipcode=" + member_zipcode + ", member_address=" + member_address
        + ", member_address2=" + member_address2 + ", member_logintype=" + member_logintype + ", visible="
        + visible + ", member_date=" + member_date + ", act_no=" + act_no + "]";
  }


}
