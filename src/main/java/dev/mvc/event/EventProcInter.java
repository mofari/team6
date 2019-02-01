package dev.mvc.event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public interface EventProcInter {
  
  /**
   * �̺�Ʈ ���
   * @param eventVO
   */
  public int create(EventVO eventVO);
  
  /**
   * ��ü ���
   * @return
   */
  public List<EventVO> list_event();
  
  /**
   * ��ȸ
   * @param event_no
   * @return
   */
  public EventVO read(int event_no);
  
  /**
   * ���� ��� ����
   * @param eventVO
   * @return
   */
  public ArrayList<FileVO> getThumbs(EventVO eventVO);
  
  /**
   * �� ���ڵ� ����
   * @return
   */
  public int total_count(HashMap hashMap);
  
  /**
   * ����¡
   * @param hashMap
   * @return
   */
  public List<EventVO> list_event_paging(HashMap<String, Object> hashMap);
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param nowPage     ���� ������
   * @return ����¡ ���� ���ڿ�
   */ 
  public String paging(int search_count, int nowPage);
  
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
   * ���ƿ� üũ
   * @param hashMap
   * @return
   */
  public int like_check(HashMap hashMap);
  
  /**
   * ���ƿ� ����
   * @param event_no
   * @return
   */
  public int like_up(int event_no);
  
  /**
   * ���ƿ� �ٿ�
   * @param event_no
   * @return
   */
  public int like_down(int event_no);

  /**
   * ���ƿ� ��� ���
   * @param hashMap
   * @return
   */
  public int like_member_insert(HashMap hashMap);

  /**
   * ���ƿ� ��� ����
   * @param hashMap
   * @return
   */
  public int like_member_delete(HashMap hashMap);
  

}
