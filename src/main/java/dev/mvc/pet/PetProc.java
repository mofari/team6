package dev.mvc.pet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


@Component("dev.mvc.pet.PetProc")
public class PetProc implements PetProcInter {
  @Autowired
  @Qualifier("dev.mvc.pet.PetDAO")
  private PetDAOInter petDAO = null;

  public PetProc() {
    System.out.println("--> PetProc created.");
  }
  
  @Override
  public List<PetVO> read(int member_no) {
    return petDAO.read(member_no);
  }

}
