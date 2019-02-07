package dev.mvc.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.event.RequestProc")
public class RequestProc implements RequestProcInter{
  @Autowired
  @Qualifier("dev.mvc.request.RequestDAO")
  private RequestDAOInter requestDAO = null;
  
  public RequestProc(){
    System.out.println("--> RequestProc created.");
  }

  @Override
  public int create(RequestVO requestVO) {
    return requestDAO.create(requestVO);
  }

  @Override
  public List<RequestVO> list_event_request(int event_no) {
    return requestDAO.list_event_request(event_no);
  }

  @Override
  public RequestVO read(int event_requestno) {
    return requestDAO.read(event_requestno);
  }

  @Override
  public int update(RequestVO requestVO) {
    return requestDAO.update(requestVO);
  }

  @Override
  public int delete(int event_requestno) {
    return requestDAO.delete(event_requestno);
  }
  
}
