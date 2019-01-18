package dev.mvc.pet;

import java.util.List;

public interface PetDAOInter {

  public List<PetVO> read(int member_no);
}
