package dev.mvc.product;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.category.CategoryVO;
import dev.mvc.country.CountryVO;
import dev.mvc.manufacturer.ManufacturerVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class ProductCont {
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc = null;
  
  public ProductCont() {
    System.out.println("--> ProductCont created.");
  }

  @RequestMapping(value = "/product/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    List<CategoryVO> category_one_list = productProc.select_category_one();
    mav.addObject("category_one_list", category_one_list);
    List<CountryVO> country_list = productProc.country_list();
    mav.addObject("country_list", country_list);
    List<ManufacturerVO> manufacturer_list = productProc.manufacturer_list();
    mav.addObject("manufacturer_list", manufacturer_list);
    
    
    mav.setViewName("/product/create");

    return mav;
  }
  
  @RequestMapping(value = "/product/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();
    ProductVO productVO = new ProductVO();
    productVO.setCategory_no(Integer.parseInt(httpServletRequest.getParameter("category3")));
    productVO.setCountry_no(Integer.parseInt(httpServletRequest.getParameter("country")));
    productVO.setManufacturer_no(Integer.parseInt(httpServletRequest.getParameter("manufacturer")));
    productVO.setProduct_name(httpServletRequest.getParameter("name"));
    productVO.setMaterial(httpServletRequest.getParameter("material"));
    productVO.setProduct_target(httpServletRequest.getParameter("target"));
    productVO.setProduct_weight(httpServletRequest.getParameter("weight"));
    productVO.setProduct_price(Integer.parseInt(httpServletRequest.getParameter("price")));
    productVO.setProduct_wprotain(Double.parseDouble(httpServletRequest.getParameter("wprotein")));
    productVO.setProduct_wfat(Double.parseDouble(httpServletRequest.getParameter("wfat")));
    productVO.setProduct_wash(Double.parseDouble(httpServletRequest.getParameter("wash")));
    productVO.setProduct_wfiber(Double.parseDouble(httpServletRequest.getParameter("wfiber")));
    productVO.setProduct_wcalcium(Double.parseDouble(httpServletRequest.getParameter("wcalcium")));
    productVO.setProduct_wp(Double.parseDouble(httpServletRequest.getParameter("wp")));
    
    // -------------------------------------------------------------------
    // 상품 이미지 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/product/storage");
    MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)httpServletRequest;
    MultipartFile multipartFile = multipartHttpServletRequest.getFile("img");
    MultipartFile multipartFile2 = multipartHttpServletRequest.getFile("introimg");

    // System.out.println("--> filesMF.get(0).getSize(): " +
    // filesMF.get(0).getSize());

    String files = ""; // 컬럼에 저장할 파일명
    String files_item = ""; // 하나의 파일명
    String files2 = ""; // 컬럼에 저장할 파일명
    String files_item2 = ""; // 하나의 파일명
    String sizes = "";
    long sizes_item = 0; // 하나의 파일 사이즈
    String thumbs = ""; // Thumb 파일들
    String thumbs_item = ""; // 하나의 Thumb 파일명

    // Spring은 파일 선택을 안해도 1개의 MultipartFile 객체가 생성됨.
    // System.out.println("--> 업로드된 파일 갯수 count: " + count);

    if (multipartFile.getSize() > 0) { // 전송 파일이 존재한다면
      // for (MultipartFile multipartFile: filesMF) {
        System.out.println("multipartFile.getName(): " + multipartFile.getName());

        // if (multipartFile.getName().length() > 0) { // 전송파일이 있는지 체크, filesMF
        if (multipartFile.getSize() > 0) { // 전송파일이 있는지 체크
          // System.out.println("전송 파일이 있습니다.");
          files_item = Upload.saveFileSpring(multipartFile, upDir);

          if (multipartFile.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로
                                                    // 크기 체크
            files = files_item; // file1.jpg
            sizes = "" + sizes_item; // 123456
            thumbs = thumbs_item; // file1_t.jpg
          }

        } // if (multipartFile.getSize() > 0) {  END
    }
    
    if (multipartFile2.getSize() > 0) { // 전송 파일이 존재한다면
      // for (MultipartFile multipartFile: filesMF) {
        System.out.println("multipartFile.getName(): " + multipartFile2.getName());

        // if (multipartFile.getName().length() > 0) { // 전송파일이 있는지 체크, filesMF
        if (multipartFile2.getSize() > 0) { // 전송파일이 있는지 체크
          // System.out.println("전송 파일이 있습니다.");
          files_item2 = Upload.saveFileSpring(multipartFile2, upDir);

          if (multipartFile2.getSize() > 0) { // 파일이 없어도 파일 객체가 1개 생성됨으로
                                                    // 크기 체크
            files2 = files_item2; // file1.jpg
            sizes = "" + sizes_item; // 123456
            thumbs = thumbs_item; // file1_t.jpg
          }

        } // if (multipartFile.getSize() > 0) {  END
    }
    productVO.setProduct_img(files);
    productVO.setProduct_introimg(files2);
    if(productVO.getProduct_img().equals("")){
      productVO.setProduct_img("default.jpg");
    }
    if(productVO.getProduct_introimg().equals("")){
      productVO.setProduct_introimg("default.jpg");
    }
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    int crecount = productProc.create(productVO);
    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "신규 상품 등록에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "신규 상품 등록에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/product/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/product/selcate.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity selcate(HttpServletRequest httpServletRequest) {

    JSONArray jsonArray = new JSONArray();
    if(httpServletRequest.getParameter("categoryno").equals("")){
    }else{
      int categoryno = Integer.parseInt(httpServletRequest.getParameter("categoryno"));
      List<CategoryVO> category_two_list = productProc.select_category_two(categoryno);

      int size = category_two_list.size();
      for(int i = 0; i < size; i++){
        CategoryVO categoryVO = category_two_list.get(i);
        JSONObject json = new JSONObject();
        json.put("categoryno", categoryVO.getCategory_no());
        json.put("categorytitle", categoryVO.getCategory_title());
        jsonArray.put(json);
      }
    }
    
    HttpHeaders responseHeaders = new HttpHeaders();

    return new ResponseEntity(jsonArray.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  @RequestMapping(value = "/product/list.do", method = RequestMethod.GET)
  public ModelAndView list(
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage,
      @RequestParam(value="category1", defaultValue="") String ficate,
      @RequestParam(value="category2", defaultValue="") String secate,
      @RequestParam(value="category3", defaultValue="") String trcate,
      @RequestParam(value="manufacturer", defaultValue="") String manno
      ) {
    ModelAndView mav = new ModelAndView();
    System.out.println(nowPage); 
    
    String getparam = "";
    if(ficate.equals("")){
    }else{
      getparam += "&category1="+ficate;
    }
    if(secate.equals("")){
    }else{
      getparam += "&category2="+secate;
    }
    if(trcate.equals("")){
    }else{
      getparam += "&category3="+trcate;
    }
    if(manno.equals("")){
    }else{
      getparam += "&manufacturer="+manno;
    }
    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("word", word);                  // #{word}
    hashMap.put("nowPage", nowPage);
    hashMap.put("ficate", ficate);
    hashMap.put("secate", secate);
    hashMap.put("trcate", trcate);
    hashMap.put("manno", manno);
    
    if(trcate.equals("")){
      System.out.println("3카테 없음");
      if(secate.equals("")){
        System.out.println("2카테 없음");
        if(ficate.equals("")){
        } else {
          List<CategoryVO> category_two_list = productProc.select_category_two(Integer.parseInt(ficate));
          mav.addObject("category_two_list", category_two_list);
          System.out.println("category_two_list 등록");
        }
      } else {
        List<CategoryVO> category_two_list = productProc.select_category_two(Integer.parseInt(ficate));
        mav.addObject("category_two_list", category_two_list);
        System.out.println("category_two_list 등록");
        List<CategoryVO> category_three_list = productProc.select_category_two(Integer.parseInt(secate));
        mav.addObject("category_three_list", category_three_list);
        System.out.println("category_three_list 등록");
      }
    } else {
      List<CategoryVO> category_two_list = productProc.select_category_two(Integer.parseInt(ficate));
      mav.addObject("category_two_list", category_two_list);
      System.out.println("category_two_list 등록");
      List<CategoryVO> category_three_list = productProc.select_category_two(Integer.parseInt(secate));
      mav.addObject("category_three_list", category_three_list);
      System.out.println("category_three_list 등록");
    }

    List<OutProductVO> list = productProc.outproduct_list(hashMap);
    mav.addObject("list", list);

    List<ManufacturerVO> manufacturer_list = productProc.manufacturer_list();
    mav.addObject("manufacturer_list", manufacturer_list);
    
    List<CategoryVO> category_one_list = productProc.select_category_one();
    mav.addObject("category_one_list", category_one_list);
    
    int search_count = productProc.listcount(hashMap);
    mav.addObject("search_count", search_count);
    
    String paging = productProc.paging(search_count, nowPage, word, getparam);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    mav.setViewName("/product/list"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/product/del.do", method = RequestMethod.POST)
  public ModelAndView delete(int prono, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    int crecount = productProc.delete(prono);
    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);


    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "상품 삭제에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "상품 삭제에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/product/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/product/detail.do", method = RequestMethod.GET)
  public ModelAndView detail(int prono) {
    ModelAndView mav = new ModelAndView();

    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("memno", 1);                  // #{word}
    hashMap.put("prono", prono);
    
    int prolikecnt = productProc.findlike(hashMap);
    
    
    OutProductVO outProductVO = productProc.read(prono);
    CategoryVO categoryVO = productProc.readcategory(outProductVO.getCategory_no());

    if(categoryVO.getProcate_upno() == 0){
      mav.addObject("categoryVO", categoryVO);
    } else {
      CategoryVO category2VO = productProc.readcategory(categoryVO.getProcate_upno());
        if(category2VO.getProcate_upno() == 0){
          mav.addObject("categoryVO", category2VO);
        } else {
          CategoryVO category3VO = productProc.readcategory(category2VO.getProcate_upno());
          if(category3VO.getProcate_upno() == 0){
            mav.addObject("categoryVO", category3VO);
          } else {
            CategoryVO category4VO = productProc.readcategory(category3VO.getProcate_upno());
            mav.addObject("categoryVO", category4VO);
          }
        }
    }
    
    mav.addObject("outproductVO",outProductVO);
    mav.addObject("prolikecnt", prolikecnt);
    
    
    mav.setViewName("/product/detail");

    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/product/like.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity like(HttpServletRequest httpServletRequest) {

    
    HashMap<String, Object> hashMap = new HashMap<String, Object>();
    hashMap.put("memno", httpServletRequest.getParameter("memno"));                  // #{word}
    hashMap.put("prono", httpServletRequest.getParameter("prono"));

    int likecnt = productProc.findlike(hashMap);
    if(likecnt > 0){
      productProc.delike(hashMap);
    } else {
      productProc.like(hashMap);
    }
    JSONObject json = new JSONObject();
    HttpHeaders responseHeaders = new HttpHeaders();

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  @RequestMapping(value = "/product/update.do", method = RequestMethod.GET)
  public ModelAndView update(int prono) {
    ModelAndView mav = new ModelAndView();

    OutProductVO outProductVO = productProc.read(prono);
    mav.addObject("outProductVO", outProductVO);
    
    CategoryVO th_cateVO = productProc.readcategory(outProductVO.getCategory_no());
    mav.addObject("th_cateVO", th_cateVO);
    CategoryVO se_cateVO = productProc.readcategory(th_cateVO.getProcate_upno());
    mav.addObject("se_cateVO", se_cateVO);
    CategoryVO fi_cateVO = productProc.readcategory(se_cateVO.getProcate_upno());
    mav.addObject("fi_cateVO", fi_cateVO);
    
    List<CategoryVO> category_one_list = productProc.select_category_one();
    mav.addObject("category_one_list", category_one_list);
    List<CategoryVO> category_two_list = productProc.select_category_two(fi_cateVO.getCategory_no());
    mav.addObject("category_two_list", category_two_list);
    List<CategoryVO> category_three_list = productProc.select_category_two(se_cateVO.getCategory_no());
    mav.addObject("category_three_list", category_three_list);
    
    List<CountryVO> country_list = productProc.country_list();
    mav.addObject("country_list", country_list);
    List<ManufacturerVO> manufacturer_list = productProc.manufacturer_list();
    mav.addObject("manufacturer_list", manufacturer_list);
    
    
    mav.setViewName("/product/update");

    return mav;
  }
  
  @RequestMapping(value = "/product/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();
    ProductVO productVO = new ProductVO();
    productVO.setProduct_no(Integer.parseInt(httpServletRequest.getParameter("prono")));
    productVO.setCategory_no(Integer.parseInt(httpServletRequest.getParameter("category3")));
    productVO.setCountry_no(Integer.parseInt(httpServletRequest.getParameter("country")));
    productVO.setManufacturer_no(Integer.parseInt(httpServletRequest.getParameter("manufacturer")));
    productVO.setProduct_name(httpServletRequest.getParameter("name"));
    productVO.setMaterial(httpServletRequest.getParameter("material"));
    productVO.setProduct_target(httpServletRequest.getParameter("target"));
    productVO.setProduct_weight(httpServletRequest.getParameter("weight"));
    productVO.setProduct_price(Integer.parseInt(httpServletRequest.getParameter("price")));
    productVO.setProduct_wprotain(Double.parseDouble(httpServletRequest.getParameter("wprotein")));
    productVO.setProduct_wfat(Double.parseDouble(httpServletRequest.getParameter("wfat")));
    productVO.setProduct_wash(Double.parseDouble(httpServletRequest.getParameter("wash")));
    productVO.setProduct_wfiber(Double.parseDouble(httpServletRequest.getParameter("wfiber")));
    productVO.setProduct_wcalcium(Double.parseDouble(httpServletRequest.getParameter("wcalcium")));
    productVO.setProduct_wp(Double.parseDouble(httpServletRequest.getParameter("wp")));
    productVO.setProduct_img(httpServletRequest.getParameter("img"));
    productVO.setProduct_introimg(httpServletRequest.getParameter("introimg"));
    
    int crecount = productProc.update(productVO);
    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "상품 수정에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "상품 수정에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/product/list.do"); // /webapp/review/list.jsp

    return mav;
  }

  
  @ResponseBody
  @RequestMapping(value = "/product/updateimg.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity updateimg(HttpServletRequest httpServletRequest) {

    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String upDir = Tool.getRealPath(httpServletRequest, "/product/storage");
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
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------

    JSONObject json = new JSONObject();
      json.put("imgname", files);
    HttpHeaders responseHeaders = new HttpHeaders();

    return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
  }
  
  @RequestMapping(value = "/product/update2.do", method = RequestMethod.GET)
  public ModelAndView update2(int prono) {
    ModelAndView mav = new ModelAndView();

    OutProductVO outProductVO = productProc.read(prono);
    mav.addObject("outProductVO", outProductVO);
    
    CategoryVO th_cateVO = productProc.readcategory(outProductVO.getCategory_no());
    mav.addObject("th_cateVO", th_cateVO);
    CategoryVO se_cateVO = productProc.readcategory(th_cateVO.getProcate_upno());
    mav.addObject("se_cateVO", se_cateVO);
    CategoryVO fi_cateVO = productProc.readcategory(se_cateVO.getProcate_upno());
    mav.addObject("fi_cateVO", fi_cateVO);
    
    List<CategoryVO> category_one_list = productProc.select_category_one();
    mav.addObject("category_one_list", category_one_list);
    List<CategoryVO> category_two_list = productProc.select_category_two(fi_cateVO.getCategory_no());
    mav.addObject("category_two_list", category_two_list);
    List<CategoryVO> category_three_list = productProc.select_category_two(se_cateVO.getCategory_no());
    mav.addObject("category_three_list", category_three_list);
    
    List<CountryVO> country_list = productProc.country_list();
    mav.addObject("country_list", country_list);
    List<ManufacturerVO> manufacturer_list = productProc.manufacturer_list();
    mav.addObject("manufacturer_list", manufacturer_list);
    
    
    mav.setViewName("/product/update2");

    return mav;
  }
  
  @RequestMapping(value = "/product/update2.do", method = RequestMethod.POST)
  public ModelAndView update2(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();
    ProductVO productVO = new ProductVO();
    productVO.setProduct_no(Integer.parseInt(httpServletRequest.getParameter("prono")));
    productVO.setCategory_no(Integer.parseInt(httpServletRequest.getParameter("category3")));
    productVO.setCountry_no(Integer.parseInt(httpServletRequest.getParameter("country")));
    productVO.setManufacturer_no(Integer.parseInt(httpServletRequest.getParameter("manufacturer")));
    productVO.setProduct_name(httpServletRequest.getParameter("name"));
    productVO.setMaterial(httpServletRequest.getParameter("material"));
    productVO.setProduct_target(httpServletRequest.getParameter("target"));
    productVO.setProduct_weight(httpServletRequest.getParameter("weight"));
    productVO.setProduct_price(Integer.parseInt(httpServletRequest.getParameter("price")));
    productVO.setProduct_wprotain(Double.parseDouble(httpServletRequest.getParameter("wprotein")));
    productVO.setProduct_wfat(Double.parseDouble(httpServletRequest.getParameter("wfat")));
    productVO.setProduct_wash(Double.parseDouble(httpServletRequest.getParameter("wash")));
    productVO.setProduct_wfiber(Double.parseDouble(httpServletRequest.getParameter("wfiber")));
    productVO.setProduct_wcalcium(Double.parseDouble(httpServletRequest.getParameter("wcalcium")));
    productVO.setProduct_wp(Double.parseDouble(httpServletRequest.getParameter("wp")));
    productVO.setProduct_img(httpServletRequest.getParameter("img"));
    productVO.setProduct_introimg(httpServletRequest.getParameter("introimg"));
    
    int crecount = productProc.update(productVO);
    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "상품 수정에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "상품 수정에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/proreport/list.do"); // /webapp/review/list.jsp

    return mav;
  }
}
