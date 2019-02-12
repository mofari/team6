package dev.mvc.member;

import java.io.BufferedReader; 
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
 
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.loginhistory.LoginhistoryProcInter;
import dev.mvc.loginhistory.LoginhistoryVO;

@Controller
public class MemberCont {
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc = null;
  @Autowired
  @Qualifier("dev.mvc.loginhistory.LoginhistoryProc")
  private LoginhistoryProcInter loginhistoryProc = null;
  
  public MemberCont(){
    System.out.println("--> MemberCont created.");
  }
   
   /**
    * 중복 ID 검사
    *   
    * 결과: {"cnt":1}
    * @param id
    * @return
    */
   @ResponseBody
   @RequestMapping(value = "/member/checkId.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
   public String checkId(String member_email) {
     JSONObject json = new JSONObject();
     int cnt = memberProc.checkId(member_email);
     
     json.put("cnt", cnt);
     return json.toString(); 
   }
   
   
   /**
    * 아이디 찾기
    * @return
    */
   @RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
   public ModelAndView findId() {
     ModelAndView mav = new ModelAndView();
     mav.setViewName("/member/findId");
     
     return mav;
   }
   
   @RequestMapping(value="/member/findId.do", method=RequestMethod.POST)
   public ModelAndView findId(String member_tel, String member_name) {
     ModelAndView mav = new ModelAndView();
     int cnt = memberProc.findId(member_tel,  member_name);
     System.out.println(cnt);
     
     if(cnt == 1){
       MemberVO memberVO = memberProc.readByname(member_name); //이름으로 검색 (readByname)
       mav.addObject("cnt", cnt);
       mav.addObject("member_email", memberVO.getMember_email()); //이메일  findId_message.jsp로 뿌려줌
     }
     else {
       mav.addObject("cnt", cnt);
     }
     
     
     mav.setViewName("redirect:/member/findId_message.jsp");
     return mav;
   }
   
   
   
   @RequestMapping(value = "/member/login")
   public String isComplete(HttpSession session) {
     return "/member/naverlogin";
   }
   
   @RequestMapping(value = "/member/callback")
   public String navLogin(HttpServletRequest request) throws Exception { 
     return "/member/callback";
   } 
   
   @RequestMapping(value = "/personalInfo")
   public void personalInfo(HttpServletRequest request) throws Exception {
           String token = "AAAAOQG3xWSkBoBf8UW%2FaMVkGoMcYdD5t%2FkBrDbowgrd6szLsU90e42x9Lo6QjoUXyWZ7biZx3aykZXJMwFbSaDWCXs%3D";// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
           String header = "Bearer " + token; // Bearer 다음에 공백 추가
           try {
               String apiURL = "https://openapi.naver.com/v1/nid/me";
               URL url = new URL(apiURL);
               HttpURLConnection con = (HttpURLConnection)url.openConnection();
               con.setRequestMethod("GET");
               con.setRequestProperty("Authorization", header);
               int responseCode = con.getResponseCode();
               BufferedReader br;
               if(responseCode==200) { // 정상 호출 
                   br = new BufferedReader(new InputStreamReader(con.getInputStream()));
               } else {  // 에러 발생
                   br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
               }
               String inputLine;
               StringBuffer response = new StringBuffer();
               while ((inputLine = br.readLine()) != null) {
                   response.append(inputLine);
               }
               br.close();
               System.out.println(response.toString());
           } catch (Exception e) {
               System.out.println(e);
           }
   }
   
    @RequestMapping(value = "/member/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/member/create");
      
      return mav;
    }
    
    @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
    public ModelAndView create(RedirectAttributes redirectAttributes,
                                          HttpServletRequest request, MemberVO memberVO) {
      ModelAndView mav = new ModelAndView();
      
      int count = memberProc.checkId(memberVO.getMember_email());
      
      if (count == 1) {
        redirectAttributes.addAttribute("sw", "member_email");
        redirectAttributes.addAttribute("count", count);
      } else {
        count = memberProc.create(memberVO);
        
        redirectAttributes.addAttribute("sw", "create");
        redirectAttributes.addAttribute("count", count);
      }
      
      
      mav.setViewName("redirect:/member/create_message.jsp");
      
      return mav;
    }
    
    /**
     * 
     * @param session
     * @return
     */
    @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
    public ModelAndView list(HttpSession session){
      // System.out.println("--> create() GET called.");
        ModelAndView mav = new ModelAndView();
               
        List<MemberVO> list = memberProc.list();
        mav.addObject("list", list);         
 
        mav.setViewName("/member/list");
      return mav;
    } 
    
    /**
     * 
     * @param member_no
     * @return
     */
    @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
    public ModelAndView read(int member_no){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/member/read");
      
      MemberVO memberVO = memberProc.read(member_no);
      mav.addObject("memberVO", memberVO);
      
      return mav;
    }  
    
    @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
    public ModelAndView update(MemberVO memberVO){
      ModelAndView mav = new ModelAndView();
      
      int count = memberProc.update(memberVO);
      mav.addObject("count", count);
      mav.addObject("member_no", memberVO.getMember_no());

      mav.setViewName("redirect:/member/update_message.jsp");
      
      return mav;
    }  
    
    /**
     * 패스워드 변경폼
     * @return
     */
    @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.GET)
    public ModelAndView passwd_update(){
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/member/passwd_update"); // webapp/member/passwd_update.jsp
      
      return mav;
    }  
    
    /**
     * 패스워드를 변경합니다.
     * @param request
     * @param passwd
     * @param new_passwd
     * @return
     */
    @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
    public ModelAndView passwd_update(HttpServletRequest request,
                                                      HttpSession session,
                                                      String passwd_update,
                                                      String new_passwd_update){
      // System.out.println("--> passwd_update() POST called.");
      ModelAndView mav = new ModelAndView();
      
//      String id = (String)session.getAttribute("id"); // session
      String member_email = "user1";
//      int mno = (Integer)session.getAttribute("mno"); // session
      int member_no = 1;
      // 로그인 관련 추가 영역
//      int count = memberProc.login(id, passwd); // 현재 패스워드 검사
      int count=1;
      System.out.println("--> count: " + count);
      if (count == 1) { // 로그인한 회원의 패스워드 검사
        int count_update = memberProc.passwd_update(member_no, new_passwd_update);
        System.out.println("--> count_update: " + count_update);
        mav.setViewName("redirect:/member/passwd_update_message.jsp?count=" + count_update + "&member_no=" + member_no);
      } else {
        mav.setViewName("redirect:/member/login.do");      
      }
      
      return mav;
    } 

    @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(int member_no){
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/member/delete");
      
      MemberVO memberVO = memberProc.read(member_no);
      mav.addObject("memberVO", memberVO);
      
      return mav;
    }
    
    @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
    public ModelAndView delete(RedirectAttributes redirectAttributes,
                                          HttpServletRequest request, int member_no){
      ModelAndView mav = new ModelAndView();
      
      int count = memberProc.delete(member_no);
      
      redirectAttributes.addAttribute("count", count);
      redirectAttributes.addAttribute("mno", member_no);
      
      mav.setViewName("redirect:/member/delete_message.jsp");
      
      return mav;
    }
    
    /**
     * 로그인 폼
     * @return
     */
    // http://localhost:9090/member/member/login.do 
    @RequestMapping(value = "/member/login.do", 
                               method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/member/login"); // /webapp/member/login.jsp
      
      Cookie[] cookies = request.getCookies();
      Cookie cookie = null;
   
      String ck_id = ""; // id 저장 변수
      String ck_id_save = ""; // id 저장 여부를 체크하는 변수
      String ck_passwd = ""; // passwd 저장 변수
      String ck_passwd_save = ""; // passwd 저장 여부를 체크하는 변수
   
      if (cookies != null) {
        for (int i=0; i < cookies.length; i++){
          cookie = cookies[i]; // 쿠키 객체 추출
          
          if (cookie.getName().equals("ck_id")){
            ck_id = cookie.getValue(); 
          }else if(cookie.getName().equals("ck_id_save")){
            ck_id_save = cookie.getValue();  // Y, N
          }else if (cookie.getName().equals("ck_passwd")){
            ck_passwd = cookie.getValue();         // 1234
          }else if(cookie.getName().equals("ck_passwd_save")){
            ck_passwd_save = cookie.getValue();  // Y, N
          }
        }
      }
      
      mav.addObject("ck_id", ck_id);
      mav.addObject("ck_id_save", ck_id_save);
      mav.addObject("ck_passwd", ck_passwd);
      mav.addObject("ck_passwd_save", ck_passwd_save);
      
      return mav;
    }
    
    /**
     * 로그인 처리
     * @param request
     * @param response
     * @param session
     * @param id
     * @param id_save
     * @param passwd
     * @param passwd_save
     * @return
     */
    @RequestMapping(value="/member/login.do", method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, 
                                         HttpServletResponse response,
                                         HttpSession session,
                                         String member_email,
                                         @RequestParam(value="id_save", defaultValue="") String id_save,
                                         String member_passwd,
                                         @RequestParam(value="passwd_save", defaultValue="") String passwd_save){
      // System.out.println("--> login() POST called.");
      ModelAndView mav = new ModelAndView();
      
      
      if(memberProc.readById(member_email) != null){        
      
      if (memberProc.login(member_email, member_passwd) != 1) { // 로그인 실패시
        mav.setViewName("redirect:/member/login_message.jsp");
        
      }else if(member_passwd.equals("naverlogin")){
        
        MemberVO old_memberVO = memberProc.readById(member_email);
        
        session.setAttribute("member_no",  old_memberVO.getMember_no()); // session 내부 객체
        session.setAttribute("member_email", member_email);
        session.setAttribute("member_passwd", member_passwd);
        session.setAttribute("member_name", old_memberVO.getMember_name());
        session.setAttribute("member_nickname", old_memberVO.getMember_nickname());
        session.setAttribute("member_logintype", "N");
        
        LoginhistoryVO old_LoginhistoryVO = new LoginhistoryVO();
        
        old_LoginhistoryVO.setLoginhistory_ip(request.getRemoteAddr());
        old_LoginhistoryVO.setLoginhistory_email(member_email);
        old_LoginhistoryVO.setAct_no(1);
        old_LoginhistoryVO.setMember_no(old_memberVO.getMember_no());
        
        
       // System.out.println(old_LoginhistoryVO.getLoginhistory_ip());
       // System.out.println(old_LoginhistoryVO.getLoginhistory_email());
       // System.out.println(old_LoginhistoryVO.getAct_no());
       // System.out.println(old_LoginhistoryVO.getMember_no());
        
       loginhistoryProc.create(old_LoginhistoryVO);
        
       mav.setViewName("redirect:/"); // 확장자 명시 

      }else { // 패스워드 일치하는 경우
        MemberVO old_memberVO = memberProc.readById(member_email);
   
        session.setAttribute("member_no",  old_memberVO.getMember_no()); // session 내부 객체
        session.setAttribute("member_email", member_email);
        session.setAttribute("member_passwd", member_passwd);
        session.setAttribute("member_name", old_memberVO.getMember_name());
        session.setAttribute("member_nickname", old_memberVO.getMember_nickname());
        
        LoginhistoryVO old_LoginhistoryVO = new LoginhistoryVO();
        
        old_LoginhistoryVO.setLoginhistory_ip(request.getRemoteAddr());
        old_LoginhistoryVO.setLoginhistory_email(member_email);
        old_LoginhistoryVO.setAct_no(1);
        old_LoginhistoryVO.setMember_no(old_memberVO.getMember_no());
        
        
       // System.out.println(old_LoginhistoryVO.getLoginhistory_ip());
       // System.out.println(old_LoginhistoryVO.getLoginhistory_email());
       // System.out.println(old_LoginhistoryVO.getAct_no());
       // System.out.println(old_LoginhistoryVO.getMember_no());
        
        int count = loginhistoryProc.create(old_LoginhistoryVO);
        
        if(count==1)
        {
          System.out.println("호우~ 등록됐따~");
        }

        // -------------------------------------------------------------------
        // id 관련 쿠키 저장
        // -------------------------------------------------------------------
        if (id_save.equals("Y")) { // id를 저장할 경우
          Cookie ck_id = new Cookie("ck_id", member_email);
          ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
          response.addCookie(ck_id);
        } else { // N, id를 저장하지 않는 경우
          Cookie ck_id = new Cookie("ck_id", "");
          ck_id.setMaxAge(0);
          response.addCookie(ck_id);
        }
        // id를 저장할지 선택하는  CheckBox 체크 여부
        Cookie ck_id_save = new Cookie("ck_id_save", id_save);
        ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_id_save);
        // -------------------------------------------------------------------
   
        // -------------------------------------------------------------------
        // Password 관련 쿠키 저장
        // -------------------------------------------------------------------
        if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
          Cookie ck_passwd = new Cookie("ck_passwd", member_passwd);
          ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
          response.addCookie(ck_passwd);
        } else { // N, 패스워드를 저장하지 않을 경우
          Cookie ck_passwd = new Cookie("ck_passwd", "");
          ck_passwd.setMaxAge(0);
          response.addCookie(ck_passwd);
        }
        // passwd를 저장할지 선택하는  CheckBox 체크 여부
        Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
        ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd_save);
        // -------------------------------------------------------------------
        
        mav.setViewName("redirect:/"); // 확장자 명시 
        
        }
      }else{
        mav.setViewName("redirect:/member/login_message.jsp");
      }
      return mav;
    }
    
    /**
     * 로그아웃 처리
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, 
                                           HttpSession session){
      // System.out.println("--> logout() GET called.");
      ModelAndView mav = new ModelAndView();
   
      session.invalidate(); // session 내부 객체의 등록된 모든 session 변수 삭제
      
      // webapp/member/message_logout.jsp
      mav.setViewName("redirect:/member/logout_message.jsp"); 
      
      return mav;
     }
    
    /**
     * 검색 목록
     * 
     * @param member_name
     * @return
     */
    @RequestMapping(value = "/member/member_search.do", method = RequestMethod.GET)
    public ModelAndView member_search(RedirectAttributes redirectAttributes, HttpServletRequest request,
        String member_name) {
      // System.out.println("--> list_by_category(int categoryno, String
      // word_find) GET called.");
      ModelAndView mav = new ModelAndView();
      // mav.setViewName("/contents/list_by_categoryno"); //
      // webapp/contents/list_by_categoryno.jsp

      // 검색 기능 추가, webapp/contents/list_by_category_search.jsp
      mav.setViewName("/member/member_search");
      redirectAttributes.addAttribute("member_name", member_name);
 

      // 검색 목록
      List<MemberVO> list = memberProc.member_search(member_name);
      mav.addObject("list", list);

      // 검색된 레코드 갯수
      int search_count = memberProc.search_count(member_name);
      System.out.println(search_count);
      mav.addObject("search_count", search_count);

      MemberVO memberVO = memberProc.readByname(member_name);
      mav.addObject("memberVO", memberVO);
     

      // mav.addObject("word", word);

      return mav;
    }
     
    }
