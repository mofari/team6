package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.member.MemberVO;

public interface MemberDAOInter {
  
  /**
   * ���̵� �ߺ� Ȯ��
   * @param member_email
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
   * ȸ�� ��ȸ, �����ȣ
   * @param memberno
   * @return
   */
  public MemberVO read(int member_no);
  
  /**
   * ȸ�� ��ȸ, ��� �̸�
   * @param id
   * @return
   */
  public MemberVO readByname(String member_name);
  
  /**
   * ȸ�� ����
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * �н����� ����
   * @param map
   * @return
   */
  public int passwd_update(Map<String, Object> map);
  
  /**
   * ȸ�� Ż��
   * @param member_no
   * @return
   */
  public int delete(int member_no);
  
  /**
   * �α���
   * @param map
   * @return
   */
  public int login(Map<String, Object> map);
  
  /**
   *  ȸ�� ����/���� ����
   * @param visible
   * @return
   */
  public int member_visible(String visible);
  
  /**
   * ���� ����
   * @param act_no
   * @return
   */
  public int member_act(int act_no);

  /**
   * ȸ�� ��ȸ ���̵�
   * @param member_email
   * @return
   */
  public MemberVO readById(String member_email);

  /**
   * ��� ��ȸ�� ���
   * @param hashMap
   * @return
   */
  public List<MemberVO> member_search(String member_name);

  /**
   * ��� ī��Ʈ
   * @param hashMap
   * @return
   */
  public int search_count(String member_name);

  public int findId(Map<String, Object> map);
}
