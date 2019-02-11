package dev.mvc.loginhistory;
 
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.loginhistory.LoginhistoryProcInter;
import dev.mvc.loginhistory.LoginhistoryVO;
import dev.mvc.member.MemberProc;
import dev.mvc.member.MemberProcInter;
import dev.mvc.member.MemberVO;

@Controller
public class LoginhistoryCont {
  @Autowired
  @Qualifier("dev.mvc.loginhistory.LoginhistoryProc")
  private LoginhistoryProcInter loginhistoryProc = null;
  
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc = null;
  
  public LoginhistoryCont(){
    System.out.println("--> Loginhistory created.");
  }
   
    
    /**
     * 
     * @param session
     * @return
     */
    @RequestMapping(value="/loginhistory/list.do", method=RequestMethod.GET)
    public ModelAndView list(HttpSession session){
      // System.out.println("--> create() GET called.");
        ModelAndView mav = new ModelAndView();
               
        List<LoginhistoryVO> list = loginhistoryProc.list();
        mav.addObject("list", list);         
 
        mav.setViewName("/loginhistory/list");
      return mav;
    } 
    
    /**
     * 
     * @param loginhistory_loginno
     * @return
     */
    @RequestMapping(value="/loginhistory/read.do", method=RequestMethod.GET)
    public ModelAndView read(int loginhistory_loginno){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/loginhistory/read");
      
      LoginhistoryVO loginhistoryVO = loginhistoryProc.read(loginhistory_loginno);
      System.out.println(loginhistoryVO.getLoginhistory_email() + "1");
      mav.addObject("loginhistoryVO", loginhistoryVO);
      
      return mav;
    }  
    
    @RequestMapping(value="/loginhistory/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(int loginhistory_loginno){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/loginhistory/delete");
      
      LoginhistoryVO loginhistoryVO = loginhistoryProc.read(loginhistory_loginno);
      System.out.println(loginhistoryVO.getLoginhistory_email() + "2");
      mav.addObject("loginhistoryVO", loginhistoryVO);
      
      return mav;
    }
    
    @RequestMapping(value="/loginhistory/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(RedirectAttributes redirectAttributes,
                                          HttpServletRequest request, int loginhistory_loginno){
      ModelAndView mav = new ModelAndView();
      
      int count = loginhistoryProc.delete(loginhistory_loginno);
      
      redirectAttributes.addAttribute("count", count);
      redirectAttributes.addAttribute("loginhistory_loginno", loginhistory_loginno);
      
      mav.setViewName("redirect:/loginhistory/delete_message.jsp");
      
      return mav;
    }
    
    
    /**
     * ��� + ����¡ ����
     * @param nowPage
     * @return
     */
    @RequestMapping(value = "/loginhistory/list_loginhistory_paging.do", 
                                         method = RequestMethod.GET)
    public ModelAndView list_loginhistory_paging(
        @RequestParam(value="nowPage", defaultValue="1") int nowPage
        ) { 
      // System.out.println("--> list_by_category() GET called.");
      System.out.println("--> nowPage: " + nowPage);
      
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/loginhistory/list_loginhistory_paging"); 
      
      // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
      HashMap<String, Object> hashMap = new HashMap<String, Object>();
      hashMap.put("nowPage", nowPage);       
      
      List<LoginhistoryVO> list = loginhistoryProc.list_loginhistory_paging(hashMap);
      mav.addObject("list", list);
      
      // �˻��� ���ڵ� ����
      int search_count = loginhistoryProc.search_count(hashMap); 
      mav.addObject("search_count", search_count);

    
      /*
       * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
       * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
       *
       * @param nowPage     ���� ������
       * @return ����¡ ���� ���ڿ�
       */ 
      String paging = loginhistoryProc.paging(search_count, nowPage);
      mav.addObject("paging", paging);
    
      mav.addObject("nowPage", nowPage);
      
      return mav;
    }
 
}