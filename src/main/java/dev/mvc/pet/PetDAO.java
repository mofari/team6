package dev.mvc.pet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.pet.PetDAO") // DBMS 저장소 접근 
public class PetDAO implements PetDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public PetDAO() {
    System.out.println("--> PetDAO created.");
  }
  
  @Override
  public List<PetVO> read(int member_no) {
    return sqlSessionTemplate.selectList("pet.read", member_no);
  }

  

}
 