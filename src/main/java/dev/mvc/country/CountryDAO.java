package dev.mvc.country;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.country.CountryDAO") // DBMS ����� ���� 
public class CountryDAO implements CountryDAOInter {
  @Autowired  // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
  private SqlSessionTemplate sqlSessionTemplate = null;

  @Override
  public int create(CountryVO countryVO) {
    return sqlSessionTemplate.insert("country.create", countryVO);
  }
  
  @Override
  public List<CountryVO> list() {

    return sqlSessionTemplate.selectList("country.list");
  }

  @Override
  public int delete(int countryno) {
    return sqlSessionTemplate.delete("country.delete", countryno);
  }
  
  @Override
  public CountryVO read(int countryno) {

    return sqlSessionTemplate.selectOne("country.read", countryno);
  }

  @Override
  public int update(CountryVO countryVO) {
    return sqlSessionTemplate.update("country.update", countryVO);
  }

}
