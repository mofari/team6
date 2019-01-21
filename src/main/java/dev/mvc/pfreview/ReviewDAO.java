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
}
 