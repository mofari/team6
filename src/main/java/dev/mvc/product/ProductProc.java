package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;
import dev.mvc.manufacturer.ManufacturerVO;

@Component("dev.mvc.product.ProductProc")
public class ProductProc implements ProductProcInter {
  @Autowired
  @Qualifier("dev.mvc.product.ProductDAO")
  private ProductDAOInter productDAO = null;

  public ProductProc() {
    System.out.println("--> ProductProc created.");
  }
  
  @Override
  public int create(ProductVO productVO) {
    return productDAO.create(productVO);
  }

  @Override
  public List<CategoryVO> select_category_one() {
    return productDAO.select_category_one();
  }

  @Override
  public List<CategoryVO> select_category_two(int categoryno) {
    return productDAO.select_category_two(categoryno);
  }

  @Override
  public List<CountryVO> country_list() {
    return productDAO.country_list();
  }

  @Override
  public List<ManufacturerVO> manufacturer_list() {
    return productDAO.manufacturer_list();
  }

  @Override
  public List<OutProductVO> outproduct_list(HashMap hashMap) {
    /* 
    ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ����
    1 ������: nowPage = 1, (1 - 1) * 10 --> 0 
    2 ������: nowPage = 2, (2 - 1) * 10 --> 10
    3 ������: nowPage = 3, (3 - 1) * 10 --> 20
    */
    String s_beginOfPage = String.valueOf(hashMap.get("nowPage"));
   int beginOfPage = (Integer.parseInt(s_beginOfPage) - 1) * Contentspro.RECORD_PER_PAGE;

   System.out.println("beginOfPage:"+beginOfPage);
    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21 
   int startNum = beginOfPage + 1; 
   System.out.println("startNum:"+startNum);
   //  ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
   int endNum = beginOfPage + Contentspro.RECORD_PER_PAGE;   
   System.out.println("endNum:"+endNum);
   /*
    1 ������: WHERE r >= 1 AND r <= 10
    2 ������: WHERE r >= 11 AND r <= 20
    3 ������: WHERE r >= 21 AND r <= 30
    */
   hashMap.put("startNum", startNum);
   hashMap.put("endNum", endNum);
   
   List<OutProductVO> list = productDAO.outproduct_list(hashMap); 
    return list;
  }

  @Override
  public int listcount(HashMap hashMap) {
    return productDAO.listcount(hashMap);
  }
  
  @Override
  public String paging(int search_count, int nowPage, String word, String getparam) {
    int totalPage = (int)(Math.ceil((double)search_count/Contentspro.RECORD_PER_PAGE)); // ��ü ������  
    int totalGrp = (int)(Math.ceil((double)totalPage/Contentspro.PAGE_PER_BLOCK));// ��ü �׷� 
    int nowGrp = (int)(Math.ceil((double)nowPage/Contentspro.PAGE_PER_BLOCK));    // ���� �׷� 
    int startPage = ((nowGrp - 1) * Contentspro.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����  
    int endPage = (nowGrp * Contentspro.PAGE_PER_BLOCK);             // Ư�� �׷��� ������ ��� ����   
     
    StringBuffer str = new StringBuffer(); 
     System.out.println(getparam);
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
    int _nowPage = (nowGrp-1) * Contentspro.PAGE_PER_BLOCK;  
    if (nowGrp >= 2){ 
      str.append("<span class='span_box_1'><A href='./list.do?&word="+word+"&nowPage="+_nowPage+getparam+"'>����</A></span>"); 
    } 

    for(int i=startPage; i<=endPage; i++){ 
      if (i > totalPage){ 
        break; 
      } 
  
      if (nowPage == i){ 
        str.append("<span class='span_box_2'>"+i+"</span>"); // ���� ������, ���� 
      }else{
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='./list.do?word="+word+"&nowPage="+i+getparam+"'>"+i+"</A></span>");   
      } 
    } 

    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * Contentspro.PAGE_PER_BLOCK)+1;  
    if (nowGrp < totalGrp){ 
      str.append("<span class='span_box_1'><A href='./list.do?&word="+word+"&nowPage="+_nowPage+getparam+"'>����</A></span>"); 
    } 
    str.append("</DIV>"); 
     
    return str.toString(); 
  }

  @Override
  public int delete(int prono) {
    return productDAO.delete(prono);
  }
  
  @Override
  public OutProductVO read(int prono) {
    return productDAO.read(prono);
  }

  @Override
  public int like(HashMap hashMap) {
    String pronostr = (String) hashMap.get("prono");
    int prono = Integer.parseInt(pronostr);
    productDAO.likeup(prono);
    return productDAO.like(hashMap);
  }

  @Override
  public int delike(HashMap hashMap) {
    String pronostr = (String) hashMap.get("prono");
    int prono = Integer.parseInt(pronostr);
    productDAO.likedown(prono);
    return productDAO.delike(hashMap);
  }

  @Override
  public int findlike(HashMap hashMap) {
    return productDAO.findlike(hashMap);
  }

  @Override
  public CategoryVO readcategory(int categoryno) {
    return productDAO.readcategory(categoryno);
  }
  
  @Override
  public int update(ProductVO productVO) {
    return productDAO.update(productVO);
  }
}
