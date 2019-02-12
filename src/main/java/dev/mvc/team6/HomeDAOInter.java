package dev.mvc.team6;

import java.util.List;

import dev.mvc.pfreview.Review_MemberVO;
import dev.mvc.product.OutProductVO;

public interface HomeDAOInter {
  public List<Review_MemberVO> main_review();
  
  public abstract List<OutProductVO> homeproductlist();

}
