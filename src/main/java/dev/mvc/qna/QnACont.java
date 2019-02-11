package dev.mvc.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.category.CategoryVO;
import dev.mvc.pet.PetVO;
import dev.mvc.pfreview.Review_MemberVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;


@Controller
public class QnACont {
  @Autowired
  @Qualifier("dev.mvc.qna.QnAProc")
  private QnAProcInter qnaProc = null;

  public QnACont() {
    System.out.println("--> QnAProcInter created.");
  }
  
//http://localhost:9090/review/category/create_json.do?category_title=��Ÿ&category_visible=Y&category_ids=admin
 // {"msgs":["ī�װ��� ����߽��ϴ�.","��ϵ� ī�װ� ���"]}
 @ResponseBody
 @RequestMapping(value = "/qna/create_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 public ResponseEntity create_json(QnACateVO qnacateVO) {
   HttpHeaders responseHeaders = new HttpHeaders();

   JSONObject json = new JSONObject();
   JSONArray msgs = new JSONArray();

   if (qnaProc.create(qnacateVO) == 1) {
     msgs.put("ī�װ��� ����߽��ϴ�.");
     msgs.put("��ϵ� ī�װ� " + qnacateVO.getQnacategory_name());
   } else {
     msgs.put("ī�װ� ��Ͽ� �����߽��ϴ�.");
     msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
   }
   json.put("msgs", msgs);

   return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
 }

  
  /**
   * ��ü ���
   * 
   * @return
   */
  // http://localhost:9090/review/qna/list.do
  @RequestMapping(value = "/qna/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/qna/list"); // /webapp/qna/list.jsp

    return mav;
  }

  /*
   * http://localhost:9090/team6/qna/list_json.do
   * 
   [{"category_title":"��","category_cnt":2,"category_rdate":"2018-12-17 17:29:52.0","qnacategory_no":1,"category_seqno":0,"category_visible":"Y"},
   {"category_title":"�����","category_cnt":5,"category_rdate":"2018-12-17 17:29:54.0","qnacategory_no":2,"category_seqno":0,"category_visible":"Y"}]
   * 
   */
  /**
   * JSON ��� ��ü ���
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/qna/list_json.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity list_json() {
    HttpHeaders responseHeaders = new HttpHeaders();
 
    List<QnACateVO> list = qnaProc.list();

    JSONArray json = new JSONArray(list);
    

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }


  // http://localhost:9090/review/category/delete.do?qnacategory_no=1
  @ResponseBody
  @RequestMapping(value = "/qna/delete.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String delete(int qnaqnacategory_no) {
    QnACateVO qnacateVO = qnaProc.read(qnaqnacategory_no);
    JSONObject obj = new JSONObject(qnacateVO);

    return obj.toString();
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity delete_proc(int qnaqnacategory_no) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    String qna_title = qnaProc.read(qnaqnacategory_no).getQnacategory_name();
    
    if (qnaProc.delete(qnaqnacategory_no) == 1) {
      msgs.put("ī�װ��� �����߽��ϴ�.");
      msgs.put("������ ī�װ� [" + qna_title + "]");
    } else {
      msgs.put("[" + qna_title + "] ī�װ� ������ �����߽��ϴ�.");
      msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  
  // http://localhost:9090/review/category/update.do?qnacategory_no=1
  @ResponseBody
  @RequestMapping(value = "/qna/update.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String update(int qnaqnacategory_no) {
    QnACateVO qnacateVO = qnaProc.read(qnaqnacategory_no);
    JSONObject obj = new JSONObject(qnacateVO);

    return obj.toString();
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/qna/update.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity update_proc(QnACateVO qnacateVO) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    String qna_title = qnaProc.read(qnacateVO.getQnacategory_no()).getQnacategory_name();
    
    if (qnaProc.update(qnacateVO) == 1) {
      msgs.put("ī�װ��� �����߽��ϴ�.");
      msgs.put("������ ī�װ� [" + qna_title + "]");
    } else {
      msgs.put("[" + qna_title + "] ī�װ� ������ �����߽��ϴ�.");
      msgs.put("�ٽ��ѹ� �õ����ּ���. �� ����: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET executed");
    ModelAndView mav = new ModelAndView();
    
    List<QnACateVO> qnacate_list = qnaProc.all_read();
    mav.addObject("qnacate_list", qnacate_list);
    
    mav.setViewName("/qna/create"); // /webapp/review/create.jsp

    return mav;
  }
  
  
  /**
   * ��� ó��
   * @param request
   * @param qnaVO
   * @return
   */
  @RequestMapping(value = "/qna/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, QnAVO qnaVO) {
    // System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
    qnaProc.qna_create(qnaVO);
    mav.setViewName("redirect:/qna/qna_list.do?qnacategory_no="+qnaVO.getQnacategory_no());

    return mav;
  }
  
  
  /**
   * ��� + �˻� + ����¡ ����
   * @param categoryno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/qna/qna_list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView qna_list(
      @RequestParam(value="qnacategory_no") int qnacategory_no,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    // System.out.println("--> list_by_category() GET called.");
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // �˻� ��� �߰�,  /webapp/contents/list_by_category_search_paging.jsp
    mav.setViewName("/qna/qna_list");   
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("qnacategory_no", qnacategory_no); // #{categoryno}
    hashMap.put("nowPage", nowPage);       
    
    // �˻� ���
    List<QnAVO> list = qnaProc.list_by_category_search_paging(hashMap);
    mav.addObject("list", list);

    // �˻��� ���ڵ� ����
    int search_count = qnaProc.search_count(hashMap);
    mav.addObject("search_count", search_count);
    
    // mav.addObject("word", word);
  
    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     *
     * @param categoryno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻��� 
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = qnaProc.paging(qnacategory_no, search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }
  
  
  @RequestMapping(value = "/qna/read.do", method = RequestMethod.GET)
  public ModelAndView qna_read(int qna_no) {
    ModelAndView mav = new ModelAndView();

    QnAVO qnaVO = qnaProc.qna_read(qna_no);
    mav.addObject("qnaVO", qnaVO);
    
    mav.setViewName("/qna/read"); // /webapp/category/list.jsp

    return mav;
  }
  
  
  @RequestMapping(value = "/qna/reply.do", method = RequestMethod.GET)
  public ModelAndView qna_reply(int qna_no) {
    ModelAndView mav = new ModelAndView();

    QnAVO qnaVO = qnaProc.qna_read(qna_no);
    int qnacategory_no = qnaVO.getQnacategory_no();
    
    QnACateVO qnacateVO = qnaProc.read(qnacategory_no);
    mav.addObject("qnacateVO", qnacateVO);
    
    mav.setViewName("/qna/reply"); // /webapp/category/list.jsp

    return mav;
  }
  
  
  
  @RequestMapping(value="/qna/reply.do", method=RequestMethod.POST)
  public ModelAndView reply(RedirectAttributes redirectAttributes, 
                                       HttpServletRequest request, 
                                       QnAVO qnaVO,
                                       @RequestParam(value="nowPage", defaultValue="1") int nowPage){
    // System.out.println("Controller word: " + word);
    
    // System.out.println("--> create() POST called.");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/qna/qna_list"); // webapp/contents/reply_message.jsp
    
    int qnacategory_no = qnaVO.getQnacategory_no();

    // ȸ�� ���� �� session ���κ���
    // int mno = (Integer)session.getAttribute("mno");
    qnaVO.setMember_no(3);
    
    // --------------------------- �亯 ���� �ڵ� ���� --------------------------
    QnAVO parentVO = qnaProc.qna_read(qnaVO.getQna_no()); // �θ�� ���� ����
    
    qnaVO.setQna_grpno(parentVO.getQna_grpno());     // �׷� ��ȣ
    qnaVO.setQna_ansnum(parentVO.getQna_ansnum()); // �亯 ����
    qnaVO.setQnacategory_no(parentVO.getQnacategory_no());

    qnaProc.updateAnsnum(qnaVO); // ���� ��ϵ� �亯 �ڷ� +1 ó����.

    qnaVO.setQna_indent(parentVO.getQna_indent() + 1); // �亯 ���� ����
    qnaVO.setQna_ansnum(parentVO.getQna_ansnum() + 1); // �θ� �ٷ� �Ʒ� ���
    // --------------------------- �亯 ���� �ڵ� ���� --------------------------
    
    int count = qnaProc.reply(qnaVO); // DBMS �亯 ó��
    
    // redirect�ÿ��� request�� �����̾ȵ����� �Ʒ��� ����� �̿��Ͽ� ������ ����
    redirectAttributes.addAttribute("count", count); // 1 or 0
    redirectAttributes.addAttribute("qna_no", qnaVO.getQna_no());
    redirectAttributes.addAttribute("qnacategory_no", qnaVO.getQnacategory_no());
    redirectAttributes.addAttribute("nowPage", nowPage);
    
    mav.setViewName("redirect:/qna/qna_list.do");
    
    return mav;
  }
  
  
  @RequestMapping(value = "/qna/qna_pw.do", method = RequestMethod.POST)
  public ModelAndView qna_pw(HttpServletRequest request, QnAVO qnaVO) {
    // System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
    
    int count = qnaProc.qna_pw(qnaVO);
    if(count == 1){ // ��й�ȣ ��ġ
      mav.setViewName("redirect:/qna/read.do?qna_no="+qnaVO.getQna_no()+"&qnacategory_no="+qnaVO.getQnacategory_no());
    }
    else {
      mav.setViewName("redirect:/qna/qna_list.do?qnacategory_no="+qnaVO.getQnacategory_no());
    }
    return mav;
  }
}
 




