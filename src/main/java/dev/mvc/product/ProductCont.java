package dev.mvc.product;

import java.util.Iterator;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.category.CategoryProcInter;
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
    
    mav.setViewName("/product/create");

    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/product/selcate.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public ResponseEntity updateimg(HttpServletRequest httpServletRequest) {

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
}
