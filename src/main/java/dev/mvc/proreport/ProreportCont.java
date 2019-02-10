package dev.mvc.proreport;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;
import dev.mvc.manufacturer.ManufacturerVO;
import dev.mvc.product.OutProductVO;
import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class ProreportCont {
  @Autowired
  @Qualifier("dev.mvc.proreport.ProreportProc")
  private ProreportProcInter proreportProc = null;

  public ProreportCont() {
    System.out.println("--> ProreportCont created.");
  }
  
  @RequestMapping(value = "/proreport/create.do", method = RequestMethod.GET)
  public ModelAndView create(int prono) {
    ModelAndView mav = new ModelAndView();    
    
    ProductVO productVO = proreportProc.readproduct(prono);
    
    mav.addObject("productVO", productVO);
    
    mav.setViewName("/proreport/create");

    return mav;
  }
  
  @RequestMapping(value = "/proreport/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes){
  //public ModelAndView create(ManufacturerVO manufacturerVO){
    ModelAndView mav = new ModelAndView();
    ProreportVO proreportVO = new ProreportVO();
    proreportVO.setProreport_title(httpServletRequest.getParameter("title"));
    proreportVO.setProreport_doc(httpServletRequest.getParameter("docum"));
    proreportVO.setProduct_no(Integer.parseInt(httpServletRequest.getParameter("prono")));
    proreportVO.setMember_no(1);
 // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/proreport/storage");
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
    proreportVO.setProreport_img(files);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    System.out.println(proreportVO.getProreport_doc());
    System.out.println(proreportVO.getProreport_img());
    System.out.println(proreportVO.getProreport_title());
    System.out.println(proreportVO.getProduct_no());
    System.out.println(proreportVO.getMember_no());
    
    int crecount = proreportProc.create(proreportVO); 
    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);


    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "상품 수정 요청하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "상품 수정 요청에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/product/detail.do?prono="+proreportVO.getProduct_no()); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/proreport/list.do", method = RequestMethod.GET)
  public ModelAndView list(
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) {
    ModelAndView mav = new ModelAndView();
    
    String getparam = "";
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("nowPage", nowPage);

    List<OutProreportVO> list = proreportProc.list(hashMap);
    mav.addObject("list", list);
    
    int search_count = proreportProc.listcount(hashMap);
    mav.addObject("search_count", search_count);
    
    String paging = proreportProc.paging(search_count, nowPage, getparam);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    mav.setViewName("/proreport/list"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/proreport/del.do", method = RequestMethod.POST)
  public ModelAndView delete(int prono, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();
    
    int crecount = proreportProc.delete(prono);
   
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "상품 삭제에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "상품 삭제에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/proreport/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/proreport/detail.do", method = RequestMethod.GET)
  public ModelAndView detail(int rptno){
    ModelAndView mav = new ModelAndView();
    
    OutProreportVO outProreportVO = proreportProc.detail(rptno);
    mav.addObject("OutProreportVO", outProreportVO);
    
    mav.setViewName("/proreport/detail");

    return mav;
  }
  
}
