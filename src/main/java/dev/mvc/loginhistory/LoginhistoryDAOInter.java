package dev.mvc.loginhistory;

import java.util.HashMap;
import java.util.List;

import dev.mvc.loginhistory.LoginhistoryVO;

public interface LoginhistoryDAOInter {
  
  /**
   * 로그인 내역 생성
   * @param LoginhistoryVO
   * @return
   */
  public int create(LoginhistoryVO loginhistoryVO);
  
  /**
   * 로그인 내역 리스트
   * @return
   */
  public List<LoginhistoryVO> list();
  
  /**
   * 로그인 번호로 내역 조회
   * @param memberno
   * @return
   */
  public LoginhistoryVO read(int loginhistory_loginno);
  
  /**
   * 내역 조회 이메일
   * @param loginhistory_email
   * @return
   */
  public LoginhistoryVO readById(String loginhistory_email);
    
    /**
     * 내역 조회 권한
     * @param act_no
     * @return
     */
  public LoginhistoryVO readByAct(int act_no);
    
  
      /**
       * 내역 삭제
       * @param loginhistory_loginno
       * @return
       */
  public int delete(int loginhistory_loginno);

  
 public int search_count(HashMap hashMap);

  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap);



}
