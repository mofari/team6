package dev.mvc.pet;

import java.util.HashMap;
import java.util.List;

import dev.mvc.loginhistory.LoginhistoryVO;
import dev.mvc.member.MemberVO;

public interface PetProcInter {
  /**
   * ȸ�� �� ���� ��ȸ
   * @param member_no
   * @return
   */
  public List<PetVO> readpet(int member_no);
  
  public PetVO read(int member_no);
  
  /**
   * �α��� ���� ����
   * @param loginhistoryVO
   * @return
   */
  public int create(PetVO petVO);
  
  /**
   * �α��� ���� ����Ʈ
   * @return
   */
  public List<PetVO> list();
  
  /**
   * ���� ����
   * @param pet_no
   * @return
   */
  public int delete(int pet_no);
  
  /**
   * ��ü ī����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * ����¡
   * @param nowPage
   * @param search_count
   * @return
   */
  public String paging(int nowPage, int search_count);

  /**
   * ����¡ ����Ʈ
   * @param hashMap
   * @return
   */
  public List<PetVO> list_pet_paging(HashMap<String, Object> hashMap);

  public List<PetVO> mylist(int member_no);

  public int update(PetVO petVO);
}