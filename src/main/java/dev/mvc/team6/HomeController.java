package dev.mvc.team6;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dev.mvc.pfreview.Review_MemberVO;
import dev.mvc.product.OutProductVO;
import dev.mvc.product.ProductProcInter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
  @Autowired
  @Qualifier("dev.mvc.team6.HomeProc")
  private HomeProcInter homeProc = null;
  
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      List<OutProductVO> listproduct = homeProc.homeproductlist();
      
      List<Review_MemberVO> list = homeProc.main_review();
      

      model.addAttribute("list", list);
      model.addAttribute("listproduct", listproduct);
      model.addAttribute("serverTime", formattedDate );
      
      return "index2";
   }
   
}