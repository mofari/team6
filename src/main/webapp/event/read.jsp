<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>이벤트 조회</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/death/jquery.death.css">                <!-- edit text script -->
  <style type="text/css">
  div#event_content img { max-width: 100% !important; height: auto; }
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
            <li class="active">이벤트 조회</li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->

    <section id="new-property" style="padding-top: 0px; background-color: #f6f6f6;">
      <div class="container"  style="max-width: 630px; background-color: white;">
       <div class="row">
       
       <%-- 추후 관리자만 사용 --%>
       <div style="text-align: right; font-weight: 600; padding: 10px;">
       <A href='./update.do?event_no=${eventVO.event_no }'>수정</A>
       <A href='./delete.do?event_no=${eventVO.event_no }'>삭제</A>
       </div>
       
        <c:if test="${eventVO.event_ck == 'N' }">
       <div class="event_contitle" style="background-color: #1fb7a6; color: white; text-align: center; padding: 10px; margin-bottom: 30px; font-weight: 600;">
       당첨자 확인
       
       </div>
       </c:if>
       
       <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="eventno" value="${eventVO.event_no}">
       <div class="event_read_header" > 
               <c:choose>
                   <c:when test="${eventVO.event_imgsize > 0}">
                     <img alt="Event images" src='./storage/${eventVO.event_img }'  style="width: 100%; height: 250px;">
                   </c:when>
                   <c:otherwise>
                     <img alt="Event images" src='./images/no-image.jpg'  style="width: 100%; height: 250px;">
                   </c:otherwise> 
                </c:choose>
             <div class="event_read_headr_title" style="position: relative;">
              <div class="event_read_headr_title_sub"  style="font-weight: 600; font-size: 20px; width: 80%;margin: 10px;">
              ${eventVO.event_title }
              <div style="font-weight: 100; font-size: 13px; margin-top: 10px;">${eventVO.event_rdate.substring(0, 10) } ~ ${eventVO.event_endrdate.substring(0, 10) }</div>
              </div>
              <div class="event_good" style="    position: absolute; right: 11px; top: 11px;">
              <img alt="good images" src='./images/good.png'  style="width: 30px;">
              </div>
          </div> 
       </div>
       
       
       <%-- 컨텐츠 --%>
        <div class="event_content"  id="event_content">
          ${eventVO.event_content }
        </div>
        <%-- 컨텐츠 END --%>
        </FORM>
        
        <c:if test="${null ne eventVO.event_site}">
        <%-- 보러가기 버튼 --%>
        <div style="text-align: center; margin: 30px 0 30px 0px;">
        <button style="background-color: #ffffff; color: #1fb7a6;font-size: 25px;font-weight: 700; width: 80%;border: solid 3px #1fb7a6; padding: 10px;" onclick="window.open('${eventVO.event_site}')" >
            더 자세한 정보가 알고싶다면??
        </button>
        </div>
      <%-- 보러가기 버튼 END --%>
        </c:if>
        
        
        <c:if test="${eventVO.event_ck == 'Y' }">
        <%-- 신청하기 버튼 --%>
        <div style="text-align: center; margin: 30px 0 30px 0px;">
        <button style="background-color: #1fb7a6;color: white;font-size: 25px;font-weight: 700;width: 80%;border: none;
        padding: 10px;border-radius: 40px;" onclick = "location.href = '${pageContext.request.contextPath}/request/create.do?event_no=${eventVO.event_no }' ">
            신청하기
        </button>
        </div>
      <%-- 신청하기 버튼 END --%>
      </c:if>

       <c:if test="${eventVO.event_ck == 'N' }">
        <%-- 신청종료시 --%>
        <div style="text-align: center; margin: 30px 0 30px 0px;">
        <button style="background-color: #1fb7a6;color: white;font-size: 25px;font-weight: 700;width: 80%;border: none;
        padding: 10px;border-radius: 40px;" disabled = 'disabled'>
            신청종료
        </button>
        </div>
      <%-- 신청종료시 END --%>
      </c:if>
      
      
      <div style="padding: 50px 30px 50px 10px; text-align: right;">
          <div style="display: inline-block; color: #bdbdbd;">
            <img alt="good images" src='./images/good.png'  style="width: 13px;margin-right: 3px;">
            ${eventVO.event_good}
          </div>
          <div style="display: inline-block; color: #bdbdbd;">
            <img alt="good images" src='./images/comment.png'  style="width: 13px;margin-right: 3px;">
            ${eventVO.event_comment}
          </div>
          <div style="display: inline-block; color: #bdbdbd;">
            <img alt="good images" src='./images/view.png'  style="width: 13px;margin-right: 3px;">
            ${eventVO.event_view}
          </div>
      </div>
      

      
      <%--댓글 등록 --%>
      <div id="panel_create" style="">
          <h3 class="title-form" style="margin-left: 20px; font-size: 15px;  font-weight: 600;"><img alt="good images" src="./images/comment.png" style="width: 23px;"> 댓글을 달아주세요~ </h3>
              <form class="form-large grey-color" action="./create.do" method="post" id="frm_create" name="frm_create"  style="border-top: 1px solid #E5E5E5;">
              <input type="hidden" value="2" id="member_no" name="member_no">
                <div class="row">
                  <div class="col-md-12">
                    <textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"  required disabled placeholder="로그인을 해주세요"></textarea>
                  </div>
                </div>
                <button type="button" id="submit" name="submit" class="btn btn-default" onclick="create()" style="margin-left: 91%;">등록</button>
              </form> 
          </div>
          <%--댓글 등록 폼 END --%>
          
          
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