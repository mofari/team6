package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository("dev.mvc.member.MemberDAO") // DBMS 저장소 접근
public class MemberDAO implements MemberDAOInter {
 @Autowired // 빈을 스프링이 만들어서 자동 할당, 개발자는 new 사용 안함.
 private SqlSessionTemplate sqlSessionTemplate = null;
 
  public MemberDAO() {
    System.out.println("--> MemberDAO created.");
  }

  /**
   * 회원 아이디 확인
   */
  @Override
  public int checkId(String member_email) {
    return sqlSessionTemplate.selectOne("member.checkId", member_email);
  }

  /**
   * 회원 등록
   */
  @Override
  public int create(MemberVO memberVO) {
    return sqlSessionTemplate.insert("member.create", memberVO);
  }

  /**
   * 회원 목록
   */
  @Override
  public List<MemberVO> list() {
    return sqlSessionTemplate.selectList("member.list");
  }

  /**
   * 회원 조회
   */
  @Override
  public MemberVO read(int member_no) {
    return sqlSessionTemplate.selectOne("member.read", member_no);
  }

  /**
   * 회원 이름으로 조회
   */
  @Override
  public MemberVO readByname(String member_name) {
    return sqlSessionTemplate.selectOne("member.readByname", member_name);
  }

  /**
   * 회원 수정
   */
  @Override
  public int update(MemberVO memberVO) {
    return sqlSessionTemplate.update("member.update", memberVO);
  }

  /**
   * 회원 비밀번호 변경
   */
  @Override
  public int passwd_update(Map<String, Object> map) {
    return sqlSessionTemplate.update("member.passwd_update", map);
  }

  /**
   * 회원 탈퇴
   */
  @Override
  public int delete(int member_no) {
    return sqlSessionTemplate.delete("member.delete", member_no);
  }

  /**
   * 로그인
   */
  @Override
  public int login(Map<String, Object> map) {
    int count = sqlSessionTemplate.selectOne("member.login", map);
    return count;
  }

  /**
   * 회원 보임/숨김
   */
  @Override
  public int member_visible(String visible) {
    return sqlSessionTemplate.update("member.member_visible", visible);
  }

  /**
   * 회원 권한
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
   * 아이디 찾기
   */
  @Override
  public int findId(Map<String, Object> map) {
     int count = sqlSessionTemplate.selectOne("member.findId", map);
     return count;
  } 
  
  
}