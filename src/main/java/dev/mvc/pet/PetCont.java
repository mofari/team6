package dev.mvc.pet;
 
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.member.MemberVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;



@Controller
public class PetCont {
  @Autowired
  @Qualifier("dev.mvc.pet.PetProc")
  private PetProcInter petProc = null;
  
  
  public PetCont(){
    System.out.println("--> PetCont created.");
    
  }
  
  @RequestMapping(value = "/pet/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    System.out.println("--> create() GET executed");
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/pet/create");
    
    return mav;
  }
  
  @RequestMapping(value="/pet/create.do", method=RequestMethod.POST)
  public ModelAndView create(RedirectAttributes redirectAttributes,
                                        HttpServletRequest request, PetVO petVO) {
    System.out.println("--> create() POST executed");
    ModelAndView mav = new ModelAndView();
     
    
 // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(request, "/pet/storage");
    List<MultipartFile> filesMF = petVO.getFilesMF(); // Spring이 File 객체를
                                                           // 저장해둠.
    System.out.println(filesMF);

    // System.out.println("--> filesMF.get(0).getSize(): " +
    // filesMF.get(0).getSize());

    String files = ""; // 컬럼에 저장할 파일명
    String files_item = ""; // 하나의 파일명
    String thumbs = ""; // Thumb 파일들
    String thumbs_item = ""; // 하나의 Thumb 파일명

    int count = filesMF.size(); // 업로드된 파일 갯수
    // Spring은 파일 선택을 안해도 1개의 MultipartFile 객체가 생성됨.
    // System.out.println("--> 업로드된 파일 갯수 count: " + count);

    if (count > 0) { // 전송 파일이 존재한다면
      // for (MultipartFile multipartFile: filesMF) {
      for (int i = 0; i < count; i++) {
        MultipartFile multipartFile = filesMF.get(i); // 0 ~
        //System.out.println("multipartFile.getName(): " + multipartFile.getName());

        // if (multipartFile.getName().length() > 0) { // 전송파일이 있는지 체크, filesMF
        if (multipartFile.getSize() > 0) { // 전송파일이 있는지 체크
          // System.out.println("전송 파일이 있습니다.");
          files_item = Upload.saveFileSpring(multipartFile, upDir);
          
          if (Tool.isImage(files_item)) {
            thumbs_item = Tool.preview(upDir, files_item, 120, 80); // Thumb 이미지
                                                                    // 생성
          }
          System.out.println(thumbs_item);

          if (i != 0 && i < count) { // index가 1 이상이면(두번째 파일 이상이면)
            // 하나의 컬럼에 여러개의 파일명을 조합하여 저장, file1.jpg/file2.jpg/file3.jpg
            files = files + "/" + files_item;
            thumbs = thumbs + "/" + thumbs_item;
          } else if (multipartFile.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로 
            files = files_item; // file1.jpg
            thumbs = thumbs_item; // file1_t.jpg
            System.out.println(thumbs);
          }

        } // if (multipartFile.getSize() > 0) {  END
        
      } 
    }
    petVO.setPet_image(files); 
    petVO.setPet_thumbs(thumbs);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    count = petProc.create(petVO);
    redirectAttributes.addAttribute("count", count);
    mav.setViewName("redirect:/pet/create_message.jsp");
    
    return mav;
  }
   
    
    /**
     * 
     * @param session
     * @return
     */
    @RequestMapping(value="/pet/list.do", method=RequestMethod.GET)
    public ModelAndView list(HttpSession session){
      // System.out.println("--> create() GET called.");
        ModelAndView mav = new ModelAndView();
               
        List<PetVO> list = petProc.list();
        mav.addObject("list", list);         
 
        mav.setViewName("/pet/list_pet_paging");
      return mav;
    } 

    /**
     * 업데이트
     * @param petVO
     * @return
     */
    @RequestMapping(value="/pet/update.do", method=RequestMethod.POST)
    public ModelAndView update(PetVO petVO){
      ModelAndView mav = new ModelAndView();
      
      int count = petProc.update(petVO);
      mav.addObject("count", count);
      mav.addObject("pet_no", petVO.getPet_no());

      mav.setViewName("redirect:/pet/update_message.jsp");
      
      return mav;
    }  
    
    /**
     * 
     * @param session
     * @return
     */
    @RequestMapping(value="/pet/mylist.do", method=RequestMethod.GET)
    public ModelAndView mylist(int member_no){
      // System.out.println("--> create() GET called.");
        ModelAndView mav = new ModelAndView();
               
        List<PetVO> mylist = petProc.mylist(member_no);
        mav.addObject("mylist", mylist);         
 
        mav.setViewName("/pet/list_mypet_paging");
      return mav;
    } 
    
    
    /**
     * 
     * @param pet_no
     * @return
     */
    @RequestMapping(value="/pet/readpet.do", method=RequestMethod.GET)
    public ModelAndView readpet(int member_no){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/pet/readpet");
      
      List<PetVO> petVO = petProc.readpet(member_no);
      //System.out.println(petVO.getPet_name() + "1");
      mav.addObject("petVO", petVO);
      
      return mav;
    }  
    /**
     * 
     * @param pet_no
     * @return
     */
    @RequestMapping(value="/pet/read.do", method=RequestMethod.GET)
    public ModelAndView read(int pet_no){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/pet/read");
      
      PetVO petVO = petProc.read(pet_no);
      //System.out.println(petVO.getPet_name() + "1");
      mav.addObject("petVO", petVO);
      
      return mav;
    }  
    
    @RequestMapping(value="/pet/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(int pet_no){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/pet/delete");
      
      PetVO petVO = petProc.read(pet_no);

      mav.addObject("petVO", petVO);
      
      return mav;
    }
    
    @RequestMapping(value="/pet/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(RedirectAttributes redirectAttributes,
                                          HttpServletRequest request, int pet_no){
      ModelAndView mav = new ModelAndView();
      
      int count = petProc.delete(pet_no);
      
      redirectAttributes.addAttribute("count", count);
      redirectAttributes.addAttribute("pet_no", pet_no);
      
      mav.setViewName("redirect:/pet/delete_message.jsp");
      
      return mav;
    }
    
    
    /**
     * 목록 + 페이징 지원
     * @param nowPage
     * @return
     */
    @RequestMapping(value = "/pet/list_pet_paging.do", 
                                         method = RequestMethod.GET)
    public ModelAndView list_pet_paging(
        @RequestParam(value="nowPage", defaultValue="1") int nowPage
        ) { 
      // System.out.println("--> list_by_category() GET called.");
      System.out.println("--> nowPage: " + nowPage);
      
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/pet/list_pet_paging"); 
      
      // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("nowPage", nowPage);       
      
      List<PetVO> list = petProc.list_pet_paging(hashMap);
      mav.addObject("list", list);
      
      // 검색된 레코드 갯수
      int search_count = petProc.search_count(hashMap); 
      mav.addObject("search_count", search_count);

    
      /*
       * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
       * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
       *
       * @param nowPage     현재 페이지
       * @return 페이징 생성 문자열
       */ 
      String paging = petProc.paging(search_count, nowPage);
      mav.addObject("paging", paging);
    
      mav.addObject("nowPage", nowPage);
      
      return mav;
    }
 
}