package dev.mvc.pet;

import java.util.HashMap;
import java.util.List;

import dev.mvc.loginhistory.LoginhistoryVO;
import dev.mvc.member.MemberVO;

public interface PetProcInter {
  /**
   * 회원 펫 정보 조회
   * @param member_no
   * @return
   */
  public List<PetVO> readpet(int member_no);
  
  public PetVO read(int member_no);
  
  /**
   * 로그인 내역 생성
   * @param loginhistoryVO
   * @return
   */
  public int create(PetVO petVO);
  
  /**
   * 로그인 내역 리스트
   * @return
   */
  public List<PetVO> list();
  
  /**
   * 내역 삭제
   * @param pet_no
   * @return
   */
  public int delete(int pet_no);
  
  /**
   * 전체 카운팅
   * @param hashMap
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * 페이징
   * @param nowPage
   * @param search_count
   * @return
   */
  public String paging(int nowPage, int search_count);

  /**
   * 페이징 리스트
   * @param hashMap
   * @return
   */
  public List<PetVO> list_pet_paging(HashMap<String, Object> hashMap);

  public List<PetVO> mylist(int member_no);

  public int update(PetVO petVO);
}