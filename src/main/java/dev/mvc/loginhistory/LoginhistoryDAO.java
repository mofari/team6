package dev.mvc.loginhistory;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dev.mvc.loginhistory.LoginhistoryDAO") // DBMS 저장소 접근
public class LoginhistoryDAO implements LoginhistoryDAOInter {
 @Autowired // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
 private SqlSessionTemplate sqlSessionTemplate = null;
 
  public LoginhistoryDAO() {
    System.out.println("--> LoginhistoryDAO created.");
  }
  /**
   * 로그인내역 등록
   */ 
  @Override
  public int create(LoginhistoryVO loginhistoryVO) {
    return sqlSessionTemplate.insert("loginhistory.create", loginhistoryVO);
  }

  /**
   * 로그인내역 목록
   */
  @Override
  public List<LoginhistoryVO> list() {
    return sqlSessionTemplate.selectList("loginhistory.list");
  }

  /**
   * 로그인내역 번호 조회
   */
  @Override
  public LoginhistoryVO read(int loginhistory_loginno) {
    return sqlSessionTemplate.selectOne("loginhistory.read", loginhistory_loginno);
  }

  /**
   * 로그인내역 회원 이메일 조회
   */
  @Override
  public LoginhistoryVO readById(String loginhistory_email) {
    return sqlSessionTemplate.selectOne("loginhistory.readById", loginhistory_email); 
  }

  /**
   * 로그인 내역 삭제
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