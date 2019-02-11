package dev.mvc.loginhistory;

import java.util.HashMap;
import java.util.List;


public interface LoginhistoryProcInter {
  /**
   * 로그인 내역 생성
   * @param loginhistoryVO
   * @return
   */
  public int create(LoginhistoryVO loginhistoryVO);
  
  /**
   * 로그인 내역 리스트
   * @return
   */
  public List<LoginhistoryVO> list();
  
  /**
   * 내역 조회, 멤버번호
   * @param loginhistory_loginno
   * @return
   */
  public LoginhistoryVO read(int loginhistory_loginno);
  
  /**
   * 내역 조회, 권한
   * @param act_no
   * @return
   */
  public LoginhistoryVO readByAct(int act_no);
  
  /**
   * 내역 조회, 이메일
   * @param loginhistory_email
   * @return
   */
  public LoginhistoryVO readById(String loginhistory_email);
  
  /**
   * 내역 삭제
   * @param loginhistory_loginno
   * @return
   */
  public int delete(int loginhistory_loginno);
  
  public int search_count(HashMap hashMap);
  
  public String paging(int nowPage, int search_count);

  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap);




}
