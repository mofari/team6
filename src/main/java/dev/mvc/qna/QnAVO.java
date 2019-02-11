package dev.mvc.qna;

public class QnAVO {
/*  qna_no                            NUMBER(10)     NOT NULL    PRIMARY KEY,
  qna_title                         VARCHAR2(50)     NOT NULL,
  qna_content                          VARCHAR2(50)     NOT NULL,
  qna_image                         VARCHAR2(100)    NULL ,
  qna_visible                           CHAR(1)    NOT NULL,
  qna_pw                            VARCHAR2(50)      NULL,
  qna_date                          DATE     NULL ,
  qnacategory_no                    NUMBER(10)     NULL ,
  member_no                         NUMBER(10)     NULL ,
  qna_grpno                         NUMBER(10)     NULL ,
  qna_indent                        NUMBER(10)     NULL ,
  qna_ansnum                        NUMBER(10)     NULL ,*/
  
  private int qna_no;
  private String qna_title;
  private String qna_content;
  private String qna_image;
  private String qna_visible;
  private String qna_pw;
  private String qna_date;
  private int qnacategory_no;
  private int member_no;
  private int qna_grpno;
  private int qna_indent;
  private int qna_ansnum;
  private String word;
  
  private String member_nickname;
  
  public QnAVO() {
    super();
    // TODO Auto-generated constructor stub
  }


  public QnAVO(int qna_no, String qna_title, String qna_content, String qna_image, String qna_visible, String qna_pw,
      String qna_date, int qnacategory_no, int member_no, int qna_grpno, int qna_indent, int qna_ansnum, 
      String member_nickname, String word) {
    super();
    this.qna_no = qna_no;
    this.qna_title = qna_title;
    this.qna_content = qna_content;
    this.qna_image = qna_image;
    this.qna_visible = qna_visible;
    this.qna_pw = qna_pw;
    this.qna_date = qna_date;
    this.qnacategory_no = qnacategory_no;
    this.member_no = member_no;
    this.qna_grpno = qna_grpno;
    this.qna_indent = qna_indent;
    this.qna_ansnum = qna_ansnum;
    this.member_nickname = member_nickname;
    this.word = word;
  }


  public int getQna_no() {
    return qna_no;
  }


  public void setQna_no(int qna_no) {
    this.qna_no = qna_no;
  }


  public String getQna_title() {
    return qna_title;
  }


  public void setQna_title(String qna_title) {
    this.qna_title = qna_title;
  }


  public String getQna_content() {
    return qna_content;
  }


  public void setQna_content(String qna_content) {
    this.qna_content = qna_content;
  }


  public String getQna_image() {
    return qna_image;
  }


  public void setQna_image(String qna_image) {
    this.qna_image = qna_image;
  }


  public String getQna_visible() {
    return qna_visible;
  }


  public void setQna_visible(String qna_visible) {
    this.qna_visible = qna_visible;
  }


  public String getQna_pw() {
    return qna_pw;
  }


  public void setQna_pw(String qna_pw) {
    this.qna_pw = qna_pw;
  }


  public String getQna_date() {
    return qna_date;
  }


  public void setQna_date(String qna_date) {
    this.qna_date = qna_date;
  }


  public int getQnacategory_no() {
    return qnacategory_no;
  }


  public void setQnacategory_no(int qnacategory_no) {
    this.qnacategory_no = qnacategory_no;
  }


  public int getMember_no() {
    return member_no;
  }


  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }


  public int getQna_grpno() {
    return qna_grpno;
  }


  public void setQna_grpno(int qna_grpno) {
    this.qna_grpno = qna_grpno;
  }


  public int getQna_indent() {
    return qna_indent;
  }


  public void setQna_indent(int qna_indent) {
    this.qna_indent = qna_indent;
  }


  public int getQna_ansnum() {
    return qna_ansnum;
  }


  public void setQna_ansnum(int qna_ansnum) {
    this.qna_ansnum = qna_ansnum;
  }


  public String getMember_nickname() {
    return member_nickname;
  }


  public void setMember_nickname(String member_nickname) {
    this.member_nickname = member_nickname;
  }


  public String getWord() {
    return word;
  }


  public void setWord(String word) {
    this.word = word;
  }
  
  
}
