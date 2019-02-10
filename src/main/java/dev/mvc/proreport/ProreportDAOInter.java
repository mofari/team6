package dev.mvc.proreport;

import java.util.HashMap;
import java.util.List;

import dev.mvc.product.ProductVO;

public interface ProreportDAOInter {
  
  public abstract ProductVO readproduct(int prono);
  
  public abstract int create(ProreportVO proreportVO);
  
  public List<OutProreportVO> list(HashMap hashMap);
  public int listcount(HashMap hashMap);
  
  public abstract int reportup(ProreportVO proreportVO);
  
  public abstract int reportdown(int prono);
  
  public abstract int delete(int prono);
  
  public abstract OutProreportVO detail(int rptno);
}
