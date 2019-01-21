package dev.mvc.pfreview;


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
import dev.mvc.pet.PetProcInter;
import dev.mvc.pet.PetVO;
import dev.mvc.pfreview.ReviewProcInter;
import dev.mvc.product.ProductVO;
import dev.mvc.review_reply.ReviewReplyProcInter;
import dev.mvc.review_reply.ReviewReplyVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.pfreview.ReviewProc")
  private ReviewProcInter reviewProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.category.CategoryProc")
  private CategoryProcInter categoryProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.review_reply.ReviewReplyProc")
  private ReviewReplyProcInter reviewreplyProc = null;

  @Autowired
  @Qualifier("dev.mvc.pet.PetProc")
  private PetProcInter petProc = null;

  public ReviewCont() {
    System.out.println("--> ReviewCont created.");
  }
  
  
  /**
   * 카테고리별 목록
   * @return
   */
  // http://localhost:9090/review/review/list.do?category_no=1
/*  @RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
  public ModelAndView list(int category_no) {
    ModelAndView mav = new ModelAndView();
    
    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);

    List<Review_MemberVO> list = reviewProc.list(category_no); 
    mav.addObject("list", list);

    mav.setViewName("/review/list"); // /webapp/review/list.jsp

    return mav;
  }*/
  
  
  /**
   * 등록 폼 
   * http://localhost:9090/review/review/create.do?category_no=1
   * @return
   */
  @RequestMapping(value = "/review/create.do", method = RequestMethod.GET)
  public ModelAndView create(int category_no) {
    System.out.println("--> create() GET executed");
    ModelAndView mav = new ModelAndView();
    
    List<PetVO> pet_list = petProc.read(3);
    mav.addObject("pet_list", pet_list);
    
    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);
    
    mav.setViewName("/review/create"); // /webapp/review/create.jsp

    return mav;
  }
  
  
  /**
   * 등록 처리
   * 
   * @param request
   * @param review_memberVO
   * @return
   */
  @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, Review_MemberVO review_memberVO) {
    // System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();

    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/review/storage");
    List<MultipartFile> filesMF = review_memberVO.getFilesMF(); // Spring이 File 객체를
                                                           // 저장해둠.

    // System.out.println("--> filesMF.get(0).getSize(): " +
    // filesMF.get(0).getSize());

    String review_file = ""; // 컬럼에 저장할 파일명
    String files_item = ""; // 하나의 파일명
    String review_size = "";
    long sizes_item = 0; // 하나의 파일 사이즈
    String review_thumb = ""; // Thumb 파일들
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
            review_file = review_file + "/" + files_item;
            // 하나의 컬럼에 여러개의 파일 사이즈를 조합하여 저장, 12546/78956/42658
            review_size = review_size + "/" + sizes_item;
            // 미니 이미지를 조합하여 하나의 컬럼에 저장
            review_thumb = review_thumb + "/" + thumbs_item;
          } else if (multipartFile.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로
                                                    // 크기 체크
            review_file = files_item; // file1.jpg
            review_size = "" + sizes_item; // 123456
            review_thumb = thumbs_item; // file1_t.jpg
          }

        } // if (multipartFile.getSize() > 0) {  END
        
      }
    }
    review_memberVO.setReview_file(review_file);
    review_memberVO.setReview_size(review_size);
    review_memberVO.setReview_thumb(review_thumb);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
