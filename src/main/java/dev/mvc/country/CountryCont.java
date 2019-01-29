package dev.mvc.country;

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

import dev.mvc.manufacturer.ManufacturerVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class CountryCont {
  @Autowired
  @Qualifier("dev.mvc.country.CountryProc")
  private CountryProcInter countryProc = null;
  
  public CountryCont() {
    System.out.println("--> CountryCont created.");
  }
  
  @RequestMapping(value = "/country/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/country/create"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/country/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes){
  //public ModelAndView create(ManufacturerVO manufacturerVO){
    ModelAndView mav = new ModelAndView();
    CountryVO countryVO = new CountryVO();
    countryVO.setCountry_name(httpServletRequest.getParameter("name"));
    
    int crecount = countryProc.create(countryVO);


    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "신규 제조국 등록에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "신규 제조국 등록에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/country/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/country/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<CountryVO> list = countryProc.list();
    mav.addObject("list", list);
    
    mav.setViewName("/country/list"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/country/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int countryno, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    int crecount = countryProc.delete(countryno);
    
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
    mav.setViewName("redirect:/country/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/country/update.do", method = RequestMethod.POST)
  public ModelAndView update(HttpServletRequest httpServletRequest, RedirectAttributes redirectAttributes) {
    ModelAndView mav = new ModelAndView();

    CountryVO countryVO = new CountryVO();
    countryVO.setCountry_no(Integer.parseInt(httpServletRequest.getParameter("countryno")));
    countryVO.setCountry_name(httpServletRequest.getParameter("name"));
    
    int crecount = countryProc.update(countryVO);
    

    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);
    
    Map<String, Object> crc = new HashMap<String,Object>();
    if(crecount > 0){
      crc.put("cdu_result_code", 1);
      crc.put("cdu_result", "제조국 수정에 성공하였습니다.");
    } else {
      crc.put("cdu_result_code", 0);
      crc.put("cdu_result", "제조국 수정에 실패하였습니다.");
    }
    
    redirectAttributes.addFlashAttribute("vo", crc);
    mav.setViewName("redirect:/country/list.do"); // /webapp/review/list.jsp

    return mav;
  }
  
  @RequestMapping(value = "/country/update.do", method = RequestMethod.GET)
  public ModelAndView update(int countryno) {
    ModelAndView mav = new ModelAndView();

    CountryVO countryVO = countryProc.read(countryno);
    
    //ReviewVO reviewVO = reviewProc.list(categoryno);
    //mav.addObject("categoryVO", categoryVO);

    // List<ManufacturerVO> list = manufacturerProc.list(category_no);
    // mav.addObject("list", list);
    mav.addObject("countryVO", countryVO);
    
    mav.setViewName("/country/update"); // /webapp/review/list.jsp

    return mav;
  }

}
