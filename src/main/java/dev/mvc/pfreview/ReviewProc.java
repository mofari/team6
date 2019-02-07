package dev.mvc.pfreview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.pet.PetVO;
import dev.mvc.pfreview.ReviewDAOInter;
import dev.mvc.pfreview.ReviewProcInter;
import dev.mvc.product.ProductVO;
import nation.web.tool.Tool;

@Component("dev.mvc.pfreview.ReviewProc")
public class ReviewProc implements ReviewProcInter {
  @Autowired
  @Qualifier("dev.mvc.pfreview.ReviewDAO")
  private ReviewDAOInter reviewDAO = null;
 
  public ReviewProc() {
    System.out.println("--> ReviewProc created.");
  }

  @Override
  public int create(Review_MemberVO review_memberVO) {
    return reviewDAO.create(review_memberVO);
  }
   
  @Override
  public int increaseCnt(int category_no) {
    return reviewDAO.increaseCnt(category_no);
  }

  @Override
  public List<Review_MemberVO> product_name_search(String product_name) {
    return reviewDAO.product_name_search(product_name); 
  }

  @Override
  public Review_MemberVO read(int review_no) {
    return reviewDAO.read(review_no);
  }

  @Override
  public PetVO pet_read(int review_no) {
    return reviewDAO.pet_read(review_no);
  }

  @Override
  public int update(ReviewVO review_memberVO) {
    return reviewDAO.update(review_memberVO);
  }

  @Override
  public int search_count(HashMap hashMap) {
    return reviewDAO.search_count(hashMap);
  }

  @Override
  public List<Review_MemberVO> list(HashMap<String, Object> hashMap) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 8 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 8 --> 8
    3 ������: nowPage = 3, (3 - 1) * 8 --> 16
    */
   int beginOfPage = ((Integer)hashMap.get("nowPage") - 1) * Reviews.RECORD_PER_PAGE;
   
    // ���� rownum, 1 ������: 1 / 2 ������: 9 / 3 ������: 17 
   int startNum = beginOfPage + 1; 
   //  ���� rownum, 1 ������: 8 / 2 ������: 16 / 3 ������: 24
   int endNum = beginOfPage + Reviews.RECORD_PER_PAGE;   
   
    /*1 ������: WHERE r >= 1 AND r <= 8
    2 ������: WHERE r >= 9 AND r <= 16
    3 ������: WHERE r >= 17 AND r <= 24*/
    
   hashMap.put("startNum", startNum);
   hashMap.put("endNum", endNum);
   
   List<Review_MemberVO> list = reviewDAO.list(hashMap); 
   Iterator<Review_MemberVO> iter = list.iterator();
   
   while(iter.hasNext() == true) {
     Review_MemberVO review_memberVO = iter.next();
     String title = Tool.textLength(review_memberVO.getReview_title(), 90);
     title = Tool.convertChar(title); // �±� ó��
     review_memberVO.setReview_title(title);


     String thumbs = review_memberVO.getReview_thumb();
     if (thumbs.length() > 0) { // preview �̹����� �ִ��� �˻�
       String thumb = (thumbs.split("/"))[0]; // ù��° ���ϸ� ����
       review_memberVO.setReview_thumb(thumb);
     }
   }
   
   return list;
  }

  @Override
  public String paging(int category_no, int search_count, int nowPage, String word) {
    int totalPage = (int)(Math.ceil((double)search_count/Reviews.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Reviews.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Reviews.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Reviews.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Reviews.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
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
    int _nowPage = (nowGrp-1) * Reviews.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./list.do?&word="+word+"&nowPage="+_nowPage+"&category_no="+category_no+"'>����</A></span>"); 
    } 

    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='./list.do?word="+word+"&nowPage="+i+"&category_no="+category_no+"'>"+i+"</A></span>");   
      } 
    } 

    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * Reviews.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./list.do?&word="+word+"&nowPage="+_nowPage+"&category_no="+category_no+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public ProductVO rproduct_name_search(int review_no) {
    return reviewDAO.rproduct_name_search(review_no);
  }

  @Override
  public int reply_cntup(int review_no) {
    return reviewDAO.reply_cntup(review_no);
  }

  @Override
  public int reply_cntdown(int review_no) {
    return reviewDAO.reply_cntdown(review_no);
  }

  @Override
  public int review_delete(int review_no) {
    return reviewDAO.review_delete(review_no);
  }

  @Override
  public int decreaseCnt(int category_no) {
    return reviewDAO.decreaseCnt(category_no);
  }

  @Override
  public int like_check(HashMap hashMap) {
    return reviewDAO.like_check(hashMap);
  }

  @Override
  public int like_up(int review_no) {
    return reviewDAO.like_up(review_no);
  }

  @Override
  public int like_member_insert(HashMap hashMap) {
    return reviewDAO.like_member_insert(hashMap);
  }

  @Override
  public int like_member_delete(HashMap hashMap) {
    return reviewDAO.like_member_delete(hashMap);
  }

  @Override
  public int like_down(int review_no) {
    return reviewDAO.like_down(review_no);
  }

  @Override
  public List<Review_MemberVO> product_data_analysis(int product_no) {
    return reviewDAO.product_data_analysis(product_no);
  }

  @Override
  public List<Review_MemberVO> member_review_list(int member_no) {
    return reviewDAO.member_review_list(member_no);
  }

  @Override
  public List<Review_MemberVO> pet_category(HashMap hashMap) {
    return reviewDAO.pet_category(hashMap);
  }

}
