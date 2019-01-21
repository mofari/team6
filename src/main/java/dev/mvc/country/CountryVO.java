package dev.mvc.country;

public class CountryVO {
  
  int country_no;
  String country_name;
  
  public CountryVO() {
  }

  public CountryVO(int country_no, String country_name) {
    this.country_no = country_no;
    this.country_name = country_name;
  }

  public int getCountry_no() {
    return country_no;
  }

  public void setCountry_no(int country_no) {
    this.country_no = country_no;
  }

  public String getCountry_name() {
    return country_name;
  }

  public void setCountry_name(String country_name) {
    this.country_name = country_name;
  }

}
