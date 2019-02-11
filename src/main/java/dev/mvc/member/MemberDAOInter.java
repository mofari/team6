package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.member.MemberVO;

public interface MemberDAOInter {
  
  /**
   * 아이디 중복 확인
   * @param member_email
   * @return
   */
  public int checkId(String member_email);
  
  /**
   * 회원 생성
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * 회원 전체 리스트
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * 회원 조회, 멤버번호
   * @param memberno
   * @return
   */
  public MemberVO read(int member_no);
  
  /**
   * 회원 조회, 멤버 이름
   * @param id
   * @return
   */
  public MemberVO readByname(String member_name);
  
  /**
   * 회원 수정
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 패스워드 수정
   * @param map
   * @return
   */
  public int passwd_update(Map<String, Object> map);
  
  /**
   * 회원 탈퇴
   * @param member_no
   * @return
   */
  public int delete(int member_no);
  
  /**
   * 로그인
   * @param map
   * @return
   */
  public int login(Map<String, Object> map);
  
  /**
   *  회원 숨김/보임 변경
   * @param visible
   * @return
   */
  public int member_visible(String visible);
  
  /**
   * 권한 변경
   * @param act_no
   * @return
   */
  public int member_act(int act_no);

  /**
   * 회원 조회 아이디
   * @param member_email
   * @return
   */
  public MemberVO readById(String member_email);

  /**
   * 멤버 조회된 목록
   * @param hashMap
   * @return
   */
  public List<MemberVO> member_search(String member_name);

  /**
   * 멤버 카운트
   * @param hashMap
   * @return
   */
  public int search_count(String member_name);

  public int findId(Map<String, Object> map);
}
