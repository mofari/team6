package dev.mvc.pfreview;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.pet.PetVO;
import dev.mvc.pfreview.ReviewDAOInter;
import dev.mvc.product.ProductVO;

@Repository("dev.mvc.pfreview.ReviewDAO") // DBMS 저장소 접근 
public class ReviewDAO implements ReviewDAOInter {
  @Autowired  // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public ReviewDAO() {
    System.out.println("--> ReviewDAO created.");
  }
  
/*  @Override
  public List<Review_MemberVO> list(int category_no) {
    return sqlSessionTemplate.selectList("review.list",category_no);
  }*/

  @Override
  public int create(Review_MemberVO review_memberVO) {
    return sqlSessionTemplate.insert("review.create", review_memberVO);
  }

  @Override
  public int increaseCnt(int category_no) {
    return sqlSessionTemplate.update("review.increaseCnt", category_no);
  }

  @Override
  public int decreaseCnt(int category_no) {
    return sqlSessionTemplate.update("review.decreaseCnt", category_no);
  }
  
  @Override
  public List<Review_MemberVO> product_name_search(String product_name) {
    return sqlSessionTemplate.selectList("review.product_name_search", product_name);
  }

  @Override
  public Review_MemberVO read(int review_no) {
    return sqlSessionTemplate.selectOne("review.read", review_no);
  }

  @Override
  public PetVO pet_read(int review_no){
    return sqlSessionTemplate.selectOne("review.pet_read", review_no);
  }

  @Override
  public int update(ReviewVO review_memberVO) {
    return sqlSessionTemplate.update("review.update", review_memberVO);
  }

  @Override
  public int search_count(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("review.search_count", hashMap);
  }

  @Override
  public List<Review_MemberVO> list(HashMap<String, Object> hashMap) {
    return sqlSessionTemplate.selectList("review.list", hashMap);
  }

  @Override
  public ProductVO rproduct_name_search(int review_no) {
    return sqlSessionTemplate.selectOne("review.rproduct_name_search", review_no);
  }

  @Override
  public int reply_cntup(int review_no) {
    return sqlSessionTemplate.update("review.reply_cntup", review_no);
  }

  @Override
  public int reply_cntdown(int review_no) {
    return sqlSessionTemplate.update("review.reply_cntdown", review_no);
  }

  @Override
  public int review_delete(int review_no) {
    return sqlSessionTemplate.delete("review.review_delete", review_no);
  }

  @Override
  public int like_check(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("review.like_check", hashMap);
  }

  @Override
  public int like_up(int review_no) {
    return sqlSessionTemplate.update("review.like_up", review_no);
  }
  
  @Override
  public int like_down(int review_no) {
    return sqlSessionTemplate.update("review.like_down", review_no);
  }

  @Override
  public int like_member_insert(HashMap hashMap) {
    return sqlSessionTemplate.insert("review.like_member_insert", hashMap);
  }

  @Override
  public int like_member_delete(HashMap hashMap) {
    return sqlSessionTemplate.delete("review.like_member_delete", hashMap);
  }

  @Override
  public List<Review_MemberVO> product_data_analysis(int product_no) {
    return sqlSessionTemplate.selectList("review.product_data_analysis", product_no);
  }

  @Override
  public List<Review_MemberVO> member_review_list(int member_no) {
    return sqlSessionTemplate.selectList("review.member_review_list", member_no);
  }

  @Override
  public List<Review_MemberVO> pet_category(HashMap hashMap) {
    return sqlSessionTemplate.selectList("review.pet_category", hashMap);
  }

  @Override
  public List<PetVO> pet_read_mem(int member_no) {
    return sqlSessionTemplate.selectList("review.pet_read_mem", member_no);
  }


}
 