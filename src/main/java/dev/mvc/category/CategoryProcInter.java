package dev.mvc.category;

import java.util.List;

public interface CategoryProcInter {
  /**
   * ���
   * @param categoryVO
   * @return ó���� ����Ʈ ����
   */
  public abstract int create (CategoryVO categoryVO); 

  /**
   * ���
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
  int delete(int category_no);
  
  /**
   * ī�װ� ����
   * @param categoryVO
   * @return
   */
  public int update(CategoryVO categoryVO);
}






