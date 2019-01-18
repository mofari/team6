<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>이벤트 등록</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/death/jquery.death.css">                <!-- edit text script -->
   
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
  <script type="text/JavaScript">
    window.onload=function(){
      CKEDITOR.replace('event_content');  // <TEXTAREA>태그 id 값
    };
  </script>

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
            <li><a href="#">이벤트</a></li>
            <li class="active">이벤트 등록</li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->

    <section id="new-property">
      <div class="container">
        <div class="row">
          <div class="col-sm-3 col-md-3" id="block-menu-content">
            <ul class="block-menu" data-spy="affix" data-offset-top="500" data-offset-bottom="400">
              <li><a class="faq-button active" href="#basic"><i class="icon fa fa-check-square-o"></i>이벤트 정보입력</a></li>
              <li><a class="faq-button" href="#summary"><i class="icon fa fa-th-list"></i> 이벤트 사이트 등록</a></li>
              <li><a class="faq-button" href="#images"><i class="icon fa fa-picture-o"></i> 썸네일 등록</a></li>

            </ul>
          </div>
 <FORM name='frm' method='POST' action='./create.do'
               enctype="multipart/form-data" class="form-horizontal">
          
          <input type='hidden' name='member_no' id='member_no' value='1'>
          <input type='hidden' name='event_visibel' id='event_visibel' value='Y'>
          <input type='hidden' name='event_ck' id='event_ck' value='Y'>
          
          <div class="col-sm-9 col-md-9">

            <div class="info-block" id="basic">
              <div class="section-title line-style no-margin">
                <h3 class="title">이벤트 정보입력</h3>
              </div>
              <div class="row">
                <div class="col-md-7 space-form">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">이벤트 제목</div>
                  <input id="event_title" class="form-control" type="text" placeholder="제목을 입력해주세요" name="event_title"  value="이벤트 입력하는 중입니다.">
                </div>  
                <div class="col-md-5 space-form">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">이벤트 종료 날짜</div>
                  <input id="event_endrdate" class="form-control" type="date" name="event_endrdate"  value="">
                </div>
                <div class="col-md-12"  style="margin-top: 30px;">
                  <textarea name='event_content' id='event_content' rows='10' cols='70' ></textarea>
                </div>
              </div>
            </div>
            
            
            <div class="info-block" id="summary">
              <div class="section-title line-style">
                <h3 class="title">이벤트 사이트 등록</h3>
              </div>

              <div class="row">
                 <div class="col-md-12 space-form">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">이벤트 사이트 주소 등록</div>
                  <input id="event_site" class="form-control" type="text" placeholder="이벤트 사이트를 입력해주세요" name="event_site"  value="www.naver.com">
                </div>  
              </div>
            </div>
            
            <div class="info-block" id="images">
              <div class="section-title line-style">
                <h3 class="title">썸네일 등록</h3>
              </div>
               <input type="file" class="form-control input-lg" name='filesMF' id='filesMF' size='40' multiple="multiple" >
              <span class="text">
                <strong>썸네일</strong> 이미지를 등록해 주세요.<br />
              </span>
            </div>

            <!-- 작성정보 끝 -->
            
      <DIV style='text-align: right; margin-top: 50px;'>
        <button type="submit" class="btn btn-default select-button">등록</button>
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