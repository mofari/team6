package dev.mvc.proreport;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.parsing.ProblemReporter;
import org.springframework.stereotype.Repository;

import dev.mvc.product.OutProductVO;
import dev.mvc.product.ProductVO;

@Repository("dev.mvc.proreport.ProreportDAO")
public class ProreportDAO implements ProreportDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  @Override
  public ProductVO readproduct(int prono) {
    return sqlSessionTemplate.selectOne("proreport.readproduct", prono);
  }
  
  @Override
  public int create(ProreportVO proreportVO) {
    return sqlSessionTemplate.insert("proreport.create", proreportVO);
  }
  
  @Override
  public List<OutProreportVO> list(HashMap hashMap) {
    return sqlSessionTemplate.selectList("proreport.list", hashMap);
  }
  
  @Override
  public int listcount(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("proreport.listcount", hashMap);
  }

  @Override
  public int reportup(ProreportVO proreportVO) {
    return sqlSessionTemplate.update("proreport.reportup", proreportVO);
  }
  
  @Override
  public int reportdown(int prono) {
    return sqlSessionTemplate.update("proreport.reportdown", prono);
  }

  @Override
  public int delete(int prono) {
    return sqlSessionTemplate.delete("proreport.delete", prono);
  }

  @Override
  public OutProreportVO detail(int rptno) {
    return sqlSessionTemplate.selectOne("proreport.detail", rptno);
  }

}
