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
   *  다이어리 등록 폼 http://localhost:9090/review/diary/create.do
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
   * 등록 처리
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
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/diary/storage");
    MultipartFile file1MF = diaryVO.getFile1MF();
    String file1 = ""; // 컬럼에 저장할 파일명
    long size1 = file1MF.getSize();
    String thumb = ""; // 컬럼에 저장할 파일명

    if (size1 > 0) {
      file1 = Upload.saveFileSpring(file1MF, upDir);

      if (Tool.isImage(file1)) {
        thumb = Tool.preview(upDir, file1, 120, 80); // Thumb 이미지 생성
      }
    }
    diaryVO.setDiary_file(file1);
    diaryVO.setDiary_size(size1);
    diaryVO.setDiary_thumb(thumb);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    if (diaryProc.create(diaryVO) == 1) {
      
      msgs.add("[등록 성공]");
      msgs.add("글을 등록했습니다.");
    } else {
      msgs.add("[등록 실패]");
      msgs.add("글 등록에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요. ☏ 전산 운영팀: 000-0000-0000");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
    }
    links.add("<button type='button' onclick=\"location.href='./list_paging.do?category_no="+diaryVO.getCategory_no()+"'\">목록</button>");

    mav.addObject("msgs", msgs);
    mav.addObject("links", links);

    return mav;
  }
  /**
   * 카테고리별 목록
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

    System.out.println("▶ list(int...) 출력 : "+category_no);
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
   * 조회
   * 
   * @param diary_no
   * @return
   */
  @RequestMapping(value = "/diary/read.do", method = RequestMethod.GET)
  public ModelAndView read(int diary_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/read"); // /webapp/diary/read.jsp
    diaryProc.increseCnt(diary_no);
     //반려동물 정보 불러오기 
    List<PetVO> pet_list = petProc.read(1);
    mav.addObject("pet_list",pet_list );
    
    DiaryVO diaryVO = diaryProc.read(diary_no);
    mav.addObject("diaryVO", diaryVO);

//    List<DiaryReplyVO> reply_list = diaryReplyProc.list(diary_no);
//    mav.addObject("reply_list", reply_list);
    
    
    CategoryVO categoryVO = categoryProc.read(diaryVO.getCategory_no()); // 카테고리
                                                                                   // 정보
                                                                                   // 추출
    mav.addObject("categoryVO", categoryVO);
    

   

    return mav;
  }
  
  /**
   * 다중 파일 수정 폼 http://localhost:9090/contents/contents/update.do
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/diary/update.do", method = RequestMethod.GET)
  public ModelAndView update(int diary_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/diary/update"); // /webapp/contents/update.jsp
    System.out.println("▶ 수정 get 시작");
    DiaryVO diaryVO = diaryProc.read(diary_no);
    mav.addObject("diaryVO", diaryVO);

    CategoryVO categoryVO = categoryProc.read(diaryVO.getCategory_no()); // 카테고리
                                                                                   // 정보
    mav.addObject("categoryVO", categoryVO);
    // 추출
    List<PetVO> pet_list = petProc.read(1);
    mav.addObject("pet_list",pet_list );
    


    return mav;
  }

  
  /**
   * - 글만 수정하는 경우의 구현 - 파일만 수정하는 경우의 구현 - 글과 파일을 동시에 수정하는 경우의 구현
   * 
   * @param request
   * @param diaryVO
   * @return
   */
  @RequestMapping(value = "/diary/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes redirectAttributes, HttpServletRequest request, DiaryVO diaryVO) {
    ModelAndView mav = new ModelAndView();
    
   System.out.println("▶ 수정 post 시작");
   int category_no = diaryVO.getCategory_no();
   //System.out.println("▶ categorY_no:" +category_no);
    

  
// ---------------------------------------------------------------------------
   // 파일 전송
   // ---------------------------------------------------------------------------
   String upDir = Tool.getRealPath(request, "/diary/storage");
   /*
   <input type="file" class="form-control input-lg" name='file1MF' id='file1MF' size='40' >
   ↓
    name='file1MF'에 해당하는 필드를 찾아서 File 객체를 자동으로 할당
   ↓
   BlogVO.java: private MultipartFile file1MF;
   ↓
    파일 객체 사용: MultipartFile file1MF = blogVO.getFile1MF();          
    */
   MultipartFile file1MF = diaryVO.getFile1MF();
   String file1 = "";                    // DBMS file1 컬럼의 값
   long size1 = file1MF.getSize(); // 파일 크기
   String thumb = "";                 // DBMS thumb 컬럼의 값
   
   // 기존에 등록된 글 정보 로딩
   DiaryVO diaryVO_old = diaryProc.read(diaryVO.getDiary_no());
   
   if (size1 > 0) { // 등록된 파일이 있다면
     Tool.deleteFile(upDir, diaryVO_old.getDiary_file());    // 기존 파일 삭제
     Tool.deleteFile(upDir, diaryVO_old.getDiary_thumb()); // 기존 Thumb 파일 삭제
     
     file1 = Upload.saveFileSpring(file1MF, upDir); // 신규 파일 업로드
     
     if (Tool.isImage(file1)) { // 새로운 파일 이미지인지 검사
       thumb = Tool.preview(upDir, file1, 120, 80); // Thumb 이미지 생성
     } 
   } else {
     // 파일을 변경하지 않는 경우 기존 파일 정보 사용
     file1 = diaryVO_old.getDiary_file();
     size1 = diaryVO_old.getDiary_size();
     thumb = diaryVO_old.getDiary_thumb();
   }
   diaryVO.setDiary_file(file1);
   diaryVO.setDiary_size(size1);
   diaryVO.setDiary_thumb(thumb);
   // ---------------------------------------------------------------------------
   
   // 회원 개발 후 session 으로변경
   //diaryVO.setMember_no(1);
   
   diaryProc.update(diaryVO);

   
    
     // categoryProc.increaseCnt(categoryno); // 글 수 증가
     
 
   System.out.println("file : "+ diaryVO.getDiary_file());
   System.out.println("thumb : "+ diaryVO.getDiary_thumb());
   System.out.println("size : "+ diaryVO.getDiary_size());
   
   System.out.println("★category_no :" +category_no);
   mav.setViewName("redirect:/diary/list_paging.do?category_no="+category_no);
   return mav;
  }
  
  /**
   * 삭제 폼 http://localhost:9090/review/diary/delete.do
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
    
    DiaryVO diaryVO = diaryProc.read(diary_no); // 삭제할 파일 정보를 읽기 위한
    // 목적
    
    
    // ---------------------------------------------------------------------------
    // 파일 삭제
    // ---------------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/diary/storage");

    Tool.deleteFile(upDir, diaryVO.getDiary_file());    // 기존 파일 삭제
    Tool.deleteFile(upDir, diaryVO.getDiary_thumb()); // 기존 Thumb 파일 삭제
      
    // ---------------------------------------------------------------------------
    
    String root = request.getContextPath();
    int count = diaryProc.delete(diary_no); // 레코드 삭제
    if (count == 1) {
      
      //categoryProc.decreaseCnt(categoryno); // 글 수 감소
      // 4개의 레코드가 하나의 페이지인경우 5번째 레코드가 삭제되면 페이지수도
      // 2페이지에서 1 페이지로 줄여야합니다. 
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("category_no", category_no); // #{categoryno}
      hashMap.put("word", word);                  // #{word}
      if (diaryProc.search_count(hashMap) % Diary.RECORD_PER_PAGE == 0){ 
        nowPage = nowPage - 1;
        if (nowPage < 1){
          nowPage = 1;
        }
      }
      msgs.add("글을 삭제했습니다.");

    } else {
      msgs.add("글 삭제에 실패했습니다.");
      msgs.add("죄송하지만 다시한번 시도해주세요. ☏ 000-0000-0000");
      links.add("<button type='button' onclick=\"history.back()\">다시 시도</button>");
      
    }
    links.add("<button type='button' onclick=\"location.href='./list_paging.do?category_no="+category_no+"'\">목록</button>");
    links.add("<button type='button' onclick=\"location.href='"+root+"/home.do'\">홈페이지</button>");
    
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
   * 목록 + 검색 + 페이징 지원
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
    
    // 검색 기능 추가,  /
    mav.setViewName("/diary/list_paging");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("category_no", category_no); // #{categoryno}
    hashMap.put("word", word);                  // #{word}
    hashMap.put("nowPage", nowPage);       
  
    // 검색 목록
    List<DiaryVO> list = diaryProc.list_paging(hashMap);
    mav.addObject("list", list);
   
    
    //List<DiaryVO> list_a = diaryProc.list(category_no);
    
    //mav.addObject("list", list_a);
    // 검색된 레코드 갯수
    int search_count = diaryProc.search_count(hashMap);
    mav.addObject("search_count", search_count);
  
    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);
    
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
    String paging = diaryProc.paging(category_no, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage); 
    
    return mav;
  }
  
  /**
   * JSON 기반 전체 목록
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
