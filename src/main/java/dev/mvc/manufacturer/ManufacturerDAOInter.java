package dev.mvc.manufacturer;

import java.util.HashMap;
import java.util.List;

public interface ManufacturerDAOInter {
  
  public abstract int create(ManufacturerVO manufacturerVO);
  
  public List<ManufacturerVO> list(HashMap hashMap);
  
  public int delete(int manno);

  public abstract int update(ManufacturerVO manufacturerVO);

  public abstract int updateimg(ManufacturerVO manufacturerVO);
  
  public ManufacturerVO read(int manno);
  
  public int listcount(HashMap hashMap);

}
