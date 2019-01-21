package dev.mvc.manufacturer;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.manufacturer.ManufacturerDAO") // DBMS ����� ���� 
public class ManufacturerDAO implements ManufacturerDAOInter {
  @Autowired  // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
  private SqlSessionTemplate sqlSessionTemplate = null;

  @Override
  public int create(ManufacturerVO manufacturerVO) {
    return sqlSessionTemplate.insert("manufacturer.create", manufacturerVO);
  }

  @Override
  public List<ManufacturerVO> list(HashMap hashMap) {
    return sqlSessionTemplate.selectList("manufacturer.list", hashMap);
  }

  @Override
  public int delete(int manno) {
    return sqlSessionTemplate.delete("manufacturer.delete", manno);
  }

  @Override
  public int update(ManufacturerVO manufacturerVO) {
    return sqlSessionTemplate.update("manufacturer.update",manufacturerVO);
  }
  
  @Override
  public int updateimg(ManufacturerVO manufacturerVO) {
    return sqlSessionTemplate.update("manufacturer.updateimg",manufacturerVO);
  }
  
  @Override
  public ManufacturerVO read(int manno) {
    return sqlSessionTemplate.selectOne("manufacturer.read", manno);
  }
  
  @Override
  public int listcount(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("manufacturer.listcount", hashMap);
  }

}
