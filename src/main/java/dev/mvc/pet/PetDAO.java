package dev.mvc.pet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.pet.PetDAO") // DBMS ����� ���� 
public class PetDAO implements PetDAOInter {
  @Autowired  // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public PetDAO() {
    System.out.println("--> PetDAO created.");
  }
  
  @Override
  public List<PetVO> read(int member_no) {
    return sqlSessionTemplate.selectList("pet.read", member_no);
  }

  

}
 