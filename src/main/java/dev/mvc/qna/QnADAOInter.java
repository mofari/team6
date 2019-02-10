package dev.mvc.qna;

import java.util.HashMap;
import java.util.List;


public interface QnADAOInter {

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
