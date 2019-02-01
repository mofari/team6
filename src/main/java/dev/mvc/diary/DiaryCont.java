package dev.mvc.diary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

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


import dev.mvc.category.CategoryProcInter;
import dev.mvc.category.CategoryVO;
//import dev.mvc.diary_like.DiaryLikeVO;
import dev.mvc.diary_reply.DiaryReplyProcInter;
import dev.mvc.diary_reply.DiaryReplyVO;
import dev.mvc.pet.PetProcInter;
import dev.mvc.pet.PetVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class DiaryCont {
  @Autowired
  @Qualifier("dev.mvc.diary.DiaryProc")
  private DiaryProcInter diaryProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.category.CategoryProc")
  private CategoryProcInter categoryProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.pet.PetProc")
  private PetProcInter petProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.diary_reply.DiaryReplyProc")
  private DiaryReplyProcInter diaryReplyProc = null;
  
  /**
   *  ���̾ ��� �� http://localhost:9090/review/diary/create.do
   * 
   */
  @RequestMapping(value = "/diary/create.do", method = RequestMethod.GET)
  public ModelAndView create(int category_no) {
    System.out.println("--> create() GET executed");
    ModelAndView mav = new ModelAndView();
    
    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);
     
    List<PetVO> pet_list = petProc.read(1);
    mav.addObject("pet_list", pet_list);
    
    mav.setViewName("/diary/create"); // /webapp/diary/create.jsp

    return mav;
  } 
  /**
   * ��� ó��
   * 
   * @param request
   * @param diaryVO
   * @return
   */
  @RequestMapping(value = "/diary/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, DiaryVO diaryVO) {
     System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/message"); // /webapp/diary/message.jsp
 
    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
 // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/diary/storage");
    MultipartFile file1MF = diaryVO.getFile1MF();
    String file1 = ""; // �÷��� ������ ���ϸ�
    long size1 = file1MF.getSize();
    String thumb = ""; // �÷��� ������ ���ϸ�

    if (size1 > 0) {
      file1 = Upload.saveFileSpring(file1MF, upDir);

      if (Tool.isImage(file1)) {
        thumb = Tool.preview(upDir, file1, 120, 80); // Thumb �̹��� ����
      }
    }
    diaryVO.setDiary_file(file1);
    diaryVO.setDiary_size(size1);
    diaryVO.setDiary_thumb(thumb);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------

    if (diaryProc.create(diaryVO) == 1) {
      
      msgs.add("[��� ����]");
      msgs.add("���� ����߽��ϴ�.");
    } else {
      msgs.add("[��� ����]");
      msgs.add("�� ��Ͽ� �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���. �� ���� ���: 000-0000-0000");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
    }
    links.add("<button type='button' onclick=\"location.href='./list_paging.do?category_no="+diaryVO.getCategory_no()+"'\">���</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  /**
   * ī�װ��� ���
   * 
   * @return
   */
  // http://localhost:9090/review/diary/list.do?category_no=1
 /* @RequestMapping(value = "/diary/list.do", method = RequestMethod.GET)
  public ModelAndView list(
      @RequestParam(value="category_no") int category_no,
      @RequestParam(value="nowPage", defaultValue="1" ) int nowPage) {
    ModelAndView mav = new ModelAndView();

    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);

    System.out.println("�� list(int...) ��� : "+category_no);
    List<DiaryVO> list = diaryProc.list(category_no);
   
    mav.addObject("list", list);

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("category_no", category_no); 
    hashMap.put("nowPage", nowPage); 
    
    mav.addObject("nowPage", nowPage);
    mav.setViewName("/diary/list"); // /webapp/diary/list.jsp

    return mav;
  }*/
  
  /**
   * ��ȸ
   * 
   * @param diary_no
   * @return
   */
  @RequestMapping(value = "/diary/read.do", method = RequestMethod.GET)
  public ModelAndView read(int diary_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/read"); // /webapp/diary/read.jsp
    diaryProc.increseCnt(diary_no);
     //�ݷ����� ���� �ҷ����� 
    List<PetVO> pet_list = petProc.read(1);
    mav.addObject("pet_list",pet_list );
    
    DiaryVO diaryVO = diaryProc.read(diary_no);
    mav.addObject("diaryVO", diaryVO);

//    List<DiaryReplyVO> reply_list = diaryReplyProc.list(diary_no);
//    mav.addObject("reply_list", reply_list);
    
    
    CategoryVO categoryVO = categoryProc.read(diaryVO.getCategory_no()); // ī�װ�
                                                                                   // ����
                                                                                   // ����
    mav.addObject("categoryVO", categoryVO);
    

   

    return mav;
  }
  
  /**
   * ���� ���� ���� �� http://localhost:9090/contents/contents/update.do
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/diary/update.do", method = RequestMethod.GET)
  public ModelAndView update(int diary_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/update"); // /webapp/contents/update.jsp
    System.out.println("�� ���� get ����");
    DiaryVO diaryVO = diaryProc.read(diary_no);
    mav.addObject("diaryVO", diaryVO);

    CategoryVO categoryVO = categoryProc.read(diaryVO.getCategory_no()); // ī�װ�
                                                                                   // ����
    mav.addObject("categoryVO", categoryVO);
    // ����
    List<PetVO> pet_list = petProc.read(1);
    mav.addObject("pet_list",pet_list );
    


    return mav;
  }

  
  /**
   * - �۸� �����ϴ� ����� ���� - ���ϸ� �����ϴ� ����� ���� - �۰� ������ ���ÿ� �����ϴ� ����� ����
   * 
   * @param request
   * @param diaryVO
   * @return
   */
  @RequestMapping(value = "/diary/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes redirectAttributes, HttpServletRequest request, DiaryVO diaryVO) {
    ModelAndView mav = new ModelAndView();
    
   System.out.println("�� ���� post ����");
   int category_no = diaryVO.getCategory_no();
   //System.out.println("�� categorY_no:" +category_no);
    

  
// ---------------------------------------------------------------------------
   // ���� ����
   // ---------------------------------------------------------------------------
   String upDir = Tool.getRealPath(request, "/diary/storage");
   /*
   <input type="file" class="form-control input-lg" name='file1MF' id='file1MF' size='40' >
   ��
    name='file1MF'�� �ش��ϴ� �ʵ带 ã�Ƽ� File ��ü�� �ڵ����� �Ҵ�
   ��
   BlogVO.java: private MultipartFile file1MF;
   ��
    ���� ��ü ���: MultipartFile file1MF = blogVO.getFile1MF();          
    */
   MultipartFile file1MF = diaryVO.getFile1MF();
   String file1 = "";                    // DBMS file1 �÷��� ��
   long size1 = file1MF.getSize(); // ���� ũ��
   String thumb = "";                 // DBMS thumb �÷��� ��
   
   // ������ ��ϵ� �� ���� �ε�
   DiaryVO diaryVO_old = diaryProc.read(diaryVO.getDiary_no());
   
   if (size1 > 0) { // ��ϵ� ������ �ִٸ�
     Tool.deleteFile(upDir, diaryVO_old.getDiary_file());    // ���� ���� ����
     Tool.deleteFile(upDir, diaryVO_old.getDiary_thumb()); // ���� Thumb ���� ����
     
     file1 = Upload.saveFileSpring(file1MF, upDir); // �ű� ���� ���ε�
     
     if (Tool.isImage(file1)) { // ���ο� ���� �̹������� �˻�
       thumb = Tool.preview(upDir, file1, 120, 80); // Thumb �̹��� ����
     } 
   } else {
     // ������ �������� �ʴ� ��� ���� ���� ���� ���
     file1 = diaryVO_old.getDiary_file();
     size1 = diaryVO_old.getDiary_size();
     thumb = diaryVO_old.getDiary_thumb();
   }
   diaryVO.setDiary_file(file1);
   diaryVO.setDiary_size(size1);
   diaryVO.setDiary_thumb(thumb);
   // ---------------------------------------------------------------------------
   
   // ȸ�� ���� �� session ���κ���
   //diaryVO.setMember_no(1);
   
   diaryProc.update(diaryVO);

   
    
     // categoryProc.increaseCnt(categoryno); // �� �� ����
     
 
   System.out.println("file : "+ diaryVO.getDiary_file());
   System.out.println("thumb : "+ diaryVO.getDiary_thumb());
   System.out.println("size : "+ diaryVO.getDiary_size());
   
   System.out.println("��category_no :" +category_no);
   mav.setViewName("redirect:/diary/list_paging.do?category_no="+category_no);
   return mav;
  }
  
  /**
   * ���� �� http://localhost:9090/review/diary/delete.do
   * 
   * @param diary_no
   * @param diary_no
   * @return
   */
  @RequestMapping(value = "/diary/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int diary_no, int category_no) {
    // System.out.println("--> delete() GET executed");
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/delete"); // /webapp/diary/delete.jsp

    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);

    DiaryVO diaryVO = diaryProc.read(diary_no);
    mav.addObject("diaryVO", diaryVO);

    return mav;
  }

  @RequestMapping(value = "/diary/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes  redirectAttributes, 
                                         HttpServletRequest request, 
                                        int category_no,
                                        int diary_no,
                                        @RequestParam(value="word", defaultValue="") String word,
                                        @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/message"); // /webapp/diary/delete_message.jsp

    ArrayList<String> msgs = new ArrayList<String>();
    ArrayList<String> links = new ArrayList<String>();
    
    DiaryVO diaryVO = diaryProc.read(diary_no); // ������ ���� ������ �б� ����
    // ����
    
    
    // ---------------------------------------------------------------------------
    // ���� ����
    // ---------------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/diary/storage");

    Tool.deleteFile(upDir, diaryVO.getDiary_file());    // ���� ���� ����
    Tool.deleteFile(upDir, diaryVO.getDiary_thumb()); // ���� Thumb ���� ����
      
    // ---------------------------------------------------------------------------
    
    String root = request.getContextPath();
    int count = diaryProc.delete(diary_no); // ���ڵ� ����
    if (count == 1) {
      
      //categoryProc.decreaseCnt(categoryno); // �� �� ����
      // 4���� ���ڵ尡 �ϳ��� �������ΰ�� 5��° ���ڵ尡 �����Ǹ� ����������
      // 2���������� 1 �������� �ٿ����մϴ�. 
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("category_no", category_no); // #{categoryno}
      hashMap.put("word", word);                  // #{word}
      if (diaryProc.search_count(hashMap) % Diary.RECORD_PER_PAGE == 0){ 
        nowPage = nowPage - 1;
        if (nowPage < 1){
          nowPage = 1;
        }
      }
      msgs.add("���� �����߽��ϴ�.");

    } else {
      msgs.add("�� ������ �����߽��ϴ�.");
      msgs.add("�˼������� �ٽ��ѹ� �õ����ּ���. �� 000-0000-0000");
      links.add("<button type='button' onclick=\"history.back()\">�ٽ� �õ�</button>");
      
    }
    links.add("<button type='button' onclick=\"location.href='./list_paging.do?category_no="+category_no+"'\">���</button>");
    links.add("<button type='button' onclick=\"location.href='"+root+"/home.do'\">Ȩ������</button>");
    
    mav.addObject("msgs", msgs);
    mav.addObject("links", links);
    
    redirectAttributes.addAttribute("count", count); // 1 or 0
    redirectAttributes.addAttribute("diary_no", diaryVO.getDiary_no());
    redirectAttributes.addAttribute("category_no", diaryVO.getCategory_no());
    redirectAttributes.addAttribute("word", word);
    redirectAttributes.addAttribute("nowPage", nowPage);
    return mav;
  }
  
  /**
   * ��� + �˻� + ����¡ ����
   * @param categoryno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/diary/list_paging.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_paging(
      @RequestParam(value="category_no") int category_no,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> list_by_category() GET called.");
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // �˻� ��� �߰�,  /
    mav.setViewName("/diary/list_paging");   
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("category_no", category_no); // #{categoryno}
    hashMap.put("word", word);                  // #{word}
    hashMap.put("nowPage", nowPage);       
  
    // �˻� ���
    List<DiaryVO> list = diaryProc.list_paging(hashMap);
    mav.addObject("list", list);
   
    
    //List<DiaryVO> list_a = diaryProc.list(category_no);
    
    //mav.addObject("list", list_a);
    // �˻��� ���ڵ� ����
    int search_count = diaryProc.search_count(hashMap);
    mav.addObject("search_count", search_count);
  
    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);
    
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
    String paging = diaryProc.paging(category_no, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage); 
    
    return mav;
  }
  
  /**
   * JSON ��� ��ü ���
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/diary/list_json.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity list_json(int diary_no) {
    HttpHeaders responseHeaders = new HttpHeaders();
     
    List<DiaryReplyVO> list = diaryReplyProc.list(diary_no);

    JSONArray json = new JSONArray(list);

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  /*@ResponseBody
  @RequestMapping(value = "/like.do", method = RequestMethod.POST, produces = "application/json")
  public int heart(HttpServletRequest httpRequest) throws Exception {

      int heart = Integer.parseInt(httpRequest.getParameter("heart"));
      int diary_no = Integer.parseInt(httpRequest.getParameter("diary_no"));
      int member_no = 2;

      DiaryLikeVO diaryLikeVO = new DiaryLikeVO();

      diaryLikeVO.setDiary_no(diary_no);
      diaryLikeVO.setMember_no(member_no);

      System.out.println(heart);

      if(heart >= 1) {
          service.deleteBoardLike(boardLikeVO);
          heart=0;
      } else {
          service.insertBoardLike(boardLikeVO);
          heart=1;
      }

      return heart;

  }*/


  
}
