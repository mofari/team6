package dev.mvc.member;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

 
@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  @Autowired
  @Qualifier("dev.mvc.member.MemberDAO")
  private MemberDAOInter memberDAO = null;
  
  public MemberProc(){
    System.out.println("--> MemberProc created.");
  }
  
  /**
   * 아이디 조회
   */
  @Override
  public int checkId(String member_email) {
    return memberDAO.checkId(member_email);
  }

  /**
   * 회원 등록
   */
  @Override
  public int create(MemberVO memberVO) {
    return memberDAO.create(memberVO);
  }

  /**
   * 회원 목록
   */
  @Override
  public List<MemberVO> list() {
    return memberDAO.list();
  }
  
  /**
   * 회원 확인
   */
  @Override
  public boolean isMember(HttpSession session){
    boolean sw = false;
    
    String member_email = (String)session.getAttribute("member_email");
    
    if (member_email != null){
      sw = true;
    }
    return sw;
  }

  /**
   * 회원 조회
   */
  @Override
  public MemberVO read(int member_no) {
    return memberDAO.read(member_no);
  }

  /**
   * 회원 이름으로 조회
   */
  @Override
  public MemberVO readByname(String member_name) {
    return memberDAO.readByname(member_name);
  }
  
  @Override
  public MemberVO readById(String member_email) {
    return memberDAO.readById(member_email);
  }

  /**
   * 회원 정보 수정
   */
  @Override
  public int update(MemberVO memberVO) {
    return memberDAO.update(memberVO);
  }

  /**
   * 회원 비밀번호 변경
   */
  @Override
  public int passwd_update(int member_no, String member_passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("member_no", member_no);
    map.put("member_passwd", member_passwd);
    
    int count = memberDAO.passwd_update(map);
    
    return count;
  }

  /**
   * 회원 탈퇴
   */
  @Override
  public int delete(int member_no) {
    return memberDAO.delete(member_no);
  }

  /**
   * 로그인
   */
  @Override
  public int login(String member_email, String member_passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("member_email", member_email);
    map.put("member_passwd", member_passwd);
    int count = memberDAO.login(map);
    return count;
  }

  /**
   * 회원 숨김/보임
   */
  @Override
  public int member_visible(String visible) {
    return memberDAO.member_visible(visible);
  }

  /**
   * 회원 권한 변경
   */
  @Override
  public int member_act(int act_no) {
    return memberDAO.member_act(act_no);
  }

  /**
   * 멤버 검색
   */
  @Override
  public List<MemberVO> member_search(String member_name) {
     List<MemberVO> list = memberDAO.member_search(member_name);
    
    int count = list.size();
    for (int i=0; i < count; i++) {
      MemberVO memberDAO = list.get(i);
    }
    
    return list;
  }

  @Override
  public int search_count(String member_name) {
    return memberDAO.search_count(member_name);
  }

  /**
   * 아이디 찾기
   */
  @Override
  public int findId(String member_tel, String member_name) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("member_tel", member_tel);
    map.put("member_name", member_name);
    
    int count = memberDAO.findId(map);
    
    return count;
  }
  
  
}