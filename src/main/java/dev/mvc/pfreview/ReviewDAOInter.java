package dev.mvc.pfreview;

import java.util.HashMap;
import java.util.List;

import dev.mvc.pet.PetVO;
import dev.mvc.product.ProductVO;

public interface ReviewDAOInter {
  /**
   * ���� ���
   * @param category_no ī�װ�
   * @return ó���� ���ڵ� ����
   */
/*  public List<Review_MemberVO> list(int category_no);*/
  
  /**
   * ���� ���
   * @param reivew_memberVO
   * @return
   */
  public int create(Review_MemberVO reivew_memberVO);
  
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
  
  public ProductVO rproduct_name_search(int review_no);

}
