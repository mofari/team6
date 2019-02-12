package dev.mvc.team6;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.pfreview.Review_MemberVO;
import dev.mvc.product.OutProductVO;


@Component("dev.mvc.team6.HomeProc")
public class HomeProc implements HomeProcInter {
  @Autowired
  @Qualifier("dev.mvc.team6.HomeDAO")
  private HomeDAOInter homeDAO = null;
  
  public HomeProc() {
    System.out.println("--> HomeProc created.");
  }

  @Override
  public List<Review_MemberVO> main_review() {
    return homeDAO.main_review();
  }
  
  @Override
  public List<OutProductVO> homeproductlist() {
    return homeDAO.homeproductlist();
  }
}
