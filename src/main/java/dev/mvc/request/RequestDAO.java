package dev.mvc.request;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.request.RequestDAO") // DBMS 저장소 접근
public class RequestDAO implements RequestDAOInter{
  @Autowired
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public RequestDAO() {
    System.out.println("--> RequestDAO created.");
  }
  
  @Override
  public int create(RequestVO requestVO) {
    return sqlSessionTemplate.insert("request.create", requestVO);
  }

  @Override
  public List<RequestVO> list_event_request(int event_no) {
    return sqlSessionTemplate.selectList("request.list_event_request", event_no);
  }

  @Override
  public RequestVO read(int event_requestno) {
    return sqlSessionTemplate.selectOne("request.read", event_requestno);
  }

  @Override
  public int update(RequestVO requestVO) {
    return sqlSessionTemplate.update("request.update", requestVO);
  }

  @Override
  public int delete(int event_requestno) {
    return sqlSessionTemplate.update("request.delete", event_requestno);
  }

}
