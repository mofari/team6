package dev.mvc.category;

import java.util.List;

public interface CategoryDAOInter {
  /**
   * �� ī�װ� ���
   * @param categoryVO ����� ������
   * @return ó���� ���ڵ� ����
   */
  public abstract int create(CategoryVO categoryVO);
  
  /**
   * ī�װ� ���
   */
  public List<CategoryVO> list();
  
  /**
   * ī�װ� ��ȸ
   * @param category_no
   * @return
   */
  public CategoryVO read(int category_no);

  /**
   * ī�װ� ����
   * @param category_no
   * @return
   */
  public int delete(int category_no);
  
  /**
   * ī�װ� ����
   * @param categoryVO
   * @return
   */
  public int update(CategoryVO categoryVO);
  
}









