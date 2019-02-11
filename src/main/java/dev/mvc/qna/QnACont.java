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
  
//http://localhost:9090/review/category/create_json.do?category_title=기타&category_visible=Y&category_ids=admin
 // {"msgs":["카테고리를 등록했습니다.","등록된 카테고리 등산"]}
 @ResponseBody
 @RequestMapping(value = "/qna/create_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 public ResponseEntity create_json(QnACateVO qnacateVO) {
   HttpHeaders responseHeaders = new HttpHeaders();

   JSONObject json = new JSONObject();
   JSONArray msgs = new JSONArray();

   if (qnaProc.create(qnacateVO) == 1) {
     msgs.put("카테고리를 등록했습니다.");
     msgs.put("등록된 카테고리 " + qnacateVO.getQnacategory_name());
   } else {
     msgs.put("카테고리 등록에 실패했습니다.");
     msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
   }
   json.put("msgs", msgs);

   return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
 }

  
  /**
   * 전체 목록
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
   [{"category_title":"개","category_cnt":2,"category_rdate":"2018-12-17 17:29:52.0","qnacategory_no":1,"category_seqno":0,"category_visible":"Y"},
   {"category_title":"고양이","category_cnt":5,"category_rdate":"2018-12-17 17:29:54.0","qnacategory_no":2,"category_seqno":0,"category_visible":"Y"}]
   * 
   */
  /**
   * JSON 기반 전체 목록
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
      msgs.put("카테고리를 삭제했습니다.");
      msgs.put("삭제된 카테고리 [" + qna_title + "]");
    } else {
      msgs.put("[" + qna_title + "] 카테고리 삭제에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
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
      msgs.put("카테고리를 수정했습니다.");
      msgs.put("수정된 카테고리 [" + qna_title + "]");
    } else {
      msgs.put("[" + qna_title + "] 카테고리 수정에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
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
   * 등록 처리
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
   * 목록 + 검색 + 페이징 지원
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
    
    // 검색 기능 추가,  /webapp/contents/list_by_category_search_paging.jsp
    mav.setViewName("/qna/qna_list");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("qnacategory_no", qnacategory_no); // #{categoryno}
    hashMap.put("nowPage", nowPage);       
    
    // 검색 목록
    List<QnAVO> list = qnaProc.list_by_category_search_paging(hashMap);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = qnaProc.search_count(hashMap);
    mav.addObject("search_count", search_count);
    
    // mav.addObject("word", word);
  
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     *
     * @param categoryno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어 
     * @return 페이징 생성 문자열
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

    // 회원 개발 후 session 으로변경
    // int mno = (Integer)session.getAttribute("mno");
    qnaVO.setMember_no(3);
    
    // --------------------------- 답변 관련 코드 시작 --------------------------
    QnAVO parentVO = qnaProc.qna_read(qnaVO.getQna_no()); // 부모글 정보 추출
    
    qnaVO.setQna_grpno(parentVO.getQna_grpno());     // 그룹 번호
    qnaVO.setQna_ansnum(parentVO.getQna_ansnum()); // 답변 순서
    qnaVO.setQnacategory_no(parentVO.getQnacategory_no());

    qnaProc.updateAnsnum(qnaVO); // 현재 등록된 답변 뒤로 +1 처리함.

    qnaVO.setQna_indent(parentVO.getQna_indent() + 1); // 답변 차수 증가
    qnaVO.setQna_ansnum(parentVO.getQna_ansnum() + 1); // 부모 바로 아래 등록
    // --------------------------- 답변 관련 코드 종료 --------------------------
    
    int count = qnaProc.reply(qnaVO); // DBMS 답변 처리
    
    // redirect시에는 request가 전달이안됨으로 아래의 방법을 이용하여 데이터 전달
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
    if(count == 1){ // 비밀번호 일치
      mav.setViewName("redirect:/qna/read.do?qna_no="+qnaVO.getQna_no()+"&qnacategory_no="+qnaVO.getQnacategory_no());
    }
    else {
      mav.setViewName("redirect:/qna/qna_list.do?qnacategory_no="+qnaVO.getQnacategory_no());
    }
    return mav;
  }
}
 




