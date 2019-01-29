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
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/manufacturer/storage");
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
    manufacturerVO.setManufacturer_img(files);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
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
      crc.put("cdu_result", "�ű� ������ ��Ͽ� �����Ͽ����ϴ�.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "�ű� ������ ��Ͽ� �����Ͽ����ϴ�.");
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
      crc.put("cdu_result", "������ ������ �����Ͽ����ϴ�.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "������ ������ �����Ͽ����ϴ�.");
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
      crc.put("cdu_result", "������ ������ �����Ͽ����ϴ�.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "������ ������ �����Ͽ����ϴ�.");
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
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/manufacturer/storage");
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
    manufacturerVO.setManufacturer_img(files);
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
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
