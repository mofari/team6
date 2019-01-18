package dev.mvc.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.category.CategoryDAO") // DBMS 저장소 접근 
public class CategoryDAO implements CategoryDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public CategoryDAO() {
    System.out.println("--> CategoryDAO created.");
  }

  @Override
  public int create(CategoryVO categoryVO) {
    return sqlSessionTemplate.insert("category.create", categoryVO);
  }
 
  @Override
  public List<CategoryVO> list() {
    return sqlSessionTemplate.selectList("category.list");
  }
  
  @Override
  public CategoryVO read(int category_no) {
    return sqlSessionTemplate.selectOne("category.read", category_no);
  }
  
  @Override
  public int delete(int category_no){
    return sqlSessionTemplate.delete("category.delete", category_no);
  }

  @Override
  public int update(CategoryVO categoryVO) {
    return sqlSessionTemplate.update("category.update", categoryVO);
  }


  
}












