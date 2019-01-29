package dev.mvc.event;

import java.util.HashMap;
import java.util.List;


public interface EventDAOInter {
  
/**
 * 이벤트 등록
 * @param eventVO
 * @return
 */
  public int create(EventVO eventVO);
  
  /**
   * 전체 목록
   * @return
   */
  public List<EventVO> list_event();
  
  /**
   *  조회
   * @param eventno
   * @return
   */
  public EventVO read(int event_no);
  
  /**
   * 레코드 총 개수
   * @return
   */
  public int total_count(HashMap hashMap);
  
  /**
   *  페이징
   * @param hashMap
   * @return
   */
  public List<EventVO> list_event_paging(HashMap<String, Object> hashMap);
  
  /**
   * 수정처리
   * @param eventVO
   * @return
   */
  public int update(EventVO eventVO);
  
  /**
   * 삭제
   * @param event_no
   * @return
   */
  public int delete(int event_no);
  
  /**
   * 조회수 증가
   */
  public int increaseView(int event_no);
  
  
}
