package dev.mvc.event;

public class EventgoodVO {
/*  event_likeno                    NUMBER(10)   NOT NULL  PRIMARY KEY,
  event_likerdate                 DATE   NOT NULL,
  event_no                        NUMBER(10)   NULL ,
  member_no                       NUMBER(10)   NULL ,*/
  private int event_likeno;
  private String event_likerdate;
  private int event_no;
  private int member_no;
  
  public EventgoodVO() {
    super();
  }
  
  public EventgoodVO(int event_likeno, String event_likerdate, int event_no, int member_no){
    super();
  this.event_no = event_no;
  this.event_likerdate = event_likerdate;
  this.event_no = event_no;
  this.member_no = member_no;
}

  public int getEvent_likeno() {
    return event_likeno;
  }

  public void setEvent_likeno(int event_likeno) {
    this.event_likeno = event_likeno;
  }

  public String getEvent_likerdate() {
    return event_likerdate;
  }

  public void setEvent_likerdate(String event_likerdate) {
    this.event_likerdate = event_likerdate;
  }

  public int getEvent_no() {
    return event_no;
  }

  public void setEvent_no(int event_no) {
    this.event_no = event_no;
  }

  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }

  
  

}


