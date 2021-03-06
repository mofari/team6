<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>다이어리</title>
  </head>
  
  <style type="text/css">
  .event_title{
  display: block;
  padding: 6px 12px;  
  font-weight: 600;
  color: #222;
   font-size: 16px;
   }
  .event_rdate{
    display: inline-block;
    padding: 8px 12px 10px;
    font-size: 10px;
    border-top: none;
    text-align: right;
    border-bottom: none;
    float: right!important;
    background-color: #ffffff;
    }
    .event_good{
    display: inline-block;
    padding: 8px 12px 10px;
    font-size: 10px;
    border-top: none;
    text-align: left;
    border-bottom: none;
    background-color: #ffffff;
    }
    .event_start{
    background-color: #000000;
    font-weight: 600;
    color: #fff;
    font-size: 10px;
    padding: 4px 11px;
    position: absolute !important;
    top: 11px;
    right: 4%;
    left: auto;
    z-index: 3;
    }
    .event_end{
    background-color: rgba(192, 192, 192, 0.9);
    font-weight: 600;
    color: #fff;
    font-size: 10px;
    padding: 4px 11px;
    position: absolute !important;
    top: 11px;
    right: 4%;
    left: auto;
    z-index: 3;
    }
   #member_image{
    width:20%;
    height: 50px ;
    border: 2px solid gold;
    border-radius: 100px;
   -moz-border-radius: 7px;
   -khtml-border-radius: 7px;
/*    -webkit-border-radius: 7px; */
}

  #pet_info{
  float:left;
  margin-left:60px;
  margin-top: -25px;
  }
  </style> 
  
  
  <body class="fixed-header*">

  <div id="page-container">
      


  <!-- 화면 상단 메뉴 -->
    <head> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>PROHOME - Responsive Real Estate Template</title>

  <link rel="stylesheet" href="/review/resources/css/bootstrap.min.css">                            <!-- Bootstrap -->
    <link rel="stylesheet" href="/review/resources/css/vendor/font-awesom/css/font-awesome.min.css">  <!-- Font Awesome -->
  <link rel="stylesheet" href="/review/resources/css/vendor/mmenu/jquery.mmenu.all.css" />          <!-- Menu Responsive -->
  <link rel="stylesheet" href="/review/resources/css/vendor/animate-wow/animate.css">               <!-- Animation WOW -->

 <link rel="stylesheet" href="/review/resources/css/vendor/flipclock/flipclock.css">               <!-- Flip Countdown -->

    <link rel="stylesheet" href="/review/resources/css/vendor/labelauty/labelauty.css">               <!-- Checkbox form Style -->
  <link rel="stylesheet" href="/review/resources/css/vendor/nouislider/nouislider.min.css">         <!-- Slider Price -->
    <link rel="stylesheet" href="/review/resources/css/vendor/easydropdown/easydropdown.css">         <!-- Select form Style -->
    <link rel="stylesheet" href="/review/resources/css/ui-spinner.css">                               <!-- Spinner -->
    

  <link rel="stylesheet" href="/review/resources/css/menu.css">                                     <!-- Include Menu stylesheet -->
  <link rel="stylesheet" href="/review/resources/css/custom.css">                                   <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="/review/resources/css/media-query.css">                              <!-- Media Query -->

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

  <script src="/review/resources/script/modernizr.min.js"></script> <!-- Modernizr -->

  </head>
  <c:import url="/menu/top2.jsp" />
    <section id="header-page" class="header-margin-base">
      <div class="skyline">
        <div data-offset="50" class="p1 parallax"></div>
        <div data-offset="25" class="p2 parallax"></div>
        <div data-offset="15" class="p3 parallax"></div>
        <div data-offset="8"  class="p4 parallax"></div>
        <span class="cover"></span>
        <div class="container header-text">
          <div><h1 class="title">${categoryVO.category_title  } 다이어리</h1></div>
          <div><h2 class="sub-title">${categoryVO.category_title } 다이어리 보고가세요!</h2></div>
        </div>
      </div>
      <div id="breadcrumb">
        <div class="container">
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">다이어리</a></li>
            <li class="active">${categoryVO.category_title  }</li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
      
    </section><!-- /#header -->
    <section>
     <ASIDE style='float: right;'>
       <button class="btn btn-default signout-button" type="submit" 
       onclick="javascript:location.reload();">
        새로고침</button> 
        
    <button class="btn btn-default signin-button"  type="button"
    onclick="location.href='./create.do?category_no=${param.category_no}'" >    
        <i class="fa fa-sign-in"></i>등록</button>
      
        </ASIDE>
    
    </section>
   <%--  <section id ="cnt-_list">
    <form name='frm' method = "get" action="./cnt_list.do">
     <c:forEach var="diaryVO" items="${list }">
               <div class="col-md-4">
<!--                <div style="display: inline-block;"> -->
               <span class='event_title'> <img  id ='member_image' src='./storage/${diaryVO.member_image}' style=" ">${diaryVO.member_nickname } </span>
<!--                <div class="" style=""> -->
                 <span style="font-size: 10px;">${diaryVO.pet_kind }(${diaryVO.pet_age })</span>
                  •<span style="font-size: 10px;"> ${diaryVO.pet_name }</span>
<!--                </div> -->

<!--                </div> -->
               <div class="box-ads box-home" style="padding-bottom: 0px;">
               <div style="margin:auto; width:300px; ">
               <div class='event_title' style ="float:left; width:auto; margin-left:-30px;"> 
               <img  id ='member_image' src='./storage/${diaryVO.member_image}' style=" ">
                <span>${diaryVO.member_nickname } </span>
               </div>
              
               <div class='pet_info'  style="float:left; margin-left:30px; margin-top: -25px;">
                  <span style="font-size: 10px; display: inline-block;">${diaryVO.pet_kind }(${diaryVO.pet_age })</span>
                 <span style="font-size: 10px;"> ${diaryVO.pet_name }</span>                
               </div>
               </div>           
               <a class="hover-effect image image-fill" href="./read.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}">
                        <span class="cover"></span> 
                <c:choose> 
                  <c:when test="${diaryVO.diary_file != ''}">
                            <img id='diary_file'  style='width:100%; height: 250px;' src='./storage/${diaryVO.diary_file }'>
                          </c:when>
                  <c:otherwise> 
                    <!-- 파일이 존재하지 않는 경우 -->
                    <IMG src='./images/none1.png' style='width: 100%; height: 250px;'>
                  </c:otherwise>
                </c:choose>

              </a><!-- /.hover-effect -->
              <span class="event_title" >
               <a href="./read.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}">
                <c:choose>
                  <c:when test="${fn:length(diaryVO.diary_title) > 12}"> 
                    <c:out value="${fn:substring(diaryVO.diary_title,0,11)}"/>.... 
                  </c:when>
                  <c:otherwise>
                    <c:out value="${diaryVO.diary_title}"/> 
                  </c:otherwise>  
                </c:choose>   
                 
               </a>     
                     
             </span> 
             
              <span class="event_good" >
                <img src='./images/good.png' style="width: 8%; margin-right: 3px;">${diaryVO.diary_like }
                <img src='./images/reply.png' style="width: 8%; margin-right: 3px; margin-left:8px; ">${diaryVO.diary_rcnt } 
              
              </span> 
              <span class="event_good"> ${diaryVO.diary_cnt } views</span>
              <span class="event_rdate" >${fn:substring(diaryVO.diary_rdate, 0, 10) }</span>
            </div><!-- /.box-home .box-ads -->  
          </div><!-- ./col-md-4 -->
          </c:forEach> 
    </form>
    
    </section> --%>
    <section id="recent-list">
    
			<div class="container">
   

      
      <form name='frm' method ="get" action="./list_paging.do">
      <input type='hidden' id='category_no' name='category_no' value="${categoryVO.category_no }">
				<div class="row">    
        <section>
           <input type='text'   class ="margin form-control" name='word' id='word' value=''  placeholder="검색어를 입력하세요" style='width: 35%;'>
          <button  class = "btn btn-default signin-button" type='submit'><i class="fa fa-pinterest-p">검색</i></button>
               <c:if test="${param.word.length() > 0}"> 
      
      [${param.word}] 검색 목록(${search_count } 건) 
      <button class="btn btn-default "  type="button"
    onclick="location.href='./list_paging.do?category_no=${param.category_no}'" >    
        <i class="fa fa-sign-in"></i>취소</button>
       
            </c:if>
          </section>
      <c:forEach var="diaryVO" items="${list }">
               <div class="col-md-4">
