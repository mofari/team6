package dev.mvc.qna;

public class QnACateVO {
  /*qnacategory_no                    NUMBER(10)     NOT NULL    PRIMARY KEY,
  qnacategory_name                  VARCHAR2(16)     NOT NULL,
  qnacategory_ids                      VARCHAR(30)    NULL*/
  private int qnacategory_no;
  private String qnacategory_name;
  private String qnacategory_ids;
  
  
  public QnACateVO() {

  }

  public QnACateVO(int qnacategory_no, String qnacategory_name, String qnacategory_ids) {
    super();
    this.qnacategory_no = qnacategory_no;
    this.qnacategory_name = qnacategory_name;
    this.qnacategory_ids = qnacategory_ids;
  }

  
  public int getQnacategory_no() {
    return qnacategory_no;
  }

  public void setQnacategory_no(int qnacategory_no) {
    this.qnacategory_no = qnacategory_no;
  }

  public String getQnacategory_name() {
    return qnacategory_name;
  }

  public void setQnacategory_name(String qnacategory_name) {
    this.qnacategory_name = qnacategory_name;
  }

  public String getQnacategory_ids() {
    return qnacategory_ids;
  }

  public void setQnacategory_ids(String qnacategory_ids) {
    this.qnacategory_ids = qnacategory_ids;
  }
  
  
}
