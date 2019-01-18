package dev.mvc.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.category.CategoryProc")
public class CategoryProc implements CategoryProcInter {
  @Autowired
  @Qualifier("dev.mvc.category.CategoryDAO")
  private CategoryDAOInter categoryDAO = null;

  public CategoryProc() {
    System.out.println("--> CategoryProc created.");
  }

  @Override
  public int create(CategoryVO categoryVO) {
    return categoryDAO.create(categoryVO);
  }

  @Override
  public List<CategoryVO> list() {
    return categoryDAO.list();
  }
  
  @Override
  public CategoryVO read(int category_no) {
    return categoryDAO.read(category_no);
  }
  
  @Override
  public int delete(int category_no) {
    return categoryDAO.delete(category_no);
  }

  @Override
  public int update(CategoryVO categoryVO) {
    return categoryDAO.update(categoryVO);
  }

}



