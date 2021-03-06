package dev.mvc.loginhistory;
 
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

 
@Component("dev.mvc.loginhistory.LoginhistoryProc")
public class LoginhistoryProc implements LoginhistoryProcInter {
  @Autowired
  @Qualifier("dev.mvc.loginhistory.LoginhistoryDAO")
  private LoginhistoryDAOInter loginhistoryDAO = null;
  
  public LoginhistoryProc(){
    System.out.println("--> LoginhistoryProc created.");
  }
/**
 * 로그인 내역 등록
 */
  @Override
  public int create(LoginhistoryVO loginhistoryVO) {
    return loginhistoryDAO.create(loginhistoryVO);
  }

  /**
   * 로그인 내역 리스트
   */
  @Override
  public List<LoginhistoryVO> list() {
    return loginhistoryDAO.list();
  }

  /**
   * 로그인 내역 회원번호 조회
   */
  @Override
  public LoginhistoryVO read(int loginhistory_loginno) {
    return loginhistoryDAO.read(loginhistory_loginno);
  }

  /**
   * 로그인 내역 권한 조회
   */
  @Override
  public LoginhistoryVO readByAct(int act_no) {
    return loginhistoryDAO.readByAct(act_no);
  }

  /**
   * 로그인 내역 이메일 조회
   */
  @Override
  public LoginhistoryVO readById(String loginhistory_email) {
     return loginhistoryDAO.readById(loginhistory_email);
  }

  /**
   * 로그인 내역 삭제
   */
  @Override
  public int delete(int loginhistory_loginno) {
    return loginhistoryDAO.delete(loginhistory_loginno);
  }
  @Override
  public int search_count(HashMap hashMap) {
    return loginhistoryDAO.search_count(hashMap);
  }
  
  /**
   * 페이징 리스트
   * @param hashMap
   * @return
   */
  @Override
  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지: nowPage = 1, (1 - 1) * 10 --> 0 
    2 페이지: nowPage = 2, (2 - 1) * 10 --> 10
    3 페이지: nowPage = 3, (3 - 1) * 10 --> 20
    */
   int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Loginhistorys.RECORD_PER_PAGE;
   
    // 시작 rownum, 1 페이지: 1 / 2 페이지: 11 / 3 페이지: 21 
   int startNum = beginOfPage + 1; 
   //  종료 rownum, 1 페이지: 10 / 2 페이지: 20 / 3 페이지: 30
   int endNum = beginOfPage + Loginhistorys.RECORD_PER_PAGE;   
   System.out.println(startNum+"/"+endNum);
   /*
    1 페이지: WHERE r >= 1 AND r <= 10
    2 페이지: WHERE r >= 11 AND r <= 20
    3 페이지: WHERE r >= 21 AND r <= 30
    */
   hashMap.put("startNum", startNum);
   hashMap.put("endNum", endNum);
   
   List<LoginhistoryVO> list = loginhistoryDAO.list_loginhistory_paging(hashMap); 
   Iterator<LoginhistoryVO> iter = list.iterator();
   
   while(iter.hasNext() == true) {
     LoginhistoryVO loginhistoryVO = iter.next();
     String title = Tool.textLength(loginhistoryVO.getLoginhistory_email(), 90);
     title = Tool.convertChar(title); // 태그 처리
     loginhistoryVO.setLoginhistory_email(title);
     
     /*String thumbs = loginhistoryVO.getEvent_img();
     if (thumbs.length() > 0) { // preview 이미지가 있는지 검사
       String thumb = (thumbs.split("/"))[0]; // 첫번째 파일명 추출
       loginhistoryVO.setEvent_img(thumb);
     }
   }*/
   }
   
   return list;
 }
  @Override
  public String paging(int search_count, int nowPage) {
    int totalPage = (int)(Math.ceil((double)search_count/Loginhistorys.RECORD_PER_PAGE)); // 전체 페이지  
    int totalGrp = (int)(Math.ceil((double)totalPage/Loginhistorys.PAGE_PER_BLOCK));// 전체 그룹 
    int nowGrp = (int)(Math.ceil((double)nowPage/Loginhistorys.PAGE_PER_BLOCK));    // 현재 그룹 
    int startPage = ((nowGrp - 1) * Loginhistorys.PAGE_PER_BLOCK) + 1; // 특정 그룹의 페이지 목록 시작  
    int endPage = (nowGrp * Loginhistorys.PAGE_PER_BLOCK);             // 특정 그룹의 페이지 목록 종료   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #1fb7a6;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 

    // 이전 10개 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 20
    int _nowPage = (nowGrp-1) * Loginhistorys.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./list_loginhistory_paging.do?&nowPage="+_nowPage+"'>이전</A></span>"); 
    } 

    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지
        str.append("<span class='span_box_1'><A href='./list_loginhistory_paging.do?&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 

    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 21
    _nowPage = (nowGrp * Loginhistorys.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./list_loginhistory_paging.do?&nowPage="+_nowPage+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  
 
}