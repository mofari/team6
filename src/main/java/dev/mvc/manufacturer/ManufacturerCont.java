package dev.mvc.manufacturer;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class ManufacturerCont {
  @Autowired
  @Qualifier("dev.mvc.manufacturer.ManufacturerProc")
  private ManufacturerProcInter manufacturerProc = null;
  
  public ManufacturerCont() {
    System.out.println("--> ManufacturerCont created.");
  }
  
  // http://localhost:9090/review/mmf/create.do?
  @RequestMapping(value = "/mnf/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);

    mav.setViewName("/manufacturer/create"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/mnf/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes){
  //public ModelAndView create(ManufacturerVO manufacturerVO){
    ModelAndView mav = new ModelAndView();
    ManufacturerVO manufacturerVO = new ManufacturerVO();
    manufacturerVO.setManufacturer_name(httpServletRequest.getParameter("name"));
    manufacturerVO.setManufacturer_callnumber(httpServletRequest.getParameter("callnumber"));
    manufacturerVO.setManufacturer_zipcode(httpServletRequest.getParameter("zipcode"));
    manufacturerVO.setManufacturer_webpageurl(httpServletRequest.getParameter("webpageurl"));
 // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/manufacturer/storage");
    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    List<MultipartFile> filesMF = multipartHttpServletRequest.getFiles(iterator.next()); // Spring이 File 객체를
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
    manufacturerVO.setManufacturer_img(files);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    
    if(manufacturerVO.getManufacturer_img().equals("")){
      manufacturerVO.setManufacturer_img("default-user-image.png");
    }
    System.out.println(manufacturerVO.getManufacturer_name());
    
    int crecount = manufacturerProc.create(manufacturerVO);
    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);


    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "신규 제조사 등록에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "신규 제조사 등록에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/mnf/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/mnf/list.do", method = RequestMethod.GET)
  public ModelAndView list(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) {
    ModelAndView mav = new ModelAndView();
    System.out.println(nowPage); 
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("word", word);                  // #{word}
    hashMap.put("nowPage", nowPage);

    List<ManufacturerVO> list = manufacturerProc.list(hashMap);
    mav.addObject("list", list);
    
    int search_count = manufacturerProc.listcount(hashMap);
    mav.addObject("search_count", search_count);
    
    String paging = manufacturerProc.paging(search_count, nowPage, word);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    mav.setViewName("/manufacturer/list"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/mnf/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int manno, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    int crecount = manufacturerProc.delete(manno);
    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);


    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "제조사 삭제에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "제조사 삭제에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/mnf/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/mnf/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    ManufacturerVO manufacturerVO = new ManufacturerVO();
    manufacturerVO.setManufacturer_no(Integer.parseInt(httpServletRequest.getParameter("manno")));
    manufacturerVO.setManufacturer_name(httpServletRequest.getParameter("name"));
    manufacturerVO.setManufacturer_callnumber(httpServletRequest.getParameter("callnumber"));
    manufacturerVO.setManufacturer_zipcode(httpServletRequest.getParameter("zipcode"));
    manufacturerVO.setManufacturer_webpageurl(httpServletRequest.getParameter("webpageurl"));
    
    int crecount = manufacturerProc.update(manufacturerVO);
    

    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);
    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "제조사 수정에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "제조사 수정에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/mnf/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/mnf/update.do", method = RequestMethod.GET)
  public ModelAndView update(int manno) {
    ModelAndView mav = new ModelAndView();

    ManufacturerVO manufacturerVO = manufacturerProc.read(manno);
    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);
    mav.addObject("manufacturerVO", manufacturerVO);
    
    mav.setViewName("/manufacturer/update"); // /webapp/review/list.jsp

    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/mnf/updateimg.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity updateimg(HttpServletRequest httpServletRequest) {

    ManufacturerVO manufacturerVO = new ManufacturerVO();
    manufacturerVO.setManufacturer_no(Integer.parseInt(httpServletRequest.getParameter("manno")));

    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/manufacturer/storage");
    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    List<MultipartFile> filesMF = multipartHttpServletRequest.getFiles(iterator.next()); // Spring이 File 객체를
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
    manufacturerVO.setManufacturer_img(files);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    int cnt = manufacturerProc.updateimg(manufacturerVO);

    JSONObject json = new JSONObject();
    
    if (cnt > 0){
      json.put("imgname", manufacturerVO.getManufacturer_img());
    } else {
    }
    HttpHeaders responseHeaders = new HttpHeaders();

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
}
