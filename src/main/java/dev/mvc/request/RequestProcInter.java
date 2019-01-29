package dev.mvc.request;

import java.util.List;

public interface RequestProcInter {
    
  /**
   * 신청서 등록
   * @param requestVO
   * @return
   */
    public int create(RequestVO requestVO);
    
    /**
     * 전체 목록
     * @return
     */
    public List<RequestVO> list_event_request(int event_no);
    
    /**
     * 조회
     * @param event_requestno
     * @return
     */
    public RequestVO read(int event_requestno);
    
    /**
     * 수정처리
     * @param requestVO
     * @return
     */
    public int update(RequestVO requestVO);
    
    /**
     * 삭제
     * @param event_requestno
     * @return
     */
    public int delete(int event_requestno);
    
}
