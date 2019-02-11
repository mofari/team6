package dev.mvc.loginhistory;

/*CREATE TABLE loginhistory(
    loginhistory_loginno                NUMBER(10)       NOT NULL       PRIMARY KEY,
    loginhistory_ip                     VARCHAR2(30)       NOT NULL,
    loginhistory_email                  VARCHAR2(30)       NOT NULL,
    loginhistory_time                   DATE       NOT NULL,
    act_no                              NUMBER(10)       NOT NULL,
    member_no                           NUMBER(10)       NULL ,
FOREIGN KEY (member_no) REFERENCES member (member_no)
);*/

public class LoginhistoryVO {
  private int loginhistory_loginno;
  private String loginhistory_ip;
  private String loginhistory_email;
  private String loginhistory_time;
  private int act_no;
  private int member_no;
  
  
  public LoginhistoryVO() {

  }


  public int getLoginhistory_loginno() {
    return loginhistory_loginno;
  }


  public void setLoginhistory_loginno(int loginhistory_loginno) {
    this.loginhistory_loginno = loginhistory_loginno;
  }


  public String getLoginhistory_ip() {
    return loginhistory_ip;
  }


  public void setLoginhistory_ip(String loginhistory_ip) {
    this.loginhistory_ip = loginhistory_ip;
  }


  public String getLoginhistory_email() {
    return loginhistory_email;
  }


  public void setLoginhistory_email(String loginhistory_email) {
    this.loginhistory_email = loginhistory_email;
  }


  public String getLoginhistory_time() {
    return loginhistory_time;
  }


  public void setLoginhistory_time(String loginhistory_time) {
    this.loginhistory_time = loginhistory_time;
  }


  public int getAct_no() {
    return act_no;
  }


  public void setAct_no(int act_no) {
    this.act_no = act_no;
  }


  public int getMember_no() {
    return member_no;
  }


  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }


  @Override
  public String toString() {
    return "LoginhistoryVO [loginhistory_loginno=" + loginhistory_loginno + ", loginhistory_ip=" + loginhistory_ip
        + ", loginhistory_email=" + loginhistory_email + ", loginhistory_time=" + loginhistory_time + ", act_no="
        + act_no + ", member_no=" + member_no + "]";
  }

  
  
  
}
