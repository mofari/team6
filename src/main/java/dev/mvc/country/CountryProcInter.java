package dev.mvc.country;

import java.util.List;

public interface CountryProcInter {

  public abstract int create(CountryVO countryVO);

  public List<CountryVO> list();

  public int delete(int countryno);
  
  public CountryVO read(int countryno);
  
  public int update(CountryVO countryVO);
  
}
