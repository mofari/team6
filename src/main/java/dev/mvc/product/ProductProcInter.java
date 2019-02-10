package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;
import dev.mvc.manufacturer.ManufacturerVO;

public interface ProductProcInter {

  public int create(ProductVO productVO);

  public List<CategoryVO> select_category_one();
  
  public abstract List<CategoryVO> select_category_two(int categoryno);

  public abstract List<CountryVO> country_list();

  public abstract List<ManufacturerVO> manufacturer_list();

  public abstract List<OutProductVO> outproduct_list(HashMap hashMap);
  
  public int listcount(HashMap hashMap);
  
  public String paging(int search_count, int nowPage, String word, String getparam);
  
  public int delete(int prono);
  
  public abstract OutProductVO read(int prono);

  public abstract int like(HashMap hashMap);

  public abstract int delike(HashMap hashMap);
  
  public int findlike(HashMap hashMap);
  
  public abstract CategoryVO readcategory(int categoryno);
  
  public int update(ProductVO productVO);
}
