package dev.mvc.pfreview;

import java.util.HashMap;
import java.util.List;

import dev.mvc.pet.PetVO;
import dev.mvc.product.ProductVO;

public interface ReviewDAOInter {
  /**
   * 리뷰 목록
   * @param category_no 카테고리
   * @return 처리된 레코드 갯수
   */
/*  public List<Review_MemberVO> list(int category_no);*/
  
  /**
   * 리뷰 등록
   * @param reivew_memberVO
   * @return
   */
  public int create(Review_MemberVO reivew_memberVO);
  
  /**
   * 글수 증가
   * @param category_no
   * @return
   */
  public int increaseCnt(int category_no);
  
  /**
   * 상품명 목록
   * @return
   */
  public List<Review_MemberVO> product_name_search(String product_name);
  
  /**
   * 리뷰 읽기
   * @param category_no
   * @param review_no
   * @return
   */
  public Review_MemberVO read(int review_no);
  
  /**
   * 반려동물 정보 읽기
   * @return
   */
  public PetVO pet_read(int review_no);
  
  public int update(ReviewVO review_memberVO);
 
  
  /**
   * category별 검색된 레코드 갯수
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * 검색 목록 + 페이징
   * @param hashMap
   * @return
   */
  public List<Review_MemberVO> list(HashMap<String, Object> hashMap);
  
  public ProductVO rproduct_name_search(int review_no);

}
