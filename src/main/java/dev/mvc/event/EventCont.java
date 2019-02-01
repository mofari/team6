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
  * ��� ��
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
  * ��� ó��
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
   // ���� ���� �ڵ� ����
   // -------------------------------------------------------------------
   String upDir = Tool.getRealPath(request, "/event/storage");
   List<MultipartFile> filesMF = eventVO.getFilesMF(); // Spring�� File ��ü��
                                                          // �����ص�.

   // System.out.println("--> filesMF.get(0).getSize(): " +
   // filesMF.get(0).getSize());

   String files = ""; // �÷��� ������ ���ϸ�
   String files_item = ""; // �ϳ��� ���ϸ�
   String sizes = "";
   long sizes_item = 0; // �ϳ��� ���� ������
   String thumbs = ""; // Thumb ���ϵ�
   String thumbs_item = ""; // �ϳ��� Thumb ���ϸ�

   int count = filesMF.size(); // ���ε�� ���� ����

   // Spring�� ���� ������ ���ص� 1���� MultipartFile ��ü�� ������.
   // System.out.println("--> ���ε�� ���� ���� count: " + count);

   if (count > 0) { // ���� ������ �����Ѵٸ�
     // for (MultipartFile multipartFile: filesMF) {
     for (int i = 0; i < count; i++) {
       MultipartFile multipartFile = filesMF.get(i); // 0 ~
       System.out.println("multipartFile.getName(): " + multipartFile.getName());

       // if (multipartFile.getName().length() > 0) { // ���������� �ִ��� üũ, filesMF
       if (multipartFile.getSize() > 0) { // ���������� �ִ��� üũ
         // System.out.println("���� ������ �ֽ��ϴ�.");
         files_item = Upload.saveFileSpring(multipartFile, upDir);
         sizes_item = multipartFile.getSize();

         if (Tool.isImage(files_item)) {
           thumbs_item = Tool.preview(upDir, files_item, 120, 80); // Thumb �̹���
                                                                   // ����
         }

         if (i != 0 && i < count) { // index�� 1 �̻��̸�(�ι�° ���� �̻��̸�)
           // �ϳ��� �÷��� �������� ���ϸ��� �����Ͽ� ����, file1.jpg/file2.jpg/file3.jpg
           files = files + "/" + files_item;
           // �ϳ��� �÷��� �������� ���� ����� �����Ͽ� ����, 12546/78956/42658
           sizes = sizes + "/" + sizes_item;
           // �̴� �̹����� �����Ͽ� �ϳ��� �÷��� ����
           thumbs = thumbs + "/" + thumbs_item;
         } else if (multipartFile.getSize() > 0) { // ������ ��� ���� ��ü�� 1�� ����������
                                                   // ũ�� üũ
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
   // ���� ���� �ڵ� ����
   // -------------------------------------------------------------------

   count = eventProc.create(eventVO);

   mav.setViewName(
       "redirect:/event/create_message.jsp?count=" + count); // /webapp/contents/create_message.jsp
   return mav;
 }
 
 /**
  * ��ȸ
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
  * ��� + ����¡ ����
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
   
   // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
   HashMap<String, Object> hashMap = new HashMap<String, Object>();
   hashMap.put("nowPage", nowPage);       
   
   List<EventVO> list = eventProc.list_event_paging(hashMap);
   mav.addObject("list", list);
   
   // �˻��� ���ڵ� ����
   int total_count = eventProc.total_count(hashMap); 
   mav.addObject("total_count", total_count);

 
   /*
    * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
    * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
    *
    * @param nowPage     ���� ������
    * @return ����¡ ���� ���ڿ�
    */ 
   String paging = eventProc.paging(total_count, nowPage);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav;
 }
 
 /**
  * ���� ���� ���� ��
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
  * - �۸� �����ϴ� ����� ���� - ���ϸ� �����ϴ� ����� ���� - �۰� ������ ���ÿ� �����ϴ� ����� ����
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
   // ���� ���� �ڵ� ����
   // -------------------------------------------------------------------
   String upDir = Tool.getRealPath(request, "/event/storage");
   List<MultipartFile> filesMF = eventVO.getFilesMF(); // Spring�� File ��ü��
                                                          // �����ص�.

   // System.out.println("--> filesMF.get(0).getSize(): " +
   // filesMF.get(0).getSize());

   String files = ""; // �÷��� ������ ���ϸ�
   String files_item = ""; // �ϳ��� ���ϸ�
   String sizes = "";
   long sizes_item = 0; // �ϳ��� ���� ������
   String thumbs = ""; // Thumb ���ϵ�
   String thumbs_item = ""; // �ϳ��� Thumb ���ϸ�

   int count = filesMF.size(); // ���ε�� ���� ����

   // ������ ��� ���� ��ȸ
   EventVO eventVO_old = eventProc.read(eventVO.getEvent_no());
   if (filesMF.get(0).getSize() > 0) { // ���ο� ������ ��������� ������ ��ϵ� ���� ��� ����
     // thumbs ���� ����
     String thumbs_old = eventVO_old.getEvent_thumb();
     StringTokenizer thumbs_st = new StringTokenizer(thumbs_old, "/");
     while (thumbs_st.hasMoreTokens()) {
       String fname = upDir + thumbs_st.nextToken();
       Tool.deleteFile(fname);
     }

     // ���� ���� ����
     String files_old = eventVO_old.getEvent_img();
     StringTokenizer files_st = new StringTokenizer(files_old, "/");
     while (files_st.hasMoreTokens()) {
       String fname = upDir + files_st.nextToken();
       Tool.deleteFile(fname);
     }

     // --------------------------------------------
     // ���ο� ������ ��� ����
     // --------------------------------------------
     // for (MultipartFile multipartFile: filesMF) {
     for (int i = 0; i < count; i++) {
       MultipartFile multipartFile = filesMF.get(i); // 0 ~
       System.out.println("multipartFile.getName(): " + multipartFile.getName());

       // if (multipartFile.getName().length() > 0) { // ���������� �ִ��� üũ, filesMF
       if (multipartFile.getSize() > 0) { // ���������� �ִ��� üũ
         // System.out.println("���� ������ �ֽ��ϴ�.");
         files_item = Upload.saveFileSpring(multipartFile, upDir);
         sizes_item = multipartFile.getSize();

         if (Tool.isImage(files_item)) {
           thumbs_item = Tool.preview(upDir, files_item, 120, 80); // Thumb �̹���
                                                                   // ����
         }

         if (i != 0 && i < count) { // index�� 1 �̻��̸�(�ι�° ���� �̻��̸�)
           // �ϳ��� �÷��� �������� ���ϸ��� �����Ͽ� ����, file1.jpg/file2.jpg/file3.jpg
           files = files + "/" + files_item;
           // �ϳ��� �÷��� �������� ���� ����� �����Ͽ� ����, 12546/78956/42658
           sizes = sizes + "/" + sizes_item;
           // �̴� �̹����� �����Ͽ� �ϳ��� �÷��� ����
           thumbs = thumbs + "/" + thumbs_item;
         } else if (multipartFile.getSize() > 0) { // ������ ��� ���� ��ü�� 1�� ����������
                                                   // ũ�� üũ
           files = files_item; // file1.jpg
           sizes = "" + sizes_item; // 123456
           thumbs = thumbs_item; // file1_t.jpg
         }

       }
     } // for END
     // --------------------------------------------
     // ���ο� ������ ��� ����
     // --------------------------------------------

   } else { // �۸� �����ϴ� ���, ������ ���� ���� ����
     files = eventVO_old.getEvent_img();
     sizes = eventVO_old.getEvent_imgsize();
     thumbs = eventVO_old.getEvent_thumb();
   }
   eventVO.setEvent_img(files);
   eventVO.setEvent_imgsize(sizes);
   eventVO.setEvent_thumb(thumbs);

   //eventVO.setMno(1); // ȸ�� ������ session���� ����

   count = eventProc.update(eventVO);

   redirectAttributes.addAttribute("count", count);

   // redirect�ÿ��� request�� �����̾ȵ����� �Ʒ��� ����� �̿��Ͽ� ������ ����
   redirectAttributes.addAttribute("event_no", eventVO.getEvent_no());
   
   mav.setViewName("redirect:/event/update_message.jsp?count=" + count);

   return mav;

 }
 
 /**
  * ���� �� 
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

   String upDir = Tool.getRealPath(request, "/event/storage"); // ���� ���� ����
                                                                  // ���

   EventVO eventVO = eventProc.read(event_no); // ������ ���� ������ �б� ����
                                                          // ����

   String thumbs_old = eventVO.getEvent_thumb();
   String files_old = eventVO.getEvent_img();

   StringTokenizer thumbs_st = new StringTokenizer(thumbs_old, "/"); // Thumbs
   while (thumbs_st.hasMoreTokens()) { // �ܾ �ִ��� �˻�
     String fname = upDir + thumbs_st.nextToken(); // �ܾ� ����
     Tool.deleteFile(fname);
   }

   StringTokenizer files_st = new StringTokenizer(files_old, "/"); // files
   while (files_st.hasMoreTokens()) { // �ܾ �ִ��� �˻�
     String fname = upDir + files_st.nextToken(); // �ܾ� ����
     Tool.deleteFile(fname);
   }

   int count = eventProc.delete(event_no); // ���ڵ� ����

   if (count == 1) {
     // 4���� ���ڵ尡 �ϳ��� �������ΰ�� 5��° ���ڵ尡 �����Ǹ� ����������
     // 2���������� 1 �������� �ٿ����մϴ�. 
     HashMap<String, Object> hashMap = new HashMap<String, Object>();
     if (eventProc.total_count(hashMap) % Events.RECORD_PER_PAGE == 0){ 
       nowPage = nowPage - 1;
       if (nowPage < 1){
         nowPage = 1;
       }
     }
     
   }

   // redirect�ÿ��� request�� �����̾ȵ����� �Ʒ��� ����� �̿��Ͽ� ������ ����

   redirectAttributes.addAttribute("event_no", eventVO.getEvent_no());
   redirectAttributes.addAttribute("nowPage", nowPage);

   mav.setViewName("redirect:/event/delete_message.jsp?count=" + count);

   return mav;
 }
 
 /**
  * ���ƿ� <-> ���ƿ� ����
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
   
   int like_check = eventProc.like_check(hashMap);    // ���ƿ� ���̺��� ȸ���� ���ƿ� �ߴ��� ���ߴ��� ī��Ʈ�� Ȯ�� ( 1: ���� / 0: �ȴ���)
   
   if(like_check == 0){  // �ȴ��� ���� (= ���ƿ並 �����ٸ�)
     eventProc.like_member_insert(hashMap);  // ���ƿ� ���̺� ���ƿ��� ȸ�� �߰�
     eventProc.like_up(event_no);    // ���ƿ� ���� ����
   } else if(like_check == 1) {  // ���� ���� (= ���ƿ� ��ҽ�)
     eventProc.like_member_delete(hashMap);  // ���ƿ� ���̺� ���ƿ��� ȸ�� ����
     eventProc.like_down(event_no);    // ���ƿ� ���� ����
   }
   eventVO = eventProc.read(event_no);
   
   obj.put("like_check", like_check);    // ������ 1
   obj.put("good_cnt", eventVO.getEvent_good());
   
   return obj.toString();
   
 }
 
}
