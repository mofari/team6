<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>이벤트 등록</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/death/jquery.death.css">                <!-- edit text script -->
   <style type="text/css">
   .section-color:before {
    top: -1px;
    border-top: 20px solid #f6f6f6  !important;
    }
   </style>

  </head>
  <body class="fixed-header">

  <div id="page-container">
        <c:import url="/menu/top2.jsp" />
  
    
    <section id="header-page" class="header-margin-base">
      <div class="skyline">
        <div data-offset="50" class="p1 parallax"></div>
        <div data-offset="25" class="p2 parallax"></div>
        <div data-offset="15" class="p3 parallax"></div>
        <div data-offset="8"  class="p4 parallax"></div>
        <span class="cover"></span>
        <div class="container header-text">
          <div><h1 class="title">LovePet 이벤트</h1></div>
          <div><h2 class="sub-title">반려동물과 관련된 다양한 이벤트 참여해보세요!</h2></div>
        </div>
      </div>
      <div id="breadcrumb">
        <div class="container">
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="./list_event_paging.do">이벤트</a></li>
            <li class="active">이벤트 신청서 등록</li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->

    <section id="new-property" style="background-color: #f6f6f6;">
      <div class="container" style="max-width: 630px; background-color: white;">
        <div class="row" style="margin-top: 50px;">

 <FORM name='frm' method='POST' action='./create.do'
               enctype="multipart/form-data" class="form-horizontal">
          
          <input type='hidden' name='member_no' id='member_no' value='1'>
          <input type='hidden' name='event_no' id='event_no' value='${param.event_no }'>
          <input type='hidden' name='event_requestprize' id='event_requestprize' value='N'>
          
          <div style="padding: 30px;">

            <div class="info-block" id="basic">
              <div>
                <h3 class="title"  style="text-align: center; font-weight: 600;">이벤트 당첨시, 상품 수령받으실 주소</h3>
              </div>
              <div class="row">
                <div style="margin-bottom: 40px;">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;"><b>이름</b></div>
                  <input id="event_requestman" class="form-control" type="text" placeholder="이름을 입력해주세요" name="event_requestman"  value="" required="required">
                </div>  
                
                <div  style="margin-bottom: 40px;">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;"><b>전화번호</b></div>
                  <input id="event_requestphone" class="form-control"  placeholder="ex) 010-4244-5678"  type="tel" pattern="(010)-\d{3,4}-\d{4}"  name="event_requestphone"  value="" required="required">
                </div>
                 
                <div>
                  <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;"><b>주소</b></div>
                  <input id="event_requestaddr" class="form-control" type="text" name="event_requestaddr"  value="" required="required">
                </div>

                
              </div>
            </div>
            
            <!-- 작성정보 끝 -->
            
          <DIV style='text-align: right; margin-top: 50px;'>
            <button type="submit" class="btn btn-reverse select-button">등록</button>
            <!-- <button type="button" onclick="location.href='./'">취소[목록]</button> -->
          </DIV>
          </div>
            
          

        </FORM> <!-- from 종료 -->
          
        </div>
      </div>
    </section>

 <c:import url="/menu/bottom.jsp" />

    <div class="modal fade login-modal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
        <div class="login-button-container">
          <a href="#" data-section="login"><i class="fa fa-user"></i></a>
          <a href="#" data-section="sign-in"><i class="fa fa-pencil-square-o"></i></a>
          <a href="#" data-section="recovery"><i class="fa fa-lock"></i></a>
          <a href="#" data-section="setting"><i class="fa fa-cog"></i></a>
        </div><!-- ./login-button-container -->
        <div class="form-container">
          <form method="post" action="#">
            <div id="login" class="box">
              <h2 class="title">Login in to your account</h2>
              <h3 class="sub-title">It is a breach of our terms and conditions to provide username and password details to unauthorised third parties. Unauthorised use may lead to suspension or termination.</h3>
              <div class="field">
                <input id="user-log" name="user-log" class="form-control" type="text" placeholder="Username or email">
                <i class="fa fa-user user"></i>
              </div>
              <div class="field">
                <input id="password-log" name="password-log" class="form-control" type="password" placeholder="Password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field footer-form text-right">
                <span class="remember"><input class="labelauty" type="checkbox" data-labelauty="Keep me signed in" checked /></span>
                <button type="button" class="btn btn-reverse button-form">Reset</button>
                <button type="button" class="btn btn-default button-form">Login</button>
              </div>
            </div> <!-- ./login -->
            <div id="sign-in" class="box">
              <h2 class="title">Sign In</h2>
              <h3 class="sub-title">Create a Free account and discover how you can centralize all communication around a transaction, connect with clients, market your listings, and more. </h3>
              <div class="form-inline">
                <div class="form-group">
                  <input id="user-sign" name="user-sign" class="form-control input-inline margin-right" type="text" placeholder="Username">
                  <i class="fa fa-user user"></i>
                </div>
                <div class="form-group">
                  <input id="email-sign" class="form-control input-inline" type="text" name="email-sign" placeholder="Email">
                  <i class="fa fa-envelope-o"></i>
                </div>
              </div>
              <div class="field">
                <input id="password-sign" class="form-control" type="password" name="password-sign" placeholder="Password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field">
                <input id="re-password-sign" class="form-control" type="password" name="re-password-sign" placeholder="Repeat password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field footer-form text-right">
                <span class="remember"><input class="labelauty" type="checkbox" data-labelauty="I have read the privacy policy." checked /></span>
                <button type="button" class="btn btn-default button-form">Sign in</button>
              </div>
            </div><!-- ./sign-in -->
            <div id="setting" class="box">
              <h2 class="title">Setting profile</h2>
              <h3 class="sub-title">Please note: You won't be able to change your name within the next 60 days. Make sure that you don't add any unusual capitalisation, punctuation, characters or random words. <a href="#">Learn more</a>.</h3>
              <div class="field">
                <input id="username-block" class="form-control" type="text" name="username-block" value="John Doe" disabled>
                <i class="fa fa-user user"></i>
              </div>
              <div class="field">
                <input id="email-setting" class="form-control" type="text" name="email-setting" value="administrator@prohome.com">
                <i class="fa fa-envelope-o"></i>
              </div>
              <div class="field">
                <input id="update-pass" class="form-control" type="password" name="update-pass" placeholder="New password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field">
                <input id="update-repass" class="form-control" type="password" name="update-repass" placeholder="Repeat password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field footer-form text-right">
                <button type="button" class="btn btn-reverse button-form">Cancel</button>
                <button type="button" class="btn btn-default button-form">Update</button>
              </div>
            </div><!-- ./recovery -->
            <div id="recovery" class="box">
              <h2 class="title">Need a new password?</h2>
              <h3 class="sub-title">Enter your email address, and we’ll email you instructions to reset your password.</h3>
              <div class="field">
                <input id="recovery-email" class="form-control" type="text" name="recovery-email" placeholder="Your email">
                <i class="fa fa-envelope-o"></i>
              </div>
              <div class="field footer-form text-right">
                <button type="button" class="btn btn-default button-form">Recovery</button>
              </div>
            </div><!-- ./recovery -->
          </form><!-- ./form-container -->
        </div><!-- ./login-button-container -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <div class="modal fade" id="modal-contact" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>

        <div class="form-container full-fixed">
          <form method="post" action="#">
            <div id="form-modal-contact" class="box active modal-contact">
              <h2 class="title">How can we help?</h2>
              <h3 class="sub-title">Please send us your thoughts by filling out the below form. Comments are solely for internal use. Your address will not be shared with outside parties or used for any other purpose than to respond to your comments.</h3>
              <ul class="object-contact">
                <li><a href="#"><i class="fa fa-code"></i>Suggestion</a></li>
                <li><a href="#"><i class="fa fa-question"></i>Question</a></li>
                <li><a href="#" class="active"><i class="fa fa-bug"></i>Problems</a></li>
                <li><a href="#"><i class="fa fa-comment-o"></i>Feedback</a></li>
              </ul>
              <div class="field">
                <textarea class="form-control" name="message" id="message" placeholder="Your message"></textarea>
              </div>
              <div class="field">
                <input id="short-summary" class="form-control" type="text" name="short-summary" placeholder="Short summary">
                <i class="fa fa-tag"></i>
              </div>
              <div class="field">
                <input id="email-help" class="form-control" type="text" name="email-help" placeholder="Your email">
                <i class="fa fa-envelope-o"></i>
              </div>
              <div class="field footer-form text-right">
                <button type="button" class="btn btn-reverse button-form">Cancel</button>
                <button type="button" class="btn btn-default button-form">Send</button>
              </div>

            </div>
          </form>
        </div>


      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  </div><!-- /#page-container -->


<c:import url="/menu/js/event_create_js.jsp" />
  <script>
      $('#filesMF').filestyle({
       buttonText : '파일 선택'
      });                        
</script>
  </body>
</html>