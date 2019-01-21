package dev.mvc.product;

import java.util.List;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;

public interface ProductDAOInter {

  public abstract int create(ProductVO productVO);

  public abstract List<CategoryVO> select_category_one();
  
  public abstract List<CategoryVO> select_category_two(int categoryno);

  public abstract List<CountryVO> country_list();
}
