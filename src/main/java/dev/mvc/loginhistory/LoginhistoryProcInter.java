package dev.mvc.loginhistory;

import java.util.HashMap;
import java.util.List;


public interface LoginhistoryProcInter {
  /**
   * �α��� ���� ����
   * @param loginhistoryVO
   * @return
   */
  public int create(LoginhistoryVO loginhistoryVO);
  
  /**
   * �α��� ���� ����Ʈ
   * @return
   */
  public List<LoginhistoryVO> list();
  
  /**
   * ���� ��ȸ, �����ȣ
   * @param loginhistory_loginno
   * @return
   */
  public LoginhistoryVO read(int loginhistory_loginno);
  
  /**
   * ���� ��ȸ, ����
   * @param act_no
   * @return
   */
  public LoginhistoryVO readByAct(int act_no);
  
  /**
   * ���� ��ȸ, �̸���
   * @param loginhistory_email
   * @return
   */
  public LoginhistoryVO readById(String loginhistory_email);
  
  /**
   * ���� ����
   * @param loginhistory_loginno
   * @return
   */
  public int delete(int loginhistory_loginno);
  
  public int search_count(HashMap hashMap);
  
  public String paging(int nowPage, int search_count);

  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap);




}
