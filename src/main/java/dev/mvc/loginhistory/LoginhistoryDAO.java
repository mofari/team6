package dev.mvc.loginhistory;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.loginhistory.LoginhistoryDAO") // DBMS ����� ����
public class LoginhistoryDAO implements LoginhistoryDAOInter {
 @Autowired // ���� �������� ���� �ڵ� �Ҵ�, �����ڴ� new ��� ����.
 private SqlSessionTemplate sqlSessionTemplate = null;
 
  public LoginhistoryDAO() {
    System.out.println("--> LoginhistoryDAO created.");
  }
  /**
   * �α��γ��� ���
   */ 
  @Override
  public int create(LoginhistoryVO loginhistoryVO) {
    return sqlSessionTemplate.insert("loginhistory.create", loginhistoryVO);
  }

  /**
   * �α��γ��� ���
   */
  @Override
  public List<LoginhistoryVO> list() {
    return sqlSessionTemplate.selectList("loginhistory.list");
  }

  /**
   * �α��γ��� ��ȣ ��ȸ
   */
  @Override
  public LoginhistoryVO read(int loginhistory_loginno) {
    return sqlSessionTemplate.selectOne("loginhistory.read", loginhistory_loginno);
  }

  /**
   * �α��γ��� ȸ�� �̸��� ��ȸ
   */
  @Override
  public LoginhistoryVO readById(String loginhistory_email) {
    return sqlSessionTemplate.selectOne("loginhistory.readById", loginhistory_email); 
  }

  /**
   * �α��� ���� ����
   */
  @Override
  public int delete(int loginhistory_loginno) {
    return sqlSessionTemplate.delete("loginhistory.delete", loginhistory_loginno);
  }

  @Override
  public LoginhistoryVO readByAct(int act_no) {
    return sqlSessionTemplate.selectOne("loginhistory.readByAct", act_no);
  }
  @Override
  public int search_count(HashMap hashMap) {
    return sqlSessionTemplate.selectOne("loginhistory.search_count", hashMap);
  } 
  
  @Override
  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap) {
    return sqlSessionTemplate.selectList("loginhistory.list_loginhistory_paging", hashMap);
  }
  
  
}