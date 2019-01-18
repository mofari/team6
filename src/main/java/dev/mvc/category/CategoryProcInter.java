package dev.mvc.category;

import java.util.List;

public interface CategoryProcInter {
  /**
   * 등록
   * @param categoryVO
   * @return 처리된 레코트 갯수
   */
  public abstract int create (CategoryVO categoryVO); 

  /**
   * 목록
   */
  public List<CategoryVO> list();
  
  /**
   * 카테고리 조회
   * @param category_no
   * @return
   */
  public CategoryVO read(int category_no);
  
  /**
   * 카테고리 삭제
   * @param category_no
   * @return
   */
  int delete(int category_no);
  
  /**
   * 카테고리 수정
   * @param categoryVO
   * @return
   */
  public int update(CategoryVO categoryVO);
}






