package dev.mvc.diary;

import java.util.HashMap;
import java.util.List;




public interface DiaryDAOInter {
 
  /**
   * ���̾ ���
   * @param diaryVO
   * @return
   */
  public int create(DiaryVO diaryVO);
  /**
   * ī�װ���  ���
   * @return
   */
/*  public List<DiaryVO> list(int category_no);*/
  
  /**
   * ��ȸ 
   * @param diary_no
   * @return
   */
  public DiaryVO read(int diary_no);
  
  /**
   * ����ó��
   * @param vo
   * @return
   */
  public int update(DiaryVO diaryVO);
  
  /**
   * ���� 
   * @param diary_no
   * @return
   */
  public int delete(int diary_no);
  
  /**
   * ��ȸ�� ����
   * 
   */
  public int increseCnt(int diary_no);
  
  /**
   * ��ۼ� ����
   * 
   */
  public int increseRcnt(int diary_no);
  /**
   * ��ۼ� ����
   * 
   */
  public int deincreseRcnt(int diary_no);
  
  /**
   * ��ü �ۼ�
   * @return
   */
  public int total_count();
  
  /**
   * category�� �˻��� ���ڵ� ����
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * �˻� ��� + ����¡
   * @param hashMap
   * @return
   */
  public List<DiaryVO> list_paging(HashMap<String, Object> hashMap);
  
}
