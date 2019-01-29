package dev.mvc.manufacturer;
public class ManufacturerVO {
  
  private int manufacturer_no;
  private String manufacturer_name, manufacturer_img, manufacturer_callnumber, manufacturer_zipcode, manufacturer_webpageurl;
  
  public ManufacturerVO() {
  }

  public ManufacturerVO(int manufacturer_no, String manufacturer_name, String manufacturer_img,
      String manufacturer_callnumber, String manufacturer_zipcode, String manufacturer_webpageurl) {
    this.manufacturer_no = manufacturer_no;
    this.manufacturer_name = manufacturer_name;
    this.manufacturer_img = manufacturer_img;
    this.manufacturer_callnumber = manufacturer_callnumber;
    this.manufacturer_zipcode = manufacturer_zipcode;
    this.manufacturer_webpageurl = manufacturer_webpageurl;
  }

  public int getManufacturer_no() {
    return manufacturer_no;
  }

  public void setManufacturer_no(int manufacturer_no) {
    this.manufacturer_no = manufacturer_no;
  }

  public String getManufacturer_name() {
    return manufacturer_name;
  }

  public void setManufacturer_name(String manufacturer_name) {
    this.manufacturer_name = manufacturer_name;
  }

  public String getManufacturer_img() {
    return manufacturer_img;
  }

  public void setManufacturer_img(String manufacturer_img) {
    this.manufacturer_img = manufacturer_img;
  }

  public String getManufacturer_callnumber() {
    return manufacturer_callnumber;
  }

  public void setManufacturer_callnumber(String manufacturer_callnumber) {
    this.manufacturer_callnumber = manufacturer_callnumber;
  }

  public String getManufacturer_zipcode() {
    return manufacturer_zipcode;
  }

  public void setManufacturer_zipcode(String manufacturer_zipcode) {
    this.manufacturer_zipcode = manufacturer_zipcode;
  }

  public String getManufacturer_webpageurl() {
    return manufacturer_webpageurl;
  }

  public void setManufacturer_webpageurl(String manufacturer_webpageurl) {
    this.manufacturer_webpageurl = manufacturer_webpageurl;
  }
  
  
  
  

}
