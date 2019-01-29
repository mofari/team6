package dev.mvc.diary;

import java.util.HashMap;
import java.util.List;




public interface DiaryDAOInter {
 
  /**
   * 다이어리 등록
   * @param diaryVO
   * @return
   */
  public int create(DiaryVO diaryVO);
  /**
   * 카테고리별  목록
   * @return
   */
/*  public List<DiaryVO> list(int category_no);*/
  
  /**
   * 조회 
   * @param diary_no
   * @return
   */
  public DiaryVO read(int diary_no);
  
  /**
   * 수정처리
   * @param vo
   * @return
   */
  public int update(DiaryVO diaryVO);
  
  /**
   * 삭제 
   * @param diary_no
   * @return
   */
  public int delete(int diary_no);
  
  /**
   * 조회수 증가
   * 
   */
  public int increseCnt(int diary_no);
  
  /**
   * 댓글수 증가
   * 
   */
  public int increseRcnt(int diary_no);
  /**
   * 댓글수 감소
   * 
   */
  public int deincreseRcnt(int diary_no);
  
  /**
   * 전체 글수
   * @return
   */
  public int total_count();
  
  /**
   * category별 검색된 레코드 갯수
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * 검색 목록 + 페이징
   * @param hashMap
   * @return
   */
  public List<DiaryVO> list_paging(HashMap<String, Object> hashMap);
  
}
