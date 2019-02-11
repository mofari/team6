<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>리뷰 목록</title>
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
  </style> 
  
  
  
  <body class="fixed-header*">

  <div id="page-container">
      


  <!-- 화면 상단 메뉴 -->
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>펫러브</title>



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
  
<script>
function data_analysis(product_no, review_no) {
  // 문자열: ', ""
  var url = './data_analysis.do?product_no='+product_no+'&review_no='+review_no;
  var width = 900;
  var height = 400;
  var win = window.open(url, '상품 만족도 데이터 분석', 'width='+width+'px, height='+height+'px');
  var x = (screen.width - width) / 2; 
  var y = (screen.height - height) / 2;
  
  win.moveTo(x, y);
}  
</script>


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
            <li style="float:right;"><button type="button" onclick="location.href='./create.do?category_no=${param.category_no }'" class="btn btn-default btn-sm">등록</button></li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->
 
    <section id="recent-list">
			<div class="container">
      <form name="frm" id="frm" action="./list.do">
      <input type="hidden" id="category_no" name="category_no" value="${param.category_no }">
				<div class="row">        

      <c:forEach var="review_MemberVO" items="${list }">
               <div class="col-md-4">
                  <div class="box-ads box-home" style="padding-bottom: 0px;">
               <a class="hover-effect image image-fill" href="./read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}">
                        <span class="cover"></span> 
                <c:choose>
                  <c:when test="${review_MemberVO.review_thumb != ''}">
                            <img alt="thumb" id='thumb'  src='./storage/${review_MemberVO.review_file }'>
                          </c:when>
                  <c:otherwise>
                    <!-- 파일이 존재하지 않는 경우 -->
                    <IMG src='./images/good.png' style='width: 120px; height: 80px;'>
                  </c:otherwise>
                </c:choose>

							</a><!-- /.hover-effect -->
							<span class="event_title" >
                <c:choose>
                  <c:when test="${fn:length(review_MemberVO.review_title) > 12}">
                  	<a href="./read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><c:out value="${fn:substring(review_MemberVO.review_title,0,11)}"/>....</a>
                    <span style="float:right;">
                      <a href="./update.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><img alt="update" src="./images/update.png" title="수정"></a>
                      <a href="./delete.do?review_no=${review_MemberVO.review_no }&category_no=${review_MemberVO.category_no}"><img alt="delete" src="./images/delete.png" title="삭제" onclick="javascript:review_delete(${review_MemberVO.review_no})"></a>
                    </span>
                  </c:when>
                  <c:otherwise >
                    <a href="./read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><c:out value="${review_MemberVO.review_title}"/></a>
                    <span style="float:right;">
                      <a href="./update.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><img alt="update" src="./images/update.png" title="수정"></a>
                      <a href="./delete.do?review_no=${review_MemberVO.review_no }&category_no=${review_MemberVO.category_no}"><img alt="delete" src="./images/delete.png" title="삭제" onclick="javascript:review_delete(${review_MemberVO.review_no})"></a>
                    </span>
                  </c:otherwise> 
                </c:choose>        
             </span>  
             <span>
             <img src="../product/storage/${review_MemberVO.product_img }" style="width:20%;" onclick="javascript:data_analysis(${review_MemberVO.product_no}, ${review_MemberVO.review_no });">
             <c:choose>
                             <c:when test="${fn:length(review_MemberVO.product_name) > 20}">
                              <c:out value="${fn:substring(review_MemberVO.product_name,0,19)}"/>....
                             </c:when>
                             <c:otherwise>
                              <c:out value="${review_MemberVO.product_name}"/>
                             </c:otherwise> 
                             
                           </c:choose><br> 
             </span>
              <span class="event_good" >
                <img src='./images/good.png' style="width: 8%; margin-right: 3px;">${review_MemberVO.review_good }
                <img src='./images/reply.png' style="width: 8%; margin-right: 3px; margin-left:8px;">${review_MemberVO.review_reply_cnt }
              </span>
							<span class="event_rdate" >${fn:substring(review_MemberVO.review_rdate, 0, 10) }</span>
              
						</div><!-- /.box-home .box-ads -->  
					</div><!-- ./col-md-4 -->
          </c:forEach> 
				</div><!-- row -->
        <div style="padding-left:30%; ">
      <input style="width:40%; border-radius: 5px; height:33px;" type="text" name="word" id="word" placeholder="검색어를 입력하세요" value='${param.word }' >
    <button type="submit" style="display:inline-table; margin-bottom:5px; height:33px;" class="btn btn-default search-button">검색 </button>
    </div> 
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

<c:import url="../menu/js/review_list_js.jsp" />
</body>
</html>