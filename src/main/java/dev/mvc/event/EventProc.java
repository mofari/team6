package dev.mvc.event;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

@Component("dev.mvc.event.EventProc")
public class EventProc implements EventProcInter {
  @Autowired
  @Qualifier("dev.mvc.event.EventDAO")
  private EventDAOInter eventDAO = null;
  
  public EventProc(){
    System.out.println("--> EventProc created.");
  }
  
  @Override
  public int create(EventVO eventVO){
    return eventDAO.create(eventVO);
  }

  @Override
  public List<EventVO> list_event() {
    return eventDAO.list_event();
  }
  
  @Override
  public ArrayList<FileVO> getThumbs(EventVO eventVO) {
    ArrayList<FileVO> file_list = new ArrayList<FileVO>();
    
    String thumbs = eventVO.getEvent_thumb(); // xmas01_2_t.jpg/xmas02_2_t.jpg...
    String files = eventVO.getEvent_img();          // xmas01_2.jpg/xmas02_2.jpg...
    String sizes = eventVO.getEvent_imgsize();        // 272558/404087... 
    
    String[] thumbs_array = thumbs.split("/");  // Thumbs
    String[] files_array = files.split("/");   // ���ϸ� ����
    String[] sizes_array = sizes.split("/"); // ���� ������
 
    int count = sizes_array.length;
    // System.out.println("sizes_array.length: " + sizes_array.length);
    // System.out.println("sizes: " + sizes);
    // System.out.println("files: " + files);
 
    if (files.length() > 0) {
      for (int index = 0; index < count; index++) {
        sizes_array[index] = Tool.unit(new Integer(sizes_array[index]));  // 1024 -> 1KB
      
        FileVO fileVO = new FileVO(thumbs_array[index], files_array[index], sizes_array[index]);
        file_list.add(fileVO);
      }
    } 

    return file_list;
  }

  @Override
  public EventVO read(int event_no) {
    eventDAO.increaseView(event_no);
    return eventDAO.read(event_no);
  }
  

  @Override
  public List<EventVO> list_event_paging(HashMap<String, Object> hashMap) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
   int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Events.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
   int startNum = beginOfPage + 1; 
   //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
   int endNum = beginOfPage + Events.RECORD_PER_PAGE;   
   System.out.println(startNum+"/"+endNum);
   /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
   hashMap.put("startNum", startNum);
   hashMap.put("endNum", endNum);
   
   List<EventVO> list = eventDAO.list_event_paging(hashMap); 
   Iterator<EventVO> iter = list.iterator();
   
   while(iter.hasNext() == true) {
     EventVO eventVO = iter.next();
     String title = Tool.textLength(eventVO.getEvent_title(), 90);
     title = Tool.convertChar(title); // �±� ó��
     eventVO.setEvent_title(title);
     
     String thumbs = eventVO.getEvent_img();
     if (thumbs.length() > 0) { // preview �̹����� �ִ��� �˻�
       String thumb = (thumbs.split("/"))[0]; // ù��° ���ϸ� ����
       eventVO.setEvent_img(thumb);
     }
   }
   
   return list;
 }

  @Override
  public int total_count(HashMap hashMap) {
    return eventDAO.total_count(hashMap);
  }

  @Override
  public String paging(int total_count, int nowPage) {
    int totalPage = (int)(Math.ceil((double)total_count/Events.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Events.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Events.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Events.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Events.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    int _nowPage = (nowGrp-1) * Events.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./list_event_paging.do?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 

    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='./list_event_paging.do?&nowPage="+i+"'>"+i+"</A></span>");   
      } 
    } 

    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * Events.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./list_event_paging.do?&nowPage="+_nowPage+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public int update(EventVO eventVO) {
    return eventDAO.update(eventVO);
  }

  @Override
  public int delete(int event_no) {
    return eventDAO.delete(event_no);
  }

  @Override
  public int like_check(HashMap hashMap) {
    return eventDAO.like_check(hashMap);
  }

  @Override
  public int like_up(int event_no) {
    return eventDAO.like_up(event_no);
  }

  @Override
  public int like_down(int event_no) {
    return eventDAO.like_down(event_no);
  }

  @Override
  public int like_member_insert(HashMap hashMap) {
    return eventDAO.like_member_insert(hashMap);
  }

  @Override
  public int like_member_delete(HashMap hashMap) {
    return eventDAO.like_member_delete(hashMap);
  }
  

}
