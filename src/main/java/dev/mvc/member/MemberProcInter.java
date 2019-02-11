package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public interface MemberProcInter {
  
  /**
   * ���̵� �ߺ� Ȯ��
   * @param id
   * @return
   */
  public int checkId(String member_email);
  
  /**
   * ȸ�� ����
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * ȸ�� ��ü ����Ʈ
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * ���Ȯ��
   * @param memberno
   * @return
   */
  public boolean isMember(HttpSession session);
  
  /**
   * ȸ�� ��ȸ, �����ȣ
   * @param memberno
   * @return
   */
  public MemberVO read(int member_no);
  
  /**
   * ȸ�� ������Ʈ
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * ��й�ȣ ����
   * @param member_no
   * @param member_passwd
   * @return
   */
  public int passwd_update(int member_no, String member_passwd);
  
  /**
   * ȸ�� ����
   * @param member_no
   * @return
   */
  public int delete(int member_no);
  
  /**
   * ȸ�� �α���
   * @param id
   * @param passwd
   * @return
   */
  public int login(String member_email, String member_passwd);
  
  /**
   * ȸ�� ����/����
   * @param visible
   * @return
   */
  public int member_visible(String visible);
  
  /**
   * ȸ�� ���� ����
   * @param act_no
   * @return
   */
  public int member_act(int act_no);

  /**
   * ȸ�� ��ȸ, ��� �г���
   * @param �г���
   * @return
   */
  public MemberVO readByname(String member_name);

  /**
   * ȸ�� ��ȸ, ��� ���̵�
   * @param ���̵�
   * @return
   */
  public MemberVO readById(String member_email);
  
  /**
   * �˻� ���
   * @param categoryno
   * @return
   */
  public List<MemberVO> member_search(String member_name);

  /**
   * category�� �˻��� ���ڵ� ����
   * @return
   */
  public int search_count(String member_name);
  
  /**
   * ���̵� ã��
   * @param member_tel
   * @param member_name
   * @return
   */
  public int findId(String member_tel, String member_name);
}
