package dev.mvc.event;

import java.util.HashMap;
import java.util.List;


public interface EventDAOInter {
  
/**
 * �̺�Ʈ ���
 * @param eventVO
 * @return
 */
  public int create(EventVO eventVO);
  
  /**
   * ��ü ���
   * @return
   */
  public List<EventVO> list_event();
  
  /**
   *  ��ȸ
   * @param eventno
   * @return
   */
  public EventVO read(int event_no);
  
  /**
   * ���ڵ� �� ����
   * @return
   */
  public int total_count(HashMap hashMap);
  
  /**
   *  ����¡
   * @param hashMap
   * @return
   */
  public List<EventVO> list_event_paging(HashMap<String, Object> hashMap);
  
  /**
   * ����ó��
   * @param eventVO
   * @return
   */
  public int update(EventVO eventVO);
  
  /**
   * ����
   * @param event_no
   * @return
   */
  public int delete(int event_no);
  
  /**
   * ��ȸ�� ����
   */
  public int increaseView(int event_no);
  
  
}
