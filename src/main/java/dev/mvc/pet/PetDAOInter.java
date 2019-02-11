package dev.mvc.pet;

import java.util.HashMap;
import java.util.List;

public interface PetDAOInter {

  public PetVO read(int member_no);

  public int create(PetVO petVO);

  public List<PetVO> list();

  public int delete(int pet_no);

  public int search_count(HashMap hashMap);

  public List<PetVO> list_pet_paging(HashMap<String, Object> hashMap);

  public List<PetVO> readpet(int member_no);

  public List<PetVO> mylist(int member_no);

  public int update(PetVO petVO);
}
