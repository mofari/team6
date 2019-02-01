package dev.mvc.event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public interface EventProcInter {
  
  /**
   * 이벤트 등록
   * @param eventVO
   */
  public int create(EventVO eventVO);
  
  /**
   * 전체 목록
   * @return
   */
  public List<EventVO> list_event();
  
  /**
   * 조회
   * @param event_no
   * @return
   */
  public EventVO read(int event_no);
  
  /**
   * 파일 목록 추출
   * @param eventVO
   * @return
   */
  public ArrayList<FileVO> getThumbs(EventVO eventVO);
  
  /**
   * 총 레코드 개수
   * @return
   */
  public int total_count(HashMap hashMap);
  
  /**
   * 페이징
   * @param hashMap
   * @return
   */
  public List<EventVO> list_event_paging(HashMap<String, Object> hashMap);
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param nowPage     현재 페이지
   * @return 페이징 생성 문자열
   */ 
  public String paging(int search_count, int nowPage);
  
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
   * 좋아요 체크
   * @param hashMap
   * @return
   */
  public int like_check(HashMap hashMap);
  
  /**
   * 좋아요 증가
   * @param event_no
   * @return
   */
  public int like_up(int event_no);
  
  /**
   * 좋아요 다운
   * @param event_no
   * @return
   */
  public int like_down(int event_no);

  /**
   * 좋아요 멤버 등록
   * @param hashMap
   * @return
   */
  public int like_member_insert(HashMap hashMap);

  /**
   * 좋아요 멤버 삭제
   * @param hashMap
   * @return
   */
  public int like_member_delete(HashMap hashMap);
  

}
