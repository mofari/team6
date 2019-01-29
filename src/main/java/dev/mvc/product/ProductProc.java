package dev.mvc.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;

@Component("dev.mvc.product.ProductProc")
public class ProductProc implements ProductProcInter {
  @Autowired
  @Qualifier("dev.mvc.product.ProductDAO")
  private ProductDAOInter productDAO = null;

  public ProductProc() {
    System.out.println("--> ProductProc created.");
  }
  
  @Override
  public int create(ProductVO productVO) {
    return productDAO.create(productVO);
  }

  @Override
  public List<CategoryVO> select_category_one() {
    return productDAO.select_category_one();
  }

  @Override
  public List<CategoryVO> select_category_two(int categoryno) {
    return productDAO.select_category_two(categoryno);
  }

  @Override
  public List<CountryVO> country_list() {
    return productDAO.country_list();
  }
  
}