// System.out.println("카테고리 번호 : "+ review_memberVO.getCategory_no());
    
    
    count = reviewProc.create(review_memberVO);
    if (count == 1) {
      reviewProc.increaseCnt(review_memberVO.getCategory_no()); // 글수 증가
    }
 

     mav.setViewName("redirect:/review/list.do?category_no="+ review_memberVO.getCategory_no());

    return mav;
  }
  
  
  /**
   * JSON 기반 전체 목록
   * http://localhost:9090/review/review/product_name_search.do?product_name=램
   * [{"review_cnt":0,"reivew_reply_cnt":0,"member_no":0,"category_no":0,"review_grade":0,"review_no":0,
   * "product_price":25530,"product_no":1,"review_good":0,
   * "product_name":"ANF 램 홀리스틱 시니어","product_img":"imageroot"}]
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/product_name_search.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity product_name_search(String product_name) {
    HttpHeaders responseHeaders = new HttpHeaders();
    List<Review_MemberVO> product_name_search_list = reviewProc.product_name_search(product_name);
    
    JSONArray json = new JSONArray(product_name_search_list);
    
    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }

  
  @RequestMapping(value = "/review/read.do", method = RequestMethod.GET)
  public ModelAndView read(int review_no) {
    ModelAndView mav = new ModelAndView();
        
    List<ReviewReplyVO> reply_list = reviewreplyProc.list(review_no);
    mav.addObject("reply_list", reply_list);
    
    PetVO petVO = reviewProc.pet_read(review_no);
    mav.addObject("petVO", petVO); 
    
    
    Review_MemberVO review_memberVO = reviewProc.read(review_no);
    mav.addObject("review_memberVO", review_memberVO);
    
    mav.setViewName("/review/read");

    return mav;
  }
  
  
  /*
   * http://localhost:9090/review/review/list_json.do?review_no=4

   */
  /**
   * JSON 기반 전체 목록
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/list_json.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public ResponseEntity list_json(int review_no) {
    HttpHeaders responseHeaders = new HttpHeaders();
    List<ReviewReplyVO> reply_list = reviewreplyProc.list(review_no);
    
    JSONArray json = new JSONArray(reply_list);
    

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
 
  @RequestMapping(value = "/review/update.do", method = RequestMethod.GET)
  public ModelAndView update(int review_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/update"); // /webapp/review/update.jsp

    List<PetVO> pet_list = petProc.read(3);
    mav.addObject("pet_list", pet_list);
    
    Review_MemberVO review_memberVO = reviewProc.read(review_no);
    mav.addObject("review_memberVO", review_memberVO);
    
    ProductVO productVO = reviewProc.rproduct_name_search(review_no);
    mav.addObject("productVO", productVO);
    
    return mav;
  } 
  

  @RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes redirectAttributes, 
      HttpServletRequest request, ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/review/storage");
    List<MultipartFile> filesMF = reviewVO.getFilesMF(); // Spring이 File 객체를
                                                           // 저장해둠.

    // System.out.println("--> filesMF.get(0).getSize(): " +
    // filesMF.get(0).getSize());


    String review_file = ""; // 컬럼에 저장할 파일명
    String files_item = ""; // 하나의 파일명
    String review_size = "";
    long sizes_item = 0; // 하나의 파일 사이즈
    String review_thumb = ""; // Thumb 파일들
    String thumbs_item = ""; // 하나의 Thumb 파일명

    int count = filesMF.size(); // 업로드된 파일 갯수

    // 기존의 등록 정보 조회
    Review_MemberVO reviewVO_old = reviewProc.read(reviewVO.getReview_no());
    if (filesMF.get(0).getSize() > 0) { // 새로운 파일을 등록함으로 기존에 등록된 파일 목록 삭제
      // thumbs 파일 삭제
      String thumbs_old = reviewVO_old.getReview_thumb();
      StringTokenizer thumbs_st = new StringTokenizer(thumbs_old, "/");
      while (thumbs_st.hasMoreTokens()) {
        String fname = upDir + thumbs_st.nextToken();
        Tool.deleteFile(fname);
      }

      // 원본 파일 삭제
      String files_old = reviewVO_old.getReview_file();
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
            review_file = review_file + "/" + files_item;
            // 하나의 컬럼에 여러개의 파일 사이즈를 조합하여 저장, 12546/78956/42658
            review_size = review_size + "/" + sizes_item;
            // 미니 이미지를 조합하여 하나의 컬럼에 저장
            review_thumb = review_thumb + "/" + thumbs_item;
          } else if (multipartFile.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로
                                                    // 크기 체크
            review_file = files_item; // file1.jpg
            review_size = "" + sizes_item; // 123456
            review_thumb = thumbs_item; // file1_t.jpg
          }

        }
      } // for END
      // --------------------------------------------
      // 새로운 파일의 등록 종료
      // --------------------------------------------

    } else { // 글만 수정하는 경우, 기존의 파일 정보 재사용
      review_file = reviewVO_old.getReview_file();
      review_size = reviewVO_old.getReview_size();
      review_thumb = reviewVO_old.getReview_thumb();
    }
    reviewVO.setReview_file(review_file);
    reviewVO.setReview_size(review_size);
    reviewVO.setReview_thumb(review_thumb);

    reviewVO.setMember_no(1); // 회원 개발후 session으로 변경

    count = reviewProc.update(reviewVO);

    redirectAttributes.addAttribute("count", count);

    // redirect시에는 request가 전달이안됨으로 아래의 방법을 이용하여 데이터 전달
   // redirectAttributes.addAttribute("contentsno", contentsVO.getContentsno());
    redirectAttributes.addAttribute("category_no", reviewVO.getCategory_no());
    redirectAttributes.addAttribute("review_no", reviewVO.getReview_no());

    //mav.setViewName("redirect:/review/update_message.jsp");
    mav.setViewName("redirect:/review/read.do?category_no="+ reviewVO.getCategory_no()+"&review_no="+reviewVO.getReview_no());

    return mav;

  }
  
  
  
  /**
   * 목록 + 검색 + 페이징 지원
   * @param category_no
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/review/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list(
      @RequestParam(value="category_no") int category_no,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> list_by_category() GET called.");
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    CategoryVO categoryVO = categoryProc.read(category_no);
    mav.addObject("categoryVO", categoryVO);

    // 검색 기능 추가,  /webapp/review/list.jsp
    mav.setViewName("/review/list");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("category_no", category_no); // #{category_no}
    hashMap.put("word", word);                  // #{word}
    hashMap.put("nowPage", nowPage);       
    
    // 검색 목록
    List<Review_MemberVO> list = reviewProc.list(hashMap);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = reviewProc.search_count(hashMap);
    mav.addObject("search_count", search_count);
  
    Review_MemberVO review_memberVO = reviewProc.read(category_no);
    mav.addObject("review_memberVO", review_memberVO);
    
    // mav.addObject("word", word);
  
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     *
     * @param category_no 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = reviewProc.paging(category_no, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }
}
  
