package dev.mvc.country;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("dev.mvc.country.CountryProc")
public class CountryProc implements CountryProcInter {
  @Autowired
  @Qualifier("dev.mvc.country.CountryDAO")
  private CountryDAOInter countryDAO = null;
  
  public CountryProc() {
    System.out.println("--> CountryProc created.");
  }

  @Override
  public int create(CountryVO countryVO) {
    return countryDAO.create(countryVO);
  }

  @Override
  public List<CountryVO> list() {
    return countryDAO.list();
  }

  @Override
  public int delete(int countryno) {
    return countryDAO.delete(countryno);
  }

  @Override
  public CountryVO read(int countryno) {
    return countryDAO.read(countryno);
  }

  @Override
  public int update(CountryVO countryVO) {
    return countryDAO.update(countryVO);
  }

}
