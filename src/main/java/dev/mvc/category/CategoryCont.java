package dev.mvc.category;

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
import org.springframework.web.servlet.ModelAndView;


@Controller
public class CategoryCont {
  @Autowired
  @Qualifier("dev.mvc.category.CategoryProc")
  private CategoryProcInter categoryProc = null;

  public CategoryCont() {
    System.out.println("--> CategoryCont created.");
  }
  
//http://localhost:9090/review/category/create_json.do?category_title=기타&category_visible=Y&category_ids=admin
 // {"msgs":["카테고리를 등록했습니다.","등록된 카테고리 등산"]}
 @ResponseBody
 @RequestMapping(value = "/category/create_json.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
 public ResponseEntity create_json(CategoryVO categoryVO) {
   HttpHeaders responseHeaders = new HttpHeaders();

   JSONObject json = new JSONObject();
   JSONArray msgs = new JSONArray();

   if (categoryProc.create(categoryVO) == 1) {
     msgs.put("카테고리를 등록했습니다.");
     msgs.put("등록된 카테고리 " + categoryVO.getCategory_title());
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
  // http://localhost:9090/review/category/list.do
  @RequestMapping(value = "/category/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    //List<CategoryVO> category_list = categoryProc.list();
    //mav.addObject("category_list", category_list);
    
    mav.setViewName("/category/list"); // /webapp/category/list.jsp

    return mav;
  }

  /*
   * http://localhost:9090/review/category/list_json.do
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
  @RequestMapping(value = "/category/list_json.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity list_json() {
    HttpHeaders responseHeaders = new HttpHeaders();
    List<CategoryVO> list = categoryProc.list();

    JSONArray json = new JSONArray(list);
    

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }


  // http://localhost:9090/review/category/delete.do?category_no=1
  @ResponseBody
  @RequestMapping(value = "/category/delete.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String delete(int category_no) {
    CategoryVO categoryVO = categoryProc.read(category_no);
    JSONObject obj = new JSONObject(categoryVO);

    return obj.toString();
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/category/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity delete_proc(int category_no) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    String category_title = categoryProc.read(category_no).getCategory_title();
    
    if (categoryProc.delete(category_no) == 1) {
      msgs.put("카테고리를 삭제했습니다.");
      msgs.put("삭제된 카테고리 [" + category_title + "]");
    } else {
      msgs.put("[" + category_title + "] 카테고리 삭제에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  
  // http://localhost:9090/review/category/update.do?category_no=1
  @ResponseBody
  @RequestMapping(value = "/category/update.do", 
                           method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String update(int category_no) {
    CategoryVO categoryVO = categoryProc.read(category_no);
    JSONObject obj = new JSONObject(categoryVO);

    return obj.toString();
  }
  
  
  @ResponseBody
  @RequestMapping(value = "/category/update.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity update_proc(CategoryVO categoryVO) {
    HttpHeaders responseHeaders = new HttpHeaders();

    JSONObject json = new JSONObject();
    JSONArray msgs = new JSONArray();
    
    String category_title = categoryProc.read(categoryVO.getCategory_no()).getCategory_title();
    
    if (categoryProc.update(categoryVO) == 1) {
      msgs.put("카테고리를 수정했습니다.");
      msgs.put("수정된 카테고리 [" + category_title + "]");
    } else {
      msgs.put("[" + category_title + "] 카테고리 수정에 실패했습니다.");
      msgs.put("다시한번 시도해주세요. ☏ 문의: 000-0000-0000");
    }
    json.put("msgs", msgs);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
}
 




