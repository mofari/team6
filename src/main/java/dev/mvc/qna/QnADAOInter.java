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
   * �˻� ��� + ����¡
   * @param hashMap
   * @return
   */
  public List<QnAVO> list_by_category_search_paging(HashMap<String, Object> hashMap);
  
  /**
   * category�� �˻��� ���ڵ� ����
   * @return
   */
  public int search_count(HashMap hashMap);
  
  public QnAVO qna_read(int qna_no);
  
  /**
   * �ű� �亯�� �ֿ켱���� ����ϱ����� �亯 ���� ����
   * @param contentsVO
   * @return
   */
  public int updateAnsnum(QnAVO qnaVO);
  
  /**
   * �亯
   * @param contentsVO
   * @return
   */
  public int reply(QnAVO qnaVO);
  
  public int qna_pw(QnAVO qnaVO);
}
