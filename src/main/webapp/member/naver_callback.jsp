<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String root = request.getContextPath();  // 절대 경로
%>

  <!-- (1) LoginWithNaverId Javscript SDK -->
  <script src="../js/naveridlogin_js_sdk_2.0.0.js"></script>
  <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

  <!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
  <script>
     var naverLogin = new naver.LoginWithNaverId(
      {
        clientId: "72O_jbeuiHpyMCTK55kX",
        callbackUrl: "http://localhost:9090/review/member/naver_callback.do",
        isPopup: false,
        callbackHandle: true
        /* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
      }
    );
    
    naverLogin.init(); 

  
    naverLogin.getLoginStatus(function (status) { 
      if (status) { 
      var email = naverLogin.user.getEmail(); 
      var nickName = naverLogin.user.getNickName(); 
      var name = naverLogin.user.getName(); 
      var profileImage = naverLogin.user.getProfileImage(); 


      var is_Require = true ;  
      /* 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 .. 개인정보 선택옵션으로 필요한것을 받아야한다.*/ 
      if( email == undefined || email == null) { 
      is_Require = true ; 
      } 

      if( is_Require == false ){ 
      alert("이름은 필수정보입니다. 정보제공을 동의해주세요."); 
      /* 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */ 
      naverLogin.reprompt(); 
      return; 
      } 

      console.log('여기를 지나다'); 
      //여기서 회원정보 조회  

      $.ajax({ 
      cache: false, 
      url: "./naver_callback.do",  // DataBase 에 등록되어 있는 회원정보가 있는지 조회한다
      type: "GET",
      dataType: "json", 
      data: { "member_email" : email }
      ,async: true, 
      error: function(xhr, status, error) { 
      alert(error); 
      }, 
      success: function(data){ 
      var nIS_Login = false;  
      if(data.cnt == 1){
        $.ajax({ 
          cache: false, 
          url: "./login.do",  //중복되면 로그인처리
          dataType: "json", 
          data: { "member_email": email , "member_passwd": "naverlogin" } 
          ,async: true,
          error: function(xhr, status, error) { 
          alert(error); 
          },
          success: function(data){
            console.log(data.email);
          }
         });
        nIS_Login = true;  
       }
      
      if(nIS_Login == false){ // 아이디가 없을 때 Email중복 체크 
        console.log("아이디가 없습니다.");
       }
      }
     });
       
     
      } 
      }); 
      


  </script>