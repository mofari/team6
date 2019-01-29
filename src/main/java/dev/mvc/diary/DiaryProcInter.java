package dev.mvc.diary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;








public interface DiaryProcInter {
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
   * ��ü �ۼ�
   * @return
   */
  public int total_count();
  
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

  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param categoryno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  public String paging(int category_no, int search_count, int nowPage, String word);
  
  
}
