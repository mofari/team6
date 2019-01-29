package dev.mvc.diary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;








public interface DiaryProcInter {
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
   * 전체 글수
   * @return
   */
  public int total_count();
  
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

  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param categoryno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  public String paging(int category_no, int search_count, int nowPage, String word);
  
  
}
