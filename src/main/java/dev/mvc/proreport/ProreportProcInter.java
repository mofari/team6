package dev.mvc.proreport;

import java.util.HashMap;
import java.util.List;

import dev.mvc.product.ProductVO;

public interface ProreportProcInter {

  public abstract ProductVO readproduct(int prono);
  
  public abstract int create(ProreportVO proreportVO);
  
  public List<OutProreportVO> list(HashMap hashMap);
  public int listcount(HashMap hashMap);
  String paging(int search_count, int nowPage, String getparam);
  
  public abstract int reportup(ProreportVO proreportVO);
  
  public abstract int reportdown(int prono);
  
  public abstract int delete(int prono);
  
  public abstract OutProreportVO detail(int rptno);
}
