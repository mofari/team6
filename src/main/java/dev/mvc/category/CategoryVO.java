package dev.mvc.category;

/* 
    category_no                       NUMBER(10)     NOT NULL    PRIMARY KEY,
    category_title                    VARCHAR2(10)     NOT NULL,
    category_rdate                    DATE     NOT NULL,
    category_cnt                      NUMBER(10)     NOT NULL,
    category_seqno                    NUMBER(10)     NULL ,
    category_visible                  CHAR(1)    NOT NULL,
    category_ids                      VARCHAR2(30) NULL
 */
public class CategoryVO {
  private int category_no;
  private String category_title;
  private int category_cnt;
  private int goods_cnt;
  private String category_visible;
  private int category_seqno;
  private String category_rdate;
  private String category_ids;
  private int procate_upno;
  
  public CategoryVO() {

  }

  public CategoryVO(int category_no, String category_title, int category_cnt, int goods_cnt, String category_visible,
      int category_seqno, String category_rdate, String category_ids, int procate_upno) {
    super();
    this.category_no = category_no;
    this.category_title = category_title;
    this.category_cnt = category_cnt;
    this.goods_cnt = goods_cnt;
    this.category_visible = category_visible;
    this.category_seqno = category_seqno;
    this.category_rdate = category_rdate;
    this.category_ids = category_ids;
    this.procate_upno = procate_upno;
  }

  public int getCategory_no() {
    return category_no;
  }

  public void setCategory_no(int category_no) {
    this.category_no = category_no;
  }

  public String getCategory_title() {
    return category_title;
  }

  public void setCategory_title(String category_title) {
    this.category_title = category_title;
  }

  public int getCategory_cnt() {
    return category_cnt;
  }

  public void setCategory_cnt(int category_cnt) {
    this.category_cnt = category_cnt;
  }

  public int getGoods_cnt() {
    return goods_cnt;
  }

  public void setGoods_cnt(int goods_cnt) {
    this.goods_cnt = goods_cnt;
  }

  public String getCategory_visible() {
    return category_visible;
  }

  public void setCategory_visible(String category_visible) {
    this.category_visible = category_visible;
  }

  public int getCategory_seqno() {
    return category_seqno;
  }

  public void setCategory_seqno(int category_seqno) {
    this.category_seqno = category_seqno;
  }

  public String getCategory_rdate() {
    return category_rdate;
  }

  public void setCategory_rdate(String category_rdate) {
    this.category_rdate = category_rdate;
  }

  public String getCategory_ids() {
    return category_ids;
  }

  public void setCategory_ids(String category_ids) {
    this.category_ids = category_ids;
  }

  public int getProcate_upno() {
    return procate_upno;
  }

  public void setProcate_upno(int procate_upno) {
    this.procate_upno = procate_upno;
  }


  
    
}
 
 