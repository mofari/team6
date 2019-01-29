package dev.mvc.product;

public class ProductVO {

  int product_no, manufacturer_no, country_no, category_no, product_price, product_like, product_rpcnt, product_rvcnt;
  String product_name, product_img, material, product_introimg, product_target, product_weight, product_rdate, product_udate;
  char product_visible;
  double product_wprotain, product_wfat, product_wash, product_wfiber, product_wcalcium, product_wp;
  
  public ProductVO() {
  }

  public ProductVO(int product_no, int manufacturer_no, int country_no, int category_no, int product_price,
      int product_like, int product_rpcnt, int product_rvcnt, String product_name, String product_img, String material,
      String product_introimg, String product_target, String product_weight, String product_rdate, String product_udate,
      char product_visible, double product_wprotain, double product_wfat, double product_wash, double product_wfiber,
      double product_wcalcium, double product_wp) {
    this.product_no = product_no;
    this.manufacturer_no = manufacturer_no;
    this.country_no = country_no;
    this.category_no = category_no;
    this.product_price = product_price;
    this.product_like = product_like;
    this.product_rpcnt = product_rpcnt;
    this.product_rvcnt = product_rvcnt;
    this.product_name = product_name;
    this.product_img = product_img;
    this.material = material;
    this.product_introimg = product_introimg;
    this.product_target = product_target;
    this.product_weight = product_weight;
    this.product_rdate = product_rdate;
    this.product_udate = product_udate;
    this.product_visible = product_visible;
    this.product_wprotain = product_wprotain;
    this.product_wfat = product_wfat;
    this.product_wash = product_wash;
    this.product_wfiber = product_wfiber;
    this.product_wcalcium = product_wcalcium;
    this.product_wp = product_wp;
  }

  public int getProduct_no() {
    return product_no;
  }

  public void setProduct_no(int product_no) {
    this.product_no = product_no;
  }

  public int getManufacturer_no() {
    return manufacturer_no;
  }

  public void setManufacturer_no(int manufacturer_no) {
    this.manufacturer_no = manufacturer_no;
  }

  public int getCountry_no() {
    return country_no;
  }

  public void setCountry_no(int country_no) {
    this.country_no = country_no;
  }

  public int getCategory_no() {
    return category_no;
  }

  public void setCategory_no(int category_no) {
    this.category_no = category_no;
  }

  public int getProduct_price() {
    return product_price;
  }

  public void setProduct_price(int product_price) {
    this.product_price = product_price;
  }

  public int getProduct_like() {
    return product_like;
  }

  public void setProduct_like(int product_like) {
    this.product_like = product_like;
  }

  public int getProduct_rpcnt() {
    return product_rpcnt;
  }

  public void setProduct_rpcnt(int product_rpcnt) {
    this.product_rpcnt = product_rpcnt;
  }

  public int getProduct_rvcnt() {
    return product_rvcnt;
  }

  public void setProduct_rvcnt(int product_rvcnt) {
    this.product_rvcnt = product_rvcnt;
  }

  public String getProduct_name() {
    return product_name;
  }

  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }

  public String getProduct_img() {
    return product_img;
  }

  public void setProduct_img(String product_img) {
    this.product_img = product_img;
  }

  public String getMaterial() {
    return material;
  }

  public void setMaterial(String material) {
    this.material = material;
  }

  public String getProduct_introimg() {
    return product_introimg;
  }

  public void setProduct_introimg(String product_introimg) {
    this.product_introimg = product_introimg;
  }

  public String getProduct_target() {
    return product_target;
  }

  public void setProduct_target(String product_target) {
    this.product_target = product_target;
  }

  public String getProduct_weight() {
    return product_weight;
  }

  public void setProduct_weight(String product_weight) {
    this.product_weight = product_weight;
  }

  public String getProduct_rdate() {
    return product_rdate;
  }

  public void setProduct_rdate(String product_rdate) {
    this.product_rdate = product_rdate;
  }

  public String getProduct_udate() {
    return product_udate;
  }

  public void setProduct_udate(String product_udate) {
    this.product_udate = product_udate;
  }

  public char getProduct_visible() {
    return product_visible;
  }

  public void setProduct_visible(char product_visible) {
    this.product_visible = product_visible;
  }

  public double getProduct_wprotain() {
    return product_wprotain;
  }

  public void setProduct_wprotain(double product_wprotain) {
    this.product_wprotain = product_wprotain;
  }

  public double getProduct_wfat() {
    return product_wfat;
  }

  public void setProduct_wfat(double product_wfat) {
    this.product_wfat = product_wfat;
  }

  public double getProduct_wash() {
    return product_wash;
  }

  public void setProduct_wash(double product_wash) {
    this.product_wash = product_wash;
  }

  public double getProduct_wfiber() {
    return product_wfiber;
  }

  public void setProduct_wfiber(double product_wfiber) {
    this.product_wfiber = product_wfiber;
  }

  public double getProduct_wcalcium() {
    return product_wcalcium;
  }

  public void setProduct_wcalcium(double product_wcalcium) {
    this.product_wcalcium = product_wcalcium;
  }

  public double getProduct_wp() {
    return product_wp;
  }

  public void setProduct_wp(double product_wp) {
    this.product_wp = product_wp;
  }
  
  
  

}
