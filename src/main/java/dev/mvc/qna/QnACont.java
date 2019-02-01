package dev.mvc.qna;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
   [{"category_title":"개","category_cnt":2,"category_rdate":"2018-12-17 17:29:52.0","category_no":1,"category_seqno":0,"category_visible":"Y"},
   {"category_title":"고양이","category_cnt":5,"category_rdate":"2018-12-17 17:29:54.0","category_no":2,"category_seqno":0,"category_visible":"Y"}]
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


  // http://localhost:9090/review/category/delete.do?category_no=1
  @ResponseBody
  @RequestMapping(value = "/qna/delete.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String delete(int qnacategory_no) {
    QnACateVO qnacateVO = qnaProc.read(qnacategory_no);
    JSONObject obj = new JSONObject(qnacateVO);

    return obj.toString();
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/qna/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity delete_proc(int qnacategory_no) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    String qna_title = qnaProc.read(qnacategory_no).getQnacategory_name();
    
    if (qnaProc.delete(qnacategory_no) == 1) {
      msgs.put("카테고리를 삭제했습니다.");
      msgs.put("삭제된 카테고리 [" + qna_title + "]");
    } else {
      msgs.put("[" + qna_title + "] 카테고리 삭제에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  
  // http://localhost:9090/review/category/update.do?category_no=1
  @ResponseBody
  @RequestMapping(value = "/qna/update.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String update(int qnacategory_no) {
    QnACateVO qnacateVO = qnaProc.read(qnacategory_no);
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
    System.out.println("VISIBLE: "+qnaVO.getQna_visible());
    System.out.println("PW: "+qnaVO.getQna_pw());
    System.out.println("MEMBER: "+qnaVO.getMember_no());
    qnaProc.qna_create(qnaVO);
    mav.setViewName("redirect:/qna/list.jsp");

    return mav;
  }
}
 




