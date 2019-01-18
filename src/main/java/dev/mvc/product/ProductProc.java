package dev.mvc.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


@Component("dev.mvc.product.ProductProc")
public class ProductProc implements ProductProcInter {
  @Autowired
  @Qualifier("dev.mvc.product.ProductDAO")
  private ProductDAOInter productDAO = null;

  public ProductProc() {
    System.out.println("--> ProductProc created.");
  }

  @Override
  public ProductVO product_name_search(int review_no) {
    return productDAO.product_name_search(review_no);
  }
}
