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
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/proreport/storage");
    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
    Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    List<MultipartFile> filesMF = multipartHttpServletRequest.getFiles(iterator.next()); // Spring�� File ��ü��
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
    proreportVO.setProreport_img(files);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
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
      crc.put("cdu_result", "��ǰ ���� ��û�Ͽ����ϴ�.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "��ǰ ���� ��û�� �����Ͽ����ϴ�.");
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
      crc.put("cdu_result", "��ǰ ������ �����Ͽ����ϴ�.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "��ǰ ������ �����Ͽ����ϴ�.");
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
