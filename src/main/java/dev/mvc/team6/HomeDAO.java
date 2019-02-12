package dev.mvc.team6;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dev.mvc.pfreview.Review_MemberVO;
import dev.mvc.product.OutProductVO;

@Repository("dev.mvc.team6.HomeDAO") // DBMS ����� ���� 
public class HomeDAO implements HomeDAOInter{
  @Autowired  // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
  private SqlSessionTemplate sqlSessionTemplate = null;
  
  public HomeDAO() {
    System.out.println("--> HomeDAO created.");
  }

  @Override
  public List<Review_MemberVO> main_review() {
    return sqlSessionTemplate.selectList("home.main_review");
  }
  
  @Override
  public List<OutProductVO> homeproductlist() {
    return sqlSessionTemplate.selectList("home.homeproductlist");
  }


}
