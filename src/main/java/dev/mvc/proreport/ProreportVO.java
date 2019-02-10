package dev.mvc.proreport;

public class ProreportVO {
  
  int proreport_no, member_no, product_no;
  String proreport_title, proreport_doc, proreport_img, proreport_rdate;
  
  
  
  public ProreportVO() {
  }



  public ProreportVO(int proreport_no, int member_no, int product_no, String proreport_title, String proreport_doc,
      String proreport_img, String proreport_rdate) {
    super();
    this.proreport_no = proreport_no;
    this.member_no = member_no;
    this.product_no = product_no;
    this.proreport_title = proreport_title;
    this.proreport_doc = proreport_doc;
    this.proreport_img = proreport_img;
    this.proreport_rdate = proreport_rdate;
  }
  
  

  public String getProreport_title() {
    return proreport_title;
  }



  public void setProreport_title(String proreport_title) {
    this.proreport_title = proreport_title;
  }



  public int getProreport_no() {
    return proreport_no;
  }



  public void setProreport_no(int proreport_no) {
    this.proreport_no = proreport_no;
  }



  public int getMember_no() {
    return member_no;
  }



  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }



  public int getProduct_no() {
    return product_no;
  }



  public void setProduct_no(int product_no) {
    this.product_no = product_no;
  }



  public String getProreport_doc() {
    return proreport_doc;
  }



  public void setProreport_doc(String proreport_doc) {
    this.proreport_doc = proreport_doc;
  }



  public String getProreport_img() {
    return proreport_img;
  }



  public void setProreport_img(String proreport_img) {
    this.proreport_img = proreport_img;
  }



  public String getProreport_rdate() {
    return proreport_rdate;
  }



  public void setProreport_rdate(String proreport_rdate) {
    this.proreport_rdate = proreport_rdate;
  }

  
  
  
}
