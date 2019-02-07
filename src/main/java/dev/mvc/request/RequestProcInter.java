package dev.mvc.request;

import java.util.List;

public interface RequestProcInter {
    
  /**
   * ��û�� ���
   * @param requestVO
   * @return
   */
    public int create(RequestVO requestVO);
    
    /**
     * ��ü ���
     * @return
     */
    public List<RequestVO> list_event_request(int event_no);
    
    /**
     * ��ȸ
     * @param event_requestno
     * @return
     */
    public RequestVO read(int event_requestno);
    
    /**
     * ����ó��
     * @param requestVO
     * @return
     */
    public int update(RequestVO requestVO);
    
    /**
     * ����
     * @param event_requestno
     * @return
     */
    public int delete(int event_requestno);
    
}
