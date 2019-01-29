package dev.mvc.manufacturer;

import java.util.HashMap;
import java.util.List;

public interface ManufacturerProcInter {

  public int create(ManufacturerVO manufacturerVO);

  public List<ManufacturerVO> list(HashMap hashMap);

  public int delete(int manno);

  public int update(ManufacturerVO manufacturerVO);

  public int updateimg(ManufacturerVO manufacturerVO);

  public ManufacturerVO read(int manno);

  public int listcount(HashMap hashMap);
  
  public String paging(int search_count, int nowPage, String word);
}
