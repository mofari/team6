package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MemberProcInter {
  
  /**
   * 아이디 중복 확인
   * @param id
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
   * 멤버확인
   * @param memberno
   * @return
   */
  public boolean isMember(HttpSession session);
  
  /**
   * 회원 조회, 멤버번호
   * @param memberno
   * @return
   */
  public MemberVO read(int member_no);
  
  /**
   * 회원 업데이트
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * 비밀번호 변경
   * @param member_no
   * @param member_passwd
   * @return
   */
  public int passwd_update(int member_no, String member_passwd);
  
  /**
   * 회원 삭제
   * @param member_no
   * @return
   */
  public int delete(int member_no);
  
  /**
   * 회원 로그인
   * @param id
   * @param passwd
   * @return
   */
  public int login(String member_email, String member_passwd);
  
  /**
   * 회원 숨김/보임
   * @param visible
   * @return
   */
  public int member_visible(String visible);
  
  /**
   * 회원 권한 변경
   * @param act_no
   * @return
   */
  public int member_act(int act_no);

  /**
   * 회원 조회, 멤버 닉네임
   * @param 닉네임
   * @return
   */
  public MemberVO readByname(String member_name);

  /**
   * 회원 조회, 멤버 아이디
   * @param 아이디
   * @return
   */
  public MemberVO readById(String member_email);
  
  /**
   * 검색 목록
   * @param categoryno
   * @return
   */
  public List<MemberVO> member_search(String member_name);

  /**
   * category별 검색된 레코드 갯수
   * @return
   */
  public int search_count(String member_name);
  
  /**
   * 아이디 찾기
   * @param member_tel
   * @param member_name
   * @return
   */
  public int findId(String member_tel, String member_name);
}
