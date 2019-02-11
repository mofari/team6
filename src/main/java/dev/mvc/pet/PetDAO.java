package dev.mvc.pet;

import java.util.HashMap;
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
  public List<PetVO> readpet(int member_no) {
    return sqlSessionTemplate.selectList("pet.readpet", member_no);
  }

  @Override
  public int create(PetVO petVO) {
    return sqlSessionTemplate.insert("pet.create", petVO);
  }

  @Override
  public List<PetVO> list() {
    return sqlSessionTemplate.selectList("pet.list");
  }

  @Override
  public int delete(int pet_no) {
    return sqlSessionTemplate.delete("pet.delete", pet_no);
  }

  @Override
  public int search_count(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("pet.search_count", hashMap);
  }

  @Override
  public List<PetVO> list_pet_paging(HashMap<String, Object> hashMap) {
    return sqlSessionTemplate.selectList("pet.list_pet_paging", hashMap);
  }

  @Override
  public PetVO read(int pet_no) {
    return sqlSessionTemplate.selectOne("pet.read", pet_no);
  }

  @Override
  public List<PetVO> mylist(int member_no) {
    return sqlSessionTemplate.selectList("pet.mylist", member_no);
  }

  @Override
  public int update(PetVO petVO) {
    return sqlSessionTemplate.update("pet.update", petVO);
  }


  

}
 