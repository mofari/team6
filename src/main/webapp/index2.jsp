<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String root = request.getContextPath();  // 절대 경로
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>러브펫</title>
  </head>
  

  <body class="fixed-header">

  <div id="page-container">
    <c:import url="/menu/top.jsp" />
    
    
    <section id="welcome" style="margin-top: 120px; margin-bottom: 80px;">
     <img alt="welcome"  src='${pageContext.request.contextPath}/menu/images/main.PNG'  style="width: 100%; height: 550px;">
    </section>
    
    <div style="text-align: center;">
    <b style="font-size: 35px;"><strong>나의 소중한 반려동물</strong></b> <br>
    <p style="font-size: 25px; font-weight: 400;">러브펫과 함께 최적의 사료 간식을 찾아보세요</p>
    </div>
    
    <div style="text-align: center; font-size: 20px; font-weight: 400; margin: 60px 0px 40px 0px">
    나를 위해 함께해주는 반려동물을 위한 <br>
    다양한 사료들과 간식 브랜드 까지
    </div>
    
<div class="gallery"  style="position: relative;">
  <div class="row"  style="margin: 70px 70px 30px 70px;">
     <div class="col-md-3">
        <img src='${pageContext.request.contextPath}/menu/images/diary.png'  alt="Sample images" class="img-responsive" style="width: 250px;
    height: 250px; border: 1px solid #d1d1d1;">
        <div style="text-align: center; margin-top: 5px;">
        <span style="font-size: 17px; font-weight: 600;">러브펫 다이어리</span> <br>
        <button class="btn btn-reverse  select-button" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
      </div>
     <div class="col-md-3">
        <img src='${pageContext.request.contextPath}/menu/images/review.png'   alt="Sample images" class="img-responsive" style="width: 250px;
    height: 250px; border: 1px solid #d1d1d1;">
         <div style="text-align: center; margin-top: 5px;">
         <span style="font-size: 17px; font-weight: 600;">사료/간식 리뷰</span> <br>
        <button class="btn btn-reverse  select-button" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
      </div>
      <div class="col-md-3">
         <img src='${pageContext.request.contextPath}/menu/images/event.png'  alt="Sample images" class="img-responsive" style="width: 250px;
    height: 250px; border: 1px solid #d1d1d1;">
        <div style="text-align: center; margin-top: 5px;">
        <span style="font-size: 17px; font-weight: 600;">러브펫 이벤트</span> <br>
        <button class="btn btn-reverse  select-button" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
       </div>
        <div class="col-md-3">
           <img src='${pageContext.request.contextPath}/menu/images/product.png'  alt="Sample images" class="img-responsive" style="width: 250px;
    height: 250px; border: 1px solid #d1d1d1;">
         <div style="text-align: center; margin-top: 5px;">
         <span style="font-size: 17px; font-weight: 600;">사료/간식 상품</span> <br>
        <button class="btn btn-reverse  select-button" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
        </div>
    </div>
<!--     <div style="height: 190px;width: 100%;background-color: #eaeaea;bottom: -30px;position: absolute;z-index: -1;">
    </div> -->
 </div>
    
  <div style="margin-top: 60px; margin-bottom: 15px; background-color: #dfdfdf;">
  <div style="padding: 30px;">
    <div style="text-align: center;font-size: 35px;font-weight: 400;">
      이달의 인기 상품
    </div>
    </div>
    
    요따가 집어넣으면 됨
    
  </div>
    
  <div>
   <div style="padding: 30px;">
    <div style="text-align: center; font-size: 35px; font-weight: 400; ">
    러브펫 리얼 리뷰
    </div>
    <div style="text-align: center; margin-top: 15px; font-size: 18px;">러브펫 이용자들의 리뷰를 확인해보세요!</div>
    </div>
    
     요따가 집어넣으면 됨
    
  </div>
  
  <div style="background-color:#1fb7a694; padding: 30px;">
  <div style="text-align: center;font-size: 35px;font-weight: 400;">
  러브펫 Q & A
  </div>
  <div style="text-align: center; margin-top: 15px; font-size: 18px;">
  궁금하신 사항이 있으면, 언제든지 문의해주세요! <br><br>
      <button class="btn btn-reverse  select-button" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
      margin-bottom: 5px;">문의하기 ▶</button>
    </div>
  </div> 

   <div style="padding: 30px;"> </div>
 
  
  
  
 </div> <!-- page end -->
 

    
    
     
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
 
 
  <script src="<%=root%>/resources/script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="<%=root%>/resources/script/jquery-ui.min.js"></script>   <!-- jQuery UI is a curated set of user interface interactions, effects, widgets, and themes -->
  <script src="<%=root%>/resources/script/bootstrap.min.js"></script>   <!-- Include all compiled plugins (below), or include individual files as needed -->

  <script src="<%=root%>/resources/script/vendor/mmenu/mmenu.min.all.js"></script>          <!-- Menu Responsive -->
  <script src="<%=root%>/resources/script/vendor/animation-wow/wow.min.js"></script>          <!-- Animate Script -->
  <script src="<%=root%>/resources/script/vendor/labelauty/labelauty.min.js"></script>          <!-- Checkbox Script -->
  <script src="<%=root%>/resources/script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
  <script src="<%=root%>/resources/script/vendor/images-fill/imagesloaded.min.js"></script>     <!-- Loaded image with ImageFill -->
  <script src="<%=root%>/resources/script/vendor/images-fill/imagefill.min.js"></script>          <!-- ImageFill Script -->
  <script src="<%=root%>/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->
  <script src="<%=root%>/resources/script/vendor/carousel/responsiveCarousel.min.js"></script>    <!-- Carousel Script -->

  <script src="<%=root%>/resources/script/custom.js"></script>    <!-- Custom Script -->

  </body>
</html>