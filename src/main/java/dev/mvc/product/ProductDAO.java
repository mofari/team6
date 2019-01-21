package dev.mvc.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;

@Repository("dev.mvc.product.ProductDAO") // DBMS 저장소 접근 
public class ProductDAO implements ProductDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  
  public ProductDAO() {
    System.out.println("--> ProductDAO created.");
  }


  @Override
  public int create(ProductVO productVO) {
    return sqlSessionTemplate.insert("product.create", productVO);
  }
  
  @Override
  public List<CategoryVO> select_category_one() {
    return sqlSessionTemplate.selectList("product.select_category_one");
  }
  
  @Override
  public List<CategoryVO> select_category_two(int categoryno) {
    return sqlSessionTemplate.selectList("product.select_category_two", categoryno);
  }

  @Override
  public List<CountryVO> country_list() {
    return sqlSessionTemplate.selectList("product.country_list");
  }

}
