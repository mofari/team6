package dev.mvc.diary;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


import nation.web.tool.Tool;




@Component("dev.mvc.diary.DiaryProc")
public class DiaryProc implements DiaryProcInter{
  @Autowired
  @Qualifier("dev.mvc.diary.DiaryDAO")
  private DiaryDAOInter diaryDAO = null;
  
  public DiaryProc(){
    System.out.println("--> DiaryProc created");
  }
  
  @Override
  public int create(DiaryVO diaryVO) {
   
    return diaryDAO.create(diaryVO);
  }
  
/*  @Override
  public List<DiaryVO> list(int category_no) {
    List<DiaryVO> list = diaryDAO.list(category_no);
    
  
    return list;
  }*/

  @Override
  public DiaryVO read(int diary_no) {
    
    return diaryDAO.read(diary_no);
  }
  
  @Override
  public int update(DiaryVO diaryVO){
    return diaryDAO.update(diaryVO);
  }

  @Override
  public int delete(int diary_no){
    return diaryDAO.delete(diary_no);
  }

  @Override
  public int increseCnt(int diary_no) {
    
    return diaryDAO.increseCnt(diary_no);
  }
  
  @Override
  public int search_count(HashMap hashMap) {
    // TODO Auto-generated method stub
    return diaryDAO.search_count(hashMap);
  }
  
  @Override
  public List<DiaryVO> list_paging(HashMap<String, Object> hashMap) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    
    int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Diary.RECORD_PER_PAGE;
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
    int startNum = beginOfPage + 1; 
    //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
    int endNum = beginOfPage + Diary.RECORD_PER_PAGE;   
    
    /*
     1 ������: WHERE r >= 1 AND r <= 10
     2 ������: WHERE r >= 11 AND r <= 20
     3 ������: WHERE r >= 21 AND r <= 30
     */
    hashMap.put("startNum", startNum);
    hashMap.put("endNum", endNum);
    
    List<DiaryVO> list = diaryDAO.list_paging(hashMap); 
    Iterator<DiaryVO> iter = list.iterator();
    
    while(iter.hasNext() == true) {
      DiaryVO diaryVO = iter.next();
      String title = Tool.textLength(diaryVO.getDiary_title(), 90);
      title = Tool.convertChar(title); // �±� ó��
      diaryVO.setDiary_title(title);
      
      String thumbs = diaryVO.getDiary_thumb();
      if (thumbs.length() > 0) { // preview �̹����� �ִ��� �˻�
        String thumb = (thumbs.split("/"))[0]; // ù��° ���ϸ� ����
        diaryVO.setDiary_thumb(thumb);
      }
    }
    
    return list;
  }


  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param categoryno ī�װ���ȣ 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @param word �˻���
   * @return ����¡ ���� ���ڿ�
   */ 
  @Override
  public String paging(int category_no, int search_count, int nowPage, String word) {
   
    int totalPage = (int)(Math.ceil((double)search_count/Diary.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Diary.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Diary.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Diary.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Diary.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    str.append("    background-color: #668db4;"); 
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
    
 // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� 20
    
    int _nowPage = (nowGrp-1) * Diary.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./list_paging.do?&word="+word+"&nowPage="+_nowPage+"&category_no="+category_no+"'>����</A></span>"); 
    } 

    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='./list_paging.do?word="+word+"&nowPage="+i+"&category_no="+category_no+"'>"+i+"</A></span>");   
      } 
    } 
    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * Diary.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./list_paging.do?&word="+word+"&nowPage="+_nowPage+"&category_no="+category_no+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
    
    
    
    return str.toString();
  }

  @Override
  public int total_count() {
    // 
    return diaryDAO.total_count();
  }

  @Override
  public int increseRcnt(int diary_no) {
    // TODO Auto-generated method stub
    return diaryDAO.increseRcnt(diary_no);
  }

  @Override
  public int deincreseRcnt(int diary_no) {
    // TODO Auto-generated method stub
    return diaryDAO.deincreseRcnt(diary_no);
  }

  @Override
  public int like_check(HashMap hashMap) {
    // TODO Auto-generated method stub
    return diaryDAO.like_check(hashMap);
  }

  @Override
  public int like_up(int diary_no) {
    // TODO Auto-generated method stub
    return diaryDAO.like_up(diary_no);
  }

  @Override
  public int like_down(int diary_no) {
    // TODO Auto-generated method stub
    return diaryDAO.like_down(diary_no);
  }

  @Override
  public List<DiaryVO> cnt_list(int category_no) {
    // TODO Auto-generated method stub
    return diaryDAO.cnt_list(category_no);
  }
  
  
}
