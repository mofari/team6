package dev.mvc.pet;

public class PetVO {
 /* pet_no                              NUMBER       NOT NULL       PRIMARY KEY,
  pet_name                            VARCHAR2(10)       NULL ,
  pet_age                             NUMBER(20)       NULL ,
  pet_weight                          NUMBER(20)       NULL ,
  pet_gender                          VARCHAR2(10)       NOT NULL,
  pet_kind                            VARCHAR2(16)       NULL ,
  pet_image                           VARCHAR2(100)       NULL ,
  pet_specific                        VARCHAR2(100)       NULL ,
  member_no                           NUMBER(10)       NULL ,*/
  
  private int pet_no;
  private String pet_name;
  private int pet_age;
  private int pet_weight;
  private String pet_gender;
  private String pet_kind;
  private String pet_image;
  private String pet_specific;
  private int member_no;
  
  
  public PetVO(int pet_no, String pet_name, int pet_age, int pet_weight, String pet_gender, String pet_kind,
      String pet_image, String pet_specific, int member_no) {
    super();
    this.pet_no = pet_no;
    this.pet_name = pet_name;
    this.pet_age = pet_age;
    this.pet_weight = pet_weight;
    this.pet_gender = pet_gender;
    this.pet_kind = pet_kind;
    this.pet_image = pet_image;
    this.pet_specific = pet_specific;
    this.member_no = member_no;
  }


  public PetVO() {
    super();
    // TODO Auto-generated constructor stub
  }


  public int getPet_no() {
    return pet_no;
  }


  public void setPet_no(int pet_no) {
    this.pet_no = pet_no;
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


  public int getPet_weight() {
    return pet_weight;
  }


  public void setPet_weight(int pet_weight) {
    this.pet_weight = pet_weight;
  }


  public String getPet_gender() {
    return pet_gender;
  }


  public void setPet_gender(String pet_gender) {
    this.pet_gender = pet_gender;
  }


  public String getPet_kind() {
    return pet_kind;
  }


  public void setPet_kind(String pet_kind) {
    this.pet_kind = pet_kind;
  }


  public String getPet_image() {
    return pet_image;
  }


  public void setPet_image(String pet_image) {
    this.pet_image = pet_image;
  }


  public String getPet_specific() {
    return pet_specific;
  }


  public void setPet_specific(String pet_specific) {
    this.pet_specific = pet_specific;
  }


  public int getMember_no() {
    return member_no;
  }


  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  
  
}
