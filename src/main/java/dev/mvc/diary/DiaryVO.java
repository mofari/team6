package dev.mvc.diary;



import org.springframework.web.multipart.MultipartFile;

/*diary_no         NUMBER(10)          NOT NULL  PRIMARY KEY,
category_no    NUMBER(10)          NOT NULL, 
member_no     NUMBER(10)          NOT NULL,
diary_title        VARCHAR2(100)     NOT NULL ,
diary_content   VARCHAR2(500)            NOT NULL,
diary_like        NUMBER(10)          DEFAULT 0 NOT NULL,
diary_cnt         NUMBER(10)         DEFAULT 0 NOT NULL, 
diary_rcnt        NUMBER(10)         DEFAULT 0 NOT NULL, 
diary_rdate      DATE             NOT NULL ,
diary_files       VARCHAR2(1000)      NULL ,
diary_thumbs     VARCHAR2(1000)     NULL ,
diary_sizes     VARCHAR2(1000)         NULL ,
diary_place       VARCHAR2(100)     NULL ,
diary_visible     CHAR(1)       DEFAULT 'Y' NOT NULL,*/
public class DiaryVO {
  
  /**닉네임, member */
  private String member_nickname;
  /**글 번호 */
  private int diary_no;
  /** 게시판 그룹번호(개,고양이,기타)*/
  private int category_no;
  /** 회원 번호*/
  private int member_no;
  /**제목*/
  private String diary_title;
  /** 내용 */
  private String diary_content;
  /** 추천수*/
  private int diary_like;
  /** 조회수 */
  private int diary_cnt ;
  /** 댓글 수 */
  private int diary_rcnt;
  /** 등록일 */
  private String diary_rdate;
  /** 업로드된 파일 */
  private String diary_file="";
  /** 소형 이미지 */
  private String diary_thumb="";
  /** 업로드된 파일 크기 */
  private long diary_size=0;
  /** 추천 장소*/
  private String diary_place;
  /** 출력 여부*/
  private String diary_visible;
  
  private String word="";
  /** 동물 번호 */
  private int pet_no;
  
  /** 동물 종류*/
 private String pet_kind;
 
 /** 동물 종류*/
 private String pet_name;
 
 /** 동물 종류*/
 private int pet_age;
 
 /** 펫 이미지*/
 private String pet_image;
 
 public String getPet_image() {
  return pet_image;
}

public void setPet_image(String pet_image) {
  this.pet_image = pet_image;
}

public String getMember_image() {
  return member_image;
}

public void setMember_image(String member_image) {
  this.member_image = member_image;
}

/**회원 이미지 */
 private String member_image;
  /** 
  Spring Framework에서 자동 주입되는 업로드 파일 객체,
  DBMS 상에 실제 컬럼은 존재하지 않고 파일 임시 저장 목적.
  여러개의 파일 업로드
  */    
  private MultipartFile file1MF;

  /** size1의 컴마 저장 출력용 변수, 실제 컬럼은 존재하지 않음. */
  private String sizesLabel;
  
  public DiaryVO(){
    
  }

  /*public DiaryVO(String member_nickname, int diary_no, int category_no, int member_no, String diary_title,
      String diary_content, int diary_like, int diary_cnt, int diary_rcnt, String diary_rdate, String diary_file,
      String diary_thumb, long diary_size, String diary_place, String diary_visible, MultipartFile filesMF,
      String sizesLabel, int pet_no, String diary_word) {
    super();
    this.member_nickname = member_nickname;
    this.diary_no = diary_no;
    this.category_no = category_no;
    this.member_no = member_no;
    this.diary_title = diary_title;
    this.diary_content = diary_content;
    this.diary_like = diary_like;
    this.diary_cnt = diary_cnt;
    this.diary_rcnt = diary_rcnt;
    this.diary_rdate = diary_rdate;
    this.diary_file = diary_file;
    this.diary_thumb = diary_thumb;
    this.diary_size = diary_size;
    this.diary_place = diary_place;
    this.diary_visible = diary_visible;
    this.filesMF = filesMF;
    this.sizesLabel = sizesLabel;
    this.pet_no = pet_no;
    this.diary_word =diary_word;
  }*/

  public String getMember_nickname() {
    return member_nickname;
  }

  public void setMember_nickname(String member_nickname) {
    this.member_nickname = member_nickname;
  }

  public int getDiary_no() {
    return diary_no;
  }

  public String getPet_kind() {
    return pet_kind;
  }

  public void setPet_kind(String pet_kind) {
    this.pet_kind = pet_kind;
  }

  public String getPet_name() {
    return pet_name;
  }

  public void setPet_name(String pet_name) {
    this.pet_name = pet_name;
  }

  public int getPet_age() {
    return pet_age;
  }

  public void setPet_age(int pet_age) {
    this.pet_age = pet_age;
  }

  public void setDiary_no(int diary_no) {
    this.diary_no = diary_no;
  }

  public int getCategory_no() {
    return category_no;
  }

  public void setCategory_no(int category_no) {
    this.category_no = category_no;
  }

  public int getMember_no() {
    return member_no;
  }

  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }

  public String getDiary_title() {
    return diary_title;
  }

  public void setDiary_title(String diary_title) {
    this.diary_title = diary_title;
  }

  public String getDiary_content() {
    return diary_content;
  }

  public void setDiary_content(String diary_content) {
    this.diary_content = diary_content;
  }

  public int getDiary_like() {
    return diary_like;
  }

  public void setDiary_like(int diary_like) {
    this.diary_like = diary_like;
  }

  public int getDiary_cnt() {
    return diary_cnt;
  }

  public void setDiary_cnt(int diary_cnt) {
    this.diary_cnt = diary_cnt;
  }

  public int getDiary_rcnt() {
    return diary_rcnt;
  }

  public void setDiary_rcnt(int diary_rcnt) {
    this.diary_rcnt = diary_rcnt;
  }

  public String getDiary_rdate() {
    return diary_rdate;
  }

  public void setDiary_rdate(String diary_rdate) {
    this.diary_rdate = diary_rdate;
  }

  public String getDiary_file() {
    return diary_file;
  }

  public void setDiary_file(String diary_file) {
    this.diary_file = diary_file;
  }

  public String getDiary_thumb() {
    return diary_thumb;
  }

  public void setDiary_thumb(String diary_thumb) {
    this.diary_thumb = diary_thumb;
  }

  public long getDiary_size() {
    return diary_size;
  }

  public void setDiary_size(long diary_size) {
    this.diary_size = diary_size;
  }

  public String getDiary_place() {
    return diary_place;
  }

  public void setDiary_place(String diary_place) {
    this.diary_place = diary_place;
  }

  public String getDiary_visible() {
    return diary_visible;
  }

  public void setDiary_visible(String diary_visible) {
    this.diary_visible = diary_visible;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mF) {
    this.file1MF = file1mF;
  }

  public String getSizesLabel() {
    return sizesLabel;
  }

  public void setSizesLabel(String sizesLabel) {
    this.sizesLabel = sizesLabel;
  }
  public int getPet_no() {
    return pet_no;
  }

  public void setPet_no(int pet_no) {
    this.pet_no = pet_no;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

}
 