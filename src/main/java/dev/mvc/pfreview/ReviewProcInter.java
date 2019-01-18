package dev.mvc.pfreview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.pet.PetVO;

public interface ReviewProcInter {
  /**
   * ī�װ��� ���
   * @param category_no ī�װ���
   * @return ó���� ���ڵ� ����
   */
/*  public List<Review_MemberVO> list(int category_no);
*/  
  /**
   * ���� ���
   * @param reivew_memberVO
   * @return
   */
  public int create(Review_MemberVO review_memberVO);
  
  /**
   * �ۼ� ����
   * @param category_no
   * @return
   */
  public int increaseCnt(int category_no);
  
  /**
   * ��ǰ�� ���
   * @return
   */
  public List<Review_MemberVO> product_name_search(String product_name);
  
  /**
   * ���� �б�
   * @param category_no
   * @param review_no
   * @return
   */
  public Review_MemberVO read(int review_no);
  
  /**
   * �ݷ����� ���� �б�
   * @return
   */
  public PetVO pet_read(int review_no);
  
  
 // public int update(Review_MemberVO review_memberVO);
  public int update(ReviewVO review_memberVO);
  
  
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
  public List<Review_MemberVO> list(HashMap<String, Object> hashMap);
  
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param category_no ī�װ�����ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  public String paging(int category_no, int search_count, int nowPage, String word);
}