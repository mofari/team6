package dev.mvc.product;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.pfreview.ReviewDAOInter;

@Repository("dev.mvc.product.ProductDAO") // DBMS 저장소 접근 
public class ProductDAO implements ProductDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public ProductDAO() {
    System.out.println("--> ProductDAO created.");
  }

  @Override
  public ProductVO product_name_search(int review_no) {
    return sqlSessionTemplate.selectOne("product.product_name_search", review_no);
  }
}
