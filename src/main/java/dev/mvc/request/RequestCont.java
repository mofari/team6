package dev.mvc.request;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.event.EventVO;
import dev.mvc.event.Events;
import dev.mvc.event.Event_FileVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class RequestCont {
  @Autowired
  @Qualifier("dev.mvc.event.RequestProc")
  private RequestProcInter requestProc = null;
  
  public RequestCont() {
    System.out.println("--> RequestCont created.");
  }
  
  /**
   * 조회
   * 
   * @param event_requestno
   * @return
   */
  @RequestMapping(value = "/request/read.do", method = RequestMethod.GET)
  public ModelAndView read(int event_requestno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/request/read"); // /webapp/contents/read.jsp

    RequestVO requestVO = requestProc.read(event_requestno);
    
    mav.addObject("requestVO", requestVO);

    return mav;
  }
  
  /**
   * 목록 페이징 없음
   * @return
   */
  @RequestMapping(value = "/request/list_event_request.do", method = RequestMethod.GET)
  public ModelAndView list(int event_no) {
    ModelAndView mav = new ModelAndView();
    
    
    List<RequestVO> list = requestProc.list_event_request(event_no);
    mav.addObject("list", list);

    mav.setViewName("/request/list_event_request");

    return mav;
  }
  
  /**
   * 등록 폼
   * @param event_requestno
   * @return
   */
  @RequestMapping(value ="/request/create.do", method = RequestMethod.GET)
  public ModelAndView create(int event_no){
    // http://localhost:9090/review/event/create.do
    
    System.out.println("--> create() GET executed");
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/request/create");
    
    return mav;
  }
  
  /**
   * 등록 처리
   * 
   * @param request
   * @param requestVO
   * @return
   */
  @RequestMapping(value = "/request/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, RequestVO requestVO) {
    // System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();

    int count = requestProc.create(requestVO);

    mav.setViewName(
        "redirect:/request/create_message.jsp?count=" + count); // /webapp/contents/create_message.jsp
    return mav;
  }
  
  /**
   * 수정 폼
   * 
   * @param event_requestno
   * @return
   */
  @RequestMapping(value = "/request/update.do", method = RequestMethod.GET)
  public ModelAndView update(int event_requestno) {
    ModelAndView mav = new ModelAndView();

    RequestVO requestVO = requestProc.read(event_requestno);
    mav.addObject("requestVO", requestVO);

    mav.setViewName("/request/update"); // /webapp/request/update.jsp
    return mav;
  }
  
  /**
   * 수정 처리
   * 
   * @param request
   * @param requestVO
   * @return
   */
  @RequestMapping(value = "/request/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest request, RequestVO requestVO) {
    ModelAndView mav = new ModelAndView();
    
     requestProc.update(requestVO);

    mav.setViewName("redirect:/request/list_event_request.do?event_no="+requestVO.getEvent_no());
    
    return mav;
  }
  
  /**
   * 삭제 폼 
   * 
   * @param event_requestno
   * @return
   */
  @RequestMapping(value = "/request/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int event_requestno) {
    // System.out.println("--> delete() GET executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/request/delete");

    RequestVO requestVO = requestProc.read(event_requestno);
    mav.addObject("requestVO", requestVO);

    return mav;
  }

  /**
   * 삭제처리
   * @param request
   * @param event_requestno
   * @return
   */
  @RequestMapping(value = "/request/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpServletRequest request,int event_requestno, int event_no) {
    ModelAndView mav = new ModelAndView();
    
    int count = requestProc.delete(event_requestno); // 레코드 삭제
    
    mav.setViewName("redirect:/request/delete_message.jsp?count=" + count + "&event_no=" + event_no);

    return mav;
  }
  
  
  
}