<!--                <div style="display: inline-block;"> -->
<%--                <span class='event_title'> <img  id ='member_image' src='./storage/${diaryVO.member_image}' style=" ">${diaryVO.member_nickname } </span> --%>
<!--                <div class="" style=""> -->
<%--                  <span style="font-size: 10px;">${diaryVO.pet_kind }(${diaryVO.pet_age })</span> --%>
<%--                   •<span style="font-size: 10px;"> ${diaryVO.pet_name }</span> --%>
<!--                </div> -->

<!--                </div> -->
               <div class="box-ads box-home" style="padding-bottom: 0px;">
               <div style="margin:auto; width:300px; ">
               <div class='event_title' style ="float:left; width:auto; margin-left:-30px;"> 
               <img  id ='member_image' src='./storage/${diaryVO.member_image}' style=" ">
                <span>${diaryVO.member_nickname } </span>
               </div>
              
               <div class='pet_info'  style="float:left; margin-left:30px; margin-top: -25px;">
                  <span style="font-size: 10px; display: inline-block;">${diaryVO.pet_kind }(${diaryVO.pet_age })</span>
                 <span style="font-size: 10px;"> ${diaryVO.pet_name }</span>                
               </div>
               </div>           
               <a class="hover-effect image image-fill" href="./read.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}">
                        <span class="cover"></span> 
                <c:choose> 
                  <c:when test="${diaryVO.diary_file != ''}">
                            <img id='diary_file'  style='width:100%; height: 250px;' src='./storage/${diaryVO.diary_file }'>
                          </c:when>
                  <c:otherwise> 
                    <!-- 파일이 존재하지 않는 경우 -->
                    <IMG src='./images/none1.png' style='width: 100%; height: 250px;'>
                  </c:otherwise>
                </c:choose>

							</a><!-- /.hover-effect -->
							<span class="event_title" >
               <a href="./read.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}">
                <c:choose>
                  <c:when test="${fn:length(diaryVO.diary_title) > 12}"> 
                  	<c:out value="${fn:substring(diaryVO.diary_title,0,11)}"/>.... 
                  </c:when>
                  <c:otherwise>
                    <c:out value="${diaryVO.diary_title}"/> 
                  </c:otherwise>  
                </c:choose>   
                 
               </a>     
                     
             </span> 
             
              <span class="event_good" >
                <img src='./images/good.png' style="width: 8%; margin-right: 3px;">${diaryVO.diary_like }
                <img src='./images/reply.png' style="width: 8%; margin-right: 3px; margin-left:8px; ">${diaryVO.diary_rcnt } 
              
              </span> 
              <span class="event_good"> ${diaryVO.diary_cnt } views</span>
							<span class="event_rdate" >${fn:substring(diaryVO.diary_rdate, 0, 10) }</span>
						</div><!-- /.box-home .box-ads -->  
					</div><!-- ./col-md-4 -->
          </c:forEach> 
				</div><!-- row -->
<!--          <div style="padding-left:34%; ">  -->
<!--       <input style="width:40%; border" type="text" name="word" id="word" placeholder="검색어를 입력하세요" value='' >  -->
<!--      <button type="submit" style="display:inline-table; " class="btn btn-default search-button">검색 </button>  -->
<!--     </div>     -->
        </form>
        </div><!-- container --> 
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

  <script src="/review/resources/script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="/review/resources/script/jquery-ui.min.js"></script>   <!-- jQuery UI is a curated set of user interface interactions, effects, widgets, and themes -->
  <script src="/review/resources/script/bootstrap.min.js"></script>   <!-- Include all compiled plugins (below), or include individual files as needed -->

  <script src="/review/resources/script/vendor/mmenu/mmenu.min.all.js"></script>          <!-- Menu Responsive -->
  <script src="/review/resources/script/vendor/animation-wow/wow.min.js"></script>          <!-- Animate Script -->
  <script src="/review/resources/script/vendor/labelauty/labelauty.min.js"></script>          <!-- Checkbox Script -->
  <script src="/review/resources/script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
  <script src="/review/resources/script/vendor/images-fill/imagesloaded.min.js"></script>     <!-- Loaded image with ImageFill -->
  <script src="/review/resources/script/vendor/images-fill/imagefill.min.js"></script>          <!-- ImageFill Script -->
  <script src="/review/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->
  <script src="/review/resources/script/vendor/carousel/responsiveCarousel.min.js"></script>    <!-- Carousel Script -->

  <script src="/review/resources/script/custom.js"></script>    <!-- Custom Script -->
</body>
</html>