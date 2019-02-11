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
 * �α��� ���� ���
 */
  @Override
  public int create(LoginhistoryVO loginhistoryVO) {
    return loginhistoryDAO.create(loginhistoryVO);
  }

  /**
   * �α��� ���� ����Ʈ
   */
  @Override
  public List<LoginhistoryVO> list() {
    return loginhistoryDAO.list();
  }

  /**
   * �α��� ���� ȸ����ȣ ��ȸ
   */
  @Override
  public LoginhistoryVO read(int loginhistory_loginno) {
    return loginhistoryDAO.read(loginhistory_loginno);
  }

  /**
   * �α��� ���� ���� ��ȸ
   */
  @Override
  public LoginhistoryVO readByAct(int act_no) {
    return loginhistoryDAO.readByAct(act_no);
  }

  /**
   * �α��� ���� �̸��� ��ȸ
   */
  @Override
  public LoginhistoryVO readById(String loginhistory_email) {
     return loginhistoryDAO.readById(loginhistory_email);
  }

  /**
   * �α��� ���� ����
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
   * ����¡ ����Ʈ
   * @param hashMap
   * @return
   */
  @Override
  public List<LoginhistoryVO> list_loginhistory_paging(HashMap<String, Object> hashMap) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
   int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Loginhistorys.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
   int startNum = beginOfPage + 1; 
   //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
   int endNum = beginOfPage + Loginhistorys.RECORD_PER_PAGE;   
   System.out.println(startNum+"/"+endNum);
   /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
   hashMap.put("startNum", startNum);
   hashMap.put("endNum", endNum);
   
   List<LoginhistoryVO> list = loginhistoryDAO.list_loginhistory_paging(hashMap); 
   Iterator<LoginhistoryVO> iter = list.iterator();
   
   while(iter.hasNext() == true) {
     LoginhistoryVO loginhistoryVO = iter.next();
     String title = Tool.textLength(loginhistoryVO.getLoginhistory_email(), 90);
     title = Tool.convertChar(title); // �±� ó��
     loginhistoryVO.setLoginhistory_email(title);
     
     /*String thumbs = loginhistoryVO.getEvent_img();
     if (thumbs.length() > 0) { // preview �̹����� �ִ��� �˻�
       String thumb = (thumbs.split("/"))[0]; // ù��° ���ϸ� ����
       loginhistoryVO.setEvent_img(thumb);
     }
   }*/
   }
   
   return list;
 }
  @Override
  public String paging(int search_count, int nowPage) {
    int totalPage = (int)(Math.ceil((double)search_count/Loginhistorys.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Loginhistorys.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Loginhistorys.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Loginhistorys.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Loginhistorys.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #1fb7a6;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 

    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� 20
    int _nowPage = (nowGrp-1) * Loginhistorys.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./list_loginhistory_paging.do?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 

    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='./list_loginhistory_paging.do?&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 

    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * Loginhistorys.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./list_loginhistory_paging.do?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  
 
}