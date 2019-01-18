package dev.mvc.category;

import java.util.List;

public interface CategoryDAOInter {
  /**
   * 새 카테고리 등록
   * @param categoryVO 등록할 데이터
   * @return 처리된 레코드 갯수
   */
  public abstract int create(CategoryVO categoryVO);
  
  /**
   * 카테고리 목록
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
  public int delete(int category_no);
  
  /**
   * 카테고리 수정
   * @param categoryVO
   * @return
   */
  public int update(CategoryVO categoryVO);
  
}









