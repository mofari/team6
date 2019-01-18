package dev.mvc.product;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.pfreview.ReviewDAOInter;

@Repository("dev.mvc.product.ProductDAO") // DBMS ����� ���� 
public class ProductDAO implements ProductDAOInter {
  @Autowired  // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public ProductDAO() {
    System.out.println("--> ProductDAO created.");
  }

  @Override
  public ProductVO product_name_search(int review_no) {
    return sqlSessionTemplate.selectOne("product.product_name_search", review_no);
  }
}
