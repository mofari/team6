package dev.mvc.pfreview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.pet.PetVO;
import dev.mvc.product.ProductVO;

public interface ReviewProcInter {
  /**
   * 카테고리 목록
   * @param category_no 카테고리
   * @return 처리된 레코드 갯수
   */
/*  public List<Review_MemberVO> list(int category_no);
*/  
  /**
   * 리뷰 등록
   * @param reivew_memberVO
   * @return
   */
  public int create(Review_MemberVO review_memberVO);
  
  /**
   * 글수 증가
   * @param category_no
   * @return
   */
  public int increaseCnt(int category_no);
  
  public int decreaseCnt(int category_no);

  
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
  
  
 // public int update(Review_MemberVO review_memberVO);
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
  
  
  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param category_no 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param nowPage     현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  public String paging(int category_no, int search_count, int nowPage, String word);
  
  
  public ProductVO rproduct_name_search(int review_no);

  public int reply_cntup(int review_no);
  
  public int reply_cntdown(int review_no);

  public int review_delete(int review_no);
    
  public int like_check(HashMap hashMap);

  public int like_up(int review_no);
  
  public int like_down(int review_no);

  
  public int like_member_insert(HashMap hashMap);

  public int like_member_delete(HashMap hashMap);

  public List<Review_MemberVO> product_data_analysis(int product_no);

  public List<Review_MemberVO> member_review_list(int member_no);

  public List<Review_MemberVO> pet_category(HashMap hashMap);


}
