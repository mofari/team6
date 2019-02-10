package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;

public interface QnAProcInter {

  public List<QnACateVO> list();

  public int create(QnACateVO qnacateVO);

  public int update(QnACateVO qnacateVO);

  public QnACateVO read(int qnacategory_no);

  public List<QnACateVO> all_read();

  public int delete(int qnacategory_no);

  public int qna_create(QnAVO qnaVO);

  /**
   * 검색 목록 + 페이징
   * @param hashMap
   * @return
   */
  public List<QnAVO> list_by_category_search_paging(HashMap<String, Object> hashMap);
  
  /**
   * category별 검색된 레코드 갯수
   * @return
   */
  public int search_count(HashMap hashMap);
  
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param qnacategory_no 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  public String paging(int qnacategory_no, int search_count, int nowPage);
  
  public QnAVO qna_read(int qna_no);

  
  /**
   * 신규 답변을 최우선으로 출력하기위한 답변 순서 조절
   * @param contentsVO
   * @return
   */
  public int updateAnsnum(QnAVO qnaVO);
  
  /**
   * 답변
   * @param contentsVO
   * @return
   */
  public int reply(QnAVO qnaVO);
  
  public int qna_pw(QnAVO qnaVO);

}
