package dev.mvc.event;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.net.aso.h;

@Repository("dev.mvc.event.EventDAO") // DBMS 저장소 접근
public class EventDAO implements EventDAOInter{
  @Autowired
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public EventDAO(){
    System.out.println("--> EventDAO created.");
  }
  
  @Override
  public int create(EventVO eventVO) {
    return sqlSessionTemplate.insert("event.create", eventVO);
  }

  @Override
  public List<EventVO> list_event() {
    return sqlSessionTemplate.selectList("event.list_event");
  }

  @Override
  public EventVO read(int event_no) {
    return sqlSessionTemplate.selectOne("event.read", event_no);
  }
  
  @Override
  public int total_count(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("event.total_count", hashMap);
  }

  @Override
  public List<EventVO> list_event_paging(HashMap<String, Object> hashMap) {
    return sqlSessionTemplate.selectList("event.list_event_paging", hashMap);
  }

  @Override
  public int update(EventVO eventVO) {
    return sqlSessionTemplate.update("event.update", eventVO);
  }

  @Override
  public int delete(int event_no) {
    return sqlSessionTemplate.update("event.delete", event_no);
  }

  @Override
  public int increaseView(int event_no) {
    return sqlSessionTemplate.update("event.increaseView", event_no);
  }

}
