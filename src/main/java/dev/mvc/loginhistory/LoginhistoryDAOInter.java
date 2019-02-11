package dev.mvc.loginhistory;

import java.util.HashMap;
import java.util.List;

import dev.mvc.loginhistory.LoginhistoryVO;

public interface LoginhistoryDAOInter {
  
  /**
   * �α��� ���� ����
   * @param LoginhistoryVO
   * @return
   */
  public int create(LoginhistoryVO loginhistoryVO);
  
  /**
   * �α��� ���� ����Ʈ
   * @return
   */
  public List<LoginhistoryVO> list();
  
  /**
   * �α��� ��ȣ�� ���� ��ȸ
   * @param memberno
   * @return
   */
  public LoginhistoryVO read(int loginhistory_loginno);
  
  /**
   * ���� ��ȸ �̸���
   * @param loginhistory_email
   * @return
   */
  public LoginhistoryVO readById(String loginhistory_email);
    
    /**
     * ���� ��ȸ ����
     * @param act_no
     * @return
     */
  public LoginhistoryVO readByAct(int act_no);
    
  
      /**
       * ���� ����
       * @param loginhistory_loginno
       * @return
       */
  public int delete(int loginhistory_loginno);

  
 public int search_count(HashMap hashMap);

  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap);



}
