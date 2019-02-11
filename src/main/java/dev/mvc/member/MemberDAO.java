package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("dev.mvc.member.MemberDAO") // DBMS ����� ����
public class MemberDAO implements MemberDAOInter {
 @Autowired // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
 private SqlSessionTemplate sqlSessionTemplate = null;
 
  public MemberDAO() {
    System.out.println("--> MemberDAO created.");
  }

  /**
   * ȸ�� ���̵� Ȯ��
   */
  @Override
  public int checkId(String member_email) {
    return sqlSessionTemplate.selectOne("member.checkId", member_email);
  }

  /**
   * ȸ�� ���
   */
  @Override
  public int create(MemberVO memberVO) {
    return sqlSessionTemplate.insert("member.create", memberVO);
  }

  /**
   * ȸ�� ���
   */
  @Override
  public List<MemberVO> list() {
    return sqlSessionTemplate.selectList("member.list");
  }

  /**
   * ȸ�� ��ȸ
   */
  @Override
  public MemberVO read(int member_no) {
    return sqlSessionTemplate.selectOne("member.read", member_no);
  }

  /**
   * ȸ�� �̸����� ��ȸ
   */
  @Override
  public MemberVO readByname(String member_name) {
    return sqlSessionTemplate.selectOne("member.readByname", member_name);
  }

  /**
   * ȸ�� ����
   */
  @Override
  public int update(MemberVO memberVO) {
    return sqlSessionTemplate.update("member.update", memberVO);
  }

  /**
   * ȸ�� ��й�ȣ ����
   */
  @Override
  public int passwd_update(Map<String, Object> map) {
    return sqlSessionTemplate.update("member.passwd_update", map);
  }

  /**
   * ȸ�� Ż��
   */
  @Override
  public int delete(int member_no) {
    return sqlSessionTemplate.delete("member.delete", member_no);
  }

  /**
   * �α���
   */
  @Override
  public int login(Map<String, Object> map) {
    int count = sqlSessionTemplate.selectOne("member.login", map);
    return count;
  }

  /**
   * ȸ�� ����/����
   */
  @Override
  public int member_visible(String visible) {
    return sqlSessionTemplate.update("member.member_visible", visible);
  }

  /**
   * ȸ�� ����
   */
  @Override
  public int member_act(int act_no) {
    return sqlSessionTemplate.update("member.member_act", act_no);
  }

  @Override
  public MemberVO readById(String member_email) {
    return sqlSessionTemplate.selectOne("member.readById", member_email);
  }

  @Override
  public List<MemberVO> member_search(String member_name) {
    return sqlSessionTemplate.selectList("member.member_search", member_name);
  }

  @Override
  public int search_count(String member_name) {
    return sqlSessionTemplate.selectOne("member.search_count",member_name);
  }

  /**
   * ���̵� ã��
   */
  @Override
  public int findId(Map<String, Object> map) {
     int count = sqlSessionTemplate.selectOne("member.findId", map);
     return count;
  } 
  
  
}