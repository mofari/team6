package dev.mvc.event;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
  
  /** 이벤트 번호 **/
  private int event_no;
  
  /** 이벤트 제목 **/
  private String event_title;
  
  /** 이벤트 내용**/
  private String event_content;
  
  /** 이벤트 썸네일**/
  private String event_thumb ="";
  
  /** 이벤트 이미지**/
  private String event_img = "";
  
  /** 이벤트 이미지 사이즈**/
  private String event_imgsize ="";
  
  /** 이벤트 좋아요수**/
  private int event_good;
  
  /** 이벤트 조회수**/
  private int event_view;
  
  /** 이벤트 댓글수**/
  private int event_comment;
  
  /** 이벤트 등록일**/
  private String event_rdate;
  
  /** 이벤트 종료일**/
  private String event_endrdate;
  
  /** 이벤트 사이트**/
  private String event_site;
  
  /** 이벤트 숨김**/
  private String event_visibel;
  
  /** 이벤트 활성화 체크**/
  private String event_ck;
  
  /** 회원 번호**/
  private int member_no;
  
  /** 
  Spring Framework에서 자동 주입되는 업로드 파일 객체,
  DBMS 상에 실제 컬럼은 존재하지 않고 파일 임시 저장 목적.
  여러개의 파일 업로드
  */    
  private List<MultipartFile> filesMF;
  
  /** size1의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
  private String sizesLabel;
  
  
  public EventVO() {
    
  }

  public int getEvent_no() {
    return event_no;
  }

  public void setEvent_no(int event_no) {
    this.event_no = event_no;
  }

  public String getEvent_title() {
    return event_title;
  }

  public void setEvent_title(String event_title) {
    this.event_title = event_title;
  }

  public String getEvent_content() {
    return event_content;
  }

  public void setEvent_content(String event_content) {
    this.event_content = event_content;
  }

  public String getEvent_thumb() {
    return event_thumb;
  }

  public void setEvent_thumb(String event_thumb) {
    this.event_thumb = event_thumb;
  }

  public String getEvent_img() {
    if(this.event_img == null){
      return "";
    } else {
      return event_img;
    }
  }

  public void setEvent_img(String event_img) {
    this.event_img = event_img;
  }

  public String getEvent_imgsize() {
    return event_imgsize;
  }

  public void setEvent_imgsize(String event_imgsize) {
    this.event_imgsize = event_imgsize;
  }

  public int getEvent_good() {
    return event_good;
  }

  public void setEvent_good(int event_good) {
    this.event_good = event_good;
  }

  public int getEvent_view() {
    return event_view;
  }

  public void setEvent_view(int event_view) {
    this.event_view = event_view;
  }

  public int getEvent_comment() {
    return event_comment;
  }

  public void setEvent_comment(int event_comment) {
    this.event_comment = event_comment;
  }

  public String getEvent_rdate() {
    return event_rdate;
  }

  public void setEvent_rdate(String event_rdate) {
    this.event_rdate = event_rdate;
  }

  public String getEvent_endrdate() {
    return event_endrdate;
  }

  public void setEvent_endrdate(String event_endrdate) {
    this.event_endrdate = event_endrdate;
  }

  public String getEvent_site() {
    return event_site;
  }

  public void setEvent_site(String event_site) {
    this.event_site = event_site;
  }

  public String getEvent_visibel() {
    return event_visibel;
  }

  public void setEvent_visibel(String event_visibel) {
    this.event_visibel = event_visibel;
  }

  public String getEvent_ck() {
    return event_ck;
  }

  public void setEvent_ck(String event_ck) {
    this.event_ck = event_ck;
  }

  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  
  public List<MultipartFile> getFilesMF() {
    return filesMF;
  }

  public void setFilesMF(List<MultipartFile> filesMF) {
    this.filesMF = filesMF;
  }

  
  
  
  
  
}
