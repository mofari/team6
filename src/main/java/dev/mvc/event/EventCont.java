package dev.mvc.event;

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

import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class EventCont {
 @Autowired
 @Qualifier("dev.mvc.event.EventProc")
 private EventProcInter eventProc = null;
 
 public EventCont() {
   System.out.println("--> EventCont created.");
 }
 
 /**
  * 등록 폼
  * @param eventno
  * @return
  */
 @RequestMapping(value ="/event/create.do", method = RequestMethod.GET)
 public ModelAndView create(){
   // http://localhost:9090/review/event/create.do
   System.out.println("--> create() GET executed");
   ModelAndView mav = new ModelAndView();
   
   mav.setViewName("/event/create");
   
   return mav;
 }
 
 /**
  * 등록 처리
  * 
  * @param request
  * @param contentsVO
  * @return
  */
 @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
 public ModelAndView create(HttpServletRequest request, EventVO eventVO) {
   // System.out.println("--> create() POST executed");
   ModelAndView mav = new ModelAndView();

   // -------------------------------------------------------------------
   // 파일 전송 코드 시작
   // -------------------------------------------------------------------
   String upDir = Tool.getRealPath(request, "/event/storage");
   List<MultipartFile> filesMF = eventVO.getFilesMF(); // Spring이 File 객체를
                                                          // 저장해둠.

   // System.out.println("--> filesMF.get(0).getSize(): " +
   // filesMF.get(0).getSize());

   String files = ""; // 컬럼에 저장할 파일명
   String files_item = ""; // 하나의 파일명
   String sizes = "";
   long sizes_item = 0; // 하나의 파일 사이즈
   String thumbs = ""; // Thumb 파일들
   String thumbs_item = ""; // 하나의 Thumb 파일명

   int count = filesMF.size(); // 업로드된 파일 갯수

   // Spring은 파일 선택을 안해도 1개의 MultipartFile 객체가 생성됨.
   // System.out.println("--> 업로드된 파일 갯수 count: " + count);

   if (count > 0) { // 전송 파일이 존재한다면
     // for (MultipartFile multipartFile: filesMF) {
     for (int i = 0; i < count; i++) {
       MultipartFile multipartFile = filesMF.get(i); // 0 ~
       System.out.println("multipartFile.getName(): " + multipartFile.getName());

       // if (multipartFile.getName().length() > 0) { // 전송파일이 있는지 체크, filesMF
       if (multipartFile.getSize() > 0) { // 전송파일이 있는지 체크
         // System.out.println("전송 파일이 있습니다.");
         files_item = Upload.saveFileSpring(multipartFile, upDir);
         sizes_item = multipartFile.getSize();

         if (Tool.isImage(files_item)) {
           thumbs_item = Tool.preview(upDir, files_item, 120, 80); // Thumb 이미지
                                                                   // 생성
         }

         if (i != 0 && i < count) { // index가 1 이상이면(두번째 파일 이상이면)
           // 하나의 컬럼에 여러개의 파일명을 조합하여 저장, file1.jpg/file2.jpg/file3.jpg
           files = files + "/" + files_item;
           // 하나의 컬럼에 여러개의 파일 사이즈를 조합하여 저장, 12546/78956/42658
           sizes = sizes + "/" + sizes_item;
           // 미니 이미지를 조합하여 하나의 컬럼에 저장
           thumbs = thumbs + "/" + thumbs_item;
         } else if (multipartFile.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로
                                                   // 크기 체크
           files = files_item; // file1.jpg
           sizes = "" + sizes_item; // 123456
           thumbs = thumbs_item; // file1_t.jpg
         }

       } // if (multipartFile.getSize() > 0) {  END
       
     }
   }
   eventVO.setEvent_img(files);
   eventVO.setEvent_imgsize(sizes);
   eventVO.setEvent_thumb(thumbs);
   // -------------------------------------------------------------------
   // 파일 전송 코드 종료
   // -------------------------------------------------------------------

   count = eventProc.create(eventVO);

   mav.setViewName(
       "redirect:/event/create_message.jsp?count=" + count); // /webapp/contents/create_message.jsp
   return mav;
 }
 
 /**
  * 조회
  * 
  * @param event_no
  * @return
  */
 @RequestMapping(value = "/event/read.do", method = RequestMethod.GET)
 public ModelAndView read(int event_no) {
   ModelAndView mav = new ModelAndView();
   
   EventVO eventVO = eventProc.read(event_no);
   mav.addObject("eventVO", eventVO);
   mav.addObject("good_cnt", eventVO.getEvent_good());
   
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("event_no", event_no);
   hashMap.put("member_no", eventVO.getMember_no());
   
   int like_check = eventProc.like_check(hashMap);
   mav.addObject("like_check", like_check);
   
   mav.setViewName("/event/read"); // /webapp/contents/read.jsp
   
   return mav;
 }
 
 @RequestMapping(value = "/event/list_event.do", method = RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   
   List<EventVO> list = eventProc.list_event();
   mav.addObject("list", list);
   
   mav.setViewName("/event/list_event"); // /webapp/contents/list_event.jsp

   return mav;
 }
 
 /**
  * 목록 + 페이징 지원
  * @param nowPage
  * @return
  */
 @RequestMapping(value = "/event/list_event_paging.do", 
                                      method = RequestMethod.GET)
 public ModelAndView list_event_paging(
     @RequestParam(value="nowPage", defaultValue="1") int nowPage
     ) { 
   // System.out.println("--> list_by_category() GET called.");
   System.out.println("--> nowPage: " + nowPage);
   
   ModelAndView mav = new ModelAndView();
   
   mav.setViewName("/event/list_event_paging"); 
   
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("nowPage", nowPage);       
   
   List<EventVO> list = eventProc.list_event_paging(hashMap);
   mav.addObject("list", list);
   
   // 검색된 레코드 갯수
   int total_count = eventProc.total_count(hashMap); 
   mav.addObject("total_count", total_count);

 
   /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
    * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
    *
    * @param nowPage     현재 페이지
    * @return 페이징 생성 문자열
    */ 
   String paging = eventProc.paging(total_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav;
 }
 
 /**
  * 다중 파일 수정 폼
  * 
  * @param event_no
  * @return
  */
 @RequestMapping(value = "/event/update.do", method = RequestMethod.GET)
 public ModelAndView update(int event_no) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/event/update"); // /webapp/event/update.jsp

   EventVO eventVO = eventProc.read(event_no);
   mav.addObject("eventVO", eventVO);

   ArrayList<FileVO> file_list = eventProc.getThumbs(eventVO);

   mav.addObject("file_list", file_list);

   return mav;
 }
 
 /**
  * - 글만 수정하는 경우의 구현 - 파일만 수정하는 경우의 구현 - 글과 파일을 동시에 수정하는 경우의 구현
  * 
  * @param request
  * @param eventVO
  * @return
  */
 @RequestMapping(value = "/event/update.do", method = RequestMethod.POST)
 public ModelAndView update(RedirectAttributes redirectAttributes, HttpServletRequest request, EventVO eventVO) {
   ModelAndView mav = new ModelAndView();
   
   System.out.println(eventVO.getEvent_ck());
   

   // -------------------------------------------------------------------
   // 파일 전송 코드 시작
   // -------------------------------------------------------------------
   String upDir = Tool.getRealPath(request, "/event/storage");
   List<MultipartFile> filesMF = eventVO.getFilesMF(); // Spring이 File 객체를
                                                          // 저장해둠.

   // System.out.println("--> filesMF.get(0).getSize(): " +
   // filesMF.get(0).getSize());

   String files = ""; // 컬럼에 저장할 파일명
   String files_item = ""; // 하나의 파일명
   String sizes = "";
   long sizes_item = 0; // 하나의 파일 사이즈
   String thumbs = ""; // Thumb 파일들
   String thumbs_item = ""; // 하나의 Thumb 파일명

   int count = filesMF.size(); // 업로드된 파일 갯수

   // 기존의 등록 정보 조회
   EventVO eventVO_old = eventProc.read(eventVO.getEvent_no());
   if (filesMF.get(0).getSize() > 0) { // 새로운 파일을 등록함으로 기존에 등록된 파일 목록 삭제
     // thumbs 파일 삭제
     String thumbs_old = eventVO_old.getEvent_thumb();
     StringTokenizer thumbs_st = new StringTokenizer(thumbs_old, "/");
     while (thumbs_st.hasMoreTokens()) {
       String fname = upDir + thumbs_st.nextToken();
       Tool.deleteFile(fname);
     }

     // 원본 파일 삭제
     String files_old = eventVO_old.getEvent_img();
     StringTokenizer files_st = new StringTokenizer(files_old, "/");
     while (files_st.hasMoreTokens()) {
       String fname = upDir + files_st.nextToken();
       Tool.deleteFile(fname);
     }

     // --------------------------------------------
     // 새로운 파일의 등록 시작
     // --------------------------------------------
     // for (MultipartFile multipartFile: filesMF) {
     for (int i = 0; i < count; i++) {
       MultipartFile multipartFile = filesMF.get(i); // 0 ~
       System.out.println("multipartFile.getName(): " + multipartFile.getName());

       // if (multipartFile.getName().length() > 0) { // 전송파일이 있는지 체크, filesMF
       if (multipartFile.getSize() > 0) { // 전송파일이 있는지 체크
         // System.out.println("전송 파일이 있습니다.");
         files_item = Upload.saveFileSpring(multipartFile, upDir);
         sizes_item = multipartFile.getSize();

         if (Tool.isImage(files_item)) {
           thumbs_item = Tool.preview(upDir, files_item, 120, 80); // Thumb 이미지
                                                                   // 생성
         }

         if (i != 0 && i < count) { // index가 1 이상이면(두번째 파일 이상이면)
           // 하나의 컬럼에 여러개의 파일명을 조합하여 저장, file1.jpg/file2.jpg/file3.jpg
           files = files + "/" + files_item;
           // 하나의 컬럼에 여러개의 파일 사이즈를 조합하여 저장, 12546/78956/42658
           sizes = sizes + "/" + sizes_item;
           // 미니 이미지를 조합하여 하나의 컬럼에 저장
           thumbs = thumbs + "/" + thumbs_item;
         } else if (multipartFile.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로
                                                   // 크기 체크
           files = files_item; // file1.jpg
           sizes = "" + sizes_item; // 123456
           thumbs = thumbs_item; // file1_t.jpg
         }

       }
     } // for END
     // --------------------------------------------
     // 새로운 파일의 등록 종료
     // --------------------------------------------

   } else { // 글만 수정하는 경우, 기존의 파일 정보 재사용
     files = eventVO_old.getEvent_img();
     sizes = eventVO_old.getEvent_imgsize();
     thumbs = eventVO_old.getEvent_thumb();
   }
   eventVO.setEvent_img(files);
   eventVO.setEvent_imgsize(sizes);
   eventVO.setEvent_thumb(thumbs);

   //eventVO.setMno(1); // 회원 개발후 session으로 변경

   count = eventProc.update(eventVO);

   redirectAttributes.addAttribute("count", count);

   // redirect시에는 request가 전달이안됨으로 아래의 방법을 이용하여 데이터 전달
   redirectAttributes.addAttribute("event_no", eventVO.getEvent_no());
   
   mav.setViewName("redirect:/event/update_message.jsp?count=" + count);

   return mav;

 }
 
 /**
  * 삭제 폼 
  * 
  * @param event_no
  * @param categoryno
  * @return
  */
 @RequestMapping(value = "/event/delete.do", method = RequestMethod.GET)
 public ModelAndView delete(int event_no) {
   // System.out.println("--> delete() GET executed");
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/event/delete");

   EventVO eventVO = eventProc.read(event_no);
   mav.addObject("eventVO", eventVO);

   return mav;
 }

 @RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
 public ModelAndView delete(RedirectAttributes redirectAttributes, 
                                       HttpServletRequest request, 
                                       int event_no, 
                                       @RequestParam(value="nowPage", defaultValue="1") int nowPage 
     ) {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/event/delete_message"); // /webapp/contents/delete_message.jsp

   String upDir = Tool.getRealPath(request, "/event/storage"); // 저장 폴더 절대
                                                                  // 경로

   EventVO eventVO = eventProc.read(event_no); // 삭제할 파일 정보를 읽기 위한
                                                          // 목적

   String thumbs_old = eventVO.getEvent_thumb();
   String files_old = eventVO.getEvent_img();

   StringTokenizer thumbs_st = new StringTokenizer(thumbs_old, "/"); // Thumbs
   while (thumbs_st.hasMoreTokens()) { // 단어가 있는지 검사
     String fname = upDir + thumbs_st.nextToken(); // 단어 추출
     Tool.deleteFile(fname);
   }

   StringTokenizer files_st = new StringTokenizer(files_old, "/"); // files
   while (files_st.hasMoreTokens()) { // 단어가 있는지 검사
     String fname = upDir + files_st.nextToken(); // 단어 추출
     Tool.deleteFile(fname);
   }

   int count = eventProc.delete(event_no); // 레코드 삭제

   if (count == 1) {
     // 4개의 레코드가 하나의 페이지인경우 5번째 레코드가 삭제되면 페이지수도
     // 2페이지에서 1 페이지로 줄여야합니다. 
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     if (eventProc.total_count(hashMap) % Events.RECORD_PER_PAGE == 0){ 
       nowPage = nowPage - 1;
       if (nowPage < 1){
         nowPage = 1;
       }
     }
     
   }

   // redirect시에는 request가 전달이안됨으로 아래의 방법을 이용하여 데이터 전달

   redirectAttributes.addAttribute("event_no", eventVO.getEvent_no());
   redirectAttributes.addAttribute("nowPage", nowPage);

   mav.setViewName("redirect:/event/delete_message.jsp?count=" + count);

   return mav;
 }
 
 /**
  * 좋아요 <-> 좋아요 해제
  * @param event_no
  * @return
  */
 @ResponseBody
 @RequestMapping(value = "/event/like_change.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
 public String like_change(int event_no) {
   System.out.println("--> like_change() GET executed");
   
   EventVO eventVO = eventProc.read(event_no);
   int member_no = eventVO.getMember_no();
   
   JSONObject obj = new JSONObject();
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("event_no", event_no);
   hashMap.put("member_no", member_no);
   
   int like_check = eventProc.like_check(hashMap);    // 좋아요 테이블에서 회원이 좋아요 했는지 안했는지 카운트로 확인 ( 1: 누름 / 0: 안누름)
   
   if(like_check == 0){  // 안누른 상태 (= 좋아요를 누른다면)
     eventProc.like_member_insert(hashMap);  // 좋아요 테이블에 좋아요한 회원 추가
     eventProc.like_up(event_no);    // 좋아요 갯수 증가
   } else if(like_check == 1) {  // 누른 상태 (= 좋아요 취소시)
     eventProc.like_member_delete(hashMap);  // 좋아요 테이블에 좋아요한 회원 삭제
     eventProc.like_down(event_no);    // 좋아요 갯수 감소
   }
   eventVO = eventProc.read(event_no);
   
   obj.put("like_check", like_check);    // 성공시 1
   obj.put("good_cnt", eventVO.getEvent_good());
   
   return obj.toString();
   
 }
 
}
