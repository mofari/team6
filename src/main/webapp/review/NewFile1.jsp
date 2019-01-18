<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>PROHOME - Responsive Real Estate Template</title>

   <link rel="stylesheet" href="../css/bootstrap.min.css">                            <!-- Bootstrap -->
    <link rel="stylesheet" href="../css/vendor/font-awesom/css/font-awesome.min.css">  <!-- Font Awesome -->
   <link rel="stylesheet" href="../css/vendor/mmenu/jquery.mmenu.all.css" />          <!-- Menu Responsive -->
   <link rel="stylesheet" href="../css/vendor/animate-wow/animate.css">               <!-- Animation WOW -->

   <link rel="stylesheet" href="../css/vendor/nouislider/nouislider.min.css">         <!-- Slider Price -->
    <link rel="stylesheet" href="../css/vendor/easydropdown/easydropdown.css">         <!-- Select form Style -->
    <link rel="stylesheet" href="../css/ui-spinner.css">                               <!-- Spinner -->

   <link rel="stylesheet" href="../css/vendor/labelauty/labelauty.css">               <!-- Checkbox form Style -->
   <link rel="stylesheet" href="../css/menu.css">                                     <!-- Include Menu stylesheet -->
   <link rel="stylesheet" href="../css/custom.css">                                   <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="../css/media-query.css">                              <!-- Media Query -->

   <!-- Use Iconifyer to generate all the favicons and touch icons you need: http://iconifier.net -->
   <link rel="shortcut icon" href="images/favicon/favicon.ico" type="image/x-icon" />
   <link rel="apple-touch-icon" href="images/favicon/apple-touch-icon.png" />
   <link rel="apple-touch-icon" sizes="57x57" href="images/favicon/apple-touch-icon-57x57.png" />
   <link rel="apple-touch-icon" sizes="72x72" href="images/favicon/apple-touch-icon-72x72.png" />
   <link rel="apple-touch-icon" sizes="76x76" href="images/favicon/apple-touch-icon-76x76.png" />
   <link rel="apple-touch-icon" sizes="114x114" href="images/favicon/apple-touch-icon-114x114.png" />
   <link rel="apple-touch-icon" sizes="120x120" href="images/favicon/apple-touch-icon-120x120.png" />
   <link rel="apple-touch-icon" sizes="144x144" href="images/favicon/apple-touch-icon-144x144.png" />
   <link rel="apple-touch-icon" sizes="152x152" href="images/favicon/apple-touch-icon-152x152.png" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

   <script src="../script/modernizr.min.js"></script> <!-- Modernizr -->

  </head>
  <body class="fixed-header*">

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
               <div><h1 class="title">${categoryVO.category_title  } 리뷰</h1></div>
               <div><h2 class="sub-title">${categoryVO.category_title } 리뷰 보고가세요!</h2></div>
            </div>
         </div>
         <div id="breadcrumb">
            <div class="container">
               <ol class="breadcrumb">
                  <li><a href="#"><i class="fa fa-home"></i></a></li>
                  <li><a href="#">리뷰</a></li>
                  <li class="active">${categoryVO.category_title  }</li>
               </ol>
          
            </div>
         </div><!-- /#breadcrumb -->
         <span class="cover"></span>
      </section><!-- /#header -->

      <section id="agent-list">
    <div style="float:right; margin-right:60px;"><A href='./create.do?category_no=${param.category_no }'>등록</A></div>
         <div class="container" style='margin-top:3%;'>
      <form name="frm" id="frm" action="./list.do">
      <input type="hidden" id="category_no" name="category_no" value="${param.category_no }">
            <div class="row">
               <div class="col-md-12">
                  <div class="row">
            <c:forEach var="review_MemberVO" items="${list }">
                     <div class="col-sm-6 col-md-3">
                        <!-- . Agent Box -->
                        <div class="agent-box-card grey top-agent">
                  <div style="background-color:#f0f0f0; height:30px; vertical-align: middle">
                    <img src="../menu/images/myface.png" style="width:15%; height:90%; padding-right:8px; padding-top:4px;">${review_MemberVO.member_nickname }
                    <a href="./update.do?category_no=${param.category_no }&review_no=${review_MemberVO.review_no}"><img src="./images/update.png" title="수정" ></a>
                  </div>
                           <div class="image-content">
                              <div class="image image-fill">
                                 <c:choose>
                        <c:when test="${review_MemberVO.review_thumb != ''}">
                          <A href="./read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><IMG id='thumb' style="width:100%; "  src='./storage/${review_MemberVO.review_file }'> </A><!-- 이미지 파일명 출력 -->
                        </c:when>
                        <c:otherwise>
                          <!-- 파일이 존재하지 않는 경우 -->
                          <IMG src='./images/none1.jpg' style='width: 120px; height: 80px;'>
                        </c:otherwise>
                      </c:choose>    
                              </div>                  
                           </div>
                           <div class="info-agent">
                              <span class="name"><a href="./read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}">
                    <c:choose>
                             <c:when test="${fn:length(review_MemberVO.review_title) > 12}">
                              <c:out value="${fn:substring(review_MemberVO.review_title,0,11)}"/>....
                             </c:when>
                             <c:otherwise>
                              <c:out value="${review_MemberVO.review_title}"/>
                             </c:otherwise> 
                           </c:choose>
                    </a> </span>
                      <div class="text">
                                    <img src="./storage/${review_MemberVO.product_img }" style="width:25%">
                          <c:choose>
                             <c:when test="${fn:length(review_MemberVO.product_name) > 12}">
                              <c:out value="${fn:substring(review_MemberVO.product_name,0,11)}"/>....
                             </c:when>
                             <c:otherwise>
                              <c:out value="${review_MemberVO.product_name}"/>
                             </c:otherwise> 
                           </c:choose>
                                </div> 
                              <ul class="contact">
                                 <li style="float:left; width:33%;"><a class="icon" href="#"><i class="icon fa fa-heart"></i></a></li>
                                 <li style="float:left; width:33%;"><a class="icon" href="#"><i class="fa fa-comments"></i></a></li>
                                 <li style="float:left; width:33%;"><a class="icon" href="#"><i class="fa fa-eye"></i></a></li>
                              </ul>
                           </div>
                        </div>
                     </div><!-- /.col-md-4 -->
              </c:forEach>
                  </div><!-- /.row -->
               </div>
            </div>
             <div style="padding-left:30%; ">
      <input style="width:40%; border" type="text" name="word" id="word" placeholder="검색어를 입력하세요" value='${param.word }' >
    <button type="submit" style="display:inline-table; " class="btn btn-default search-button">검색 </button>
    </div> 
        </form>
         </div><!-- /.container -->


  <DIV class='bottom_menu'>${paging }</DIV>
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
<c:import url="../menu/js/review_list_js.jsp" />

  </body>
</html>