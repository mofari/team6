package dev.mvc.request;

public class RequestVO {
  
  /**  �̺�Ʈ ��û�� ��ȣ **/
  private int event_requestno;
  
  /**  ��� �޴»�� **/
  private String event_requestman;
  
  /**  �޴��� ��ȣ **/
  private String event_requestphone;
  
  /**  �ּ� **/
  private String event_requestaddr;
  
  /**  �̺�Ʈ ��ȣ **/
  private int event_no;
  
  /**  ��÷���� ��ȣ **/
  private String event_requestprize;
  
  /**  ȸ����ȣ **/
  private int member_no;
  
  public RequestVO(){
    
  }

  public int getEvent_requestno() {
    return event_requestno;
  }

  public void setEvent_requestno(int event_requestno) {
    this.event_requestno = event_requestno;
  }

  public String getEvent_requestman() {
    return event_requestman;
  }

  public void setEvent_requestman(String event_requestman) {
    this.event_requestman = event_requestman;
  }

  public String getEvent_requestphone() {
    return event_requestphone;
  }

  public void setEvent_requestphone(String event_requestphone) {
    this.event_requestphone = event_requestphone;
  }

  public String getEvent_requestaddr() {
    return event_requestaddr;
  }

  public void setEvent_requestaddr(String event_requestaddr) {
    this.event_requestaddr = event_requestaddr;
  }

  public int getEvent_no() {
    return event_no;
  }

  public void setEvent_no(int event_no) {
    this.event_no = event_no;
  }

  public String getEvent_requestprize() {
    return event_requestprize;
  }

  public void setEvent_requestprize(String event_requestprize) {
    this.event_requestprize = event_requestprize;
  }

  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  
  
  
}