 <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>러브펫</title>

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
  <link rel="stylesheet prefetch" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
  <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="../script/modernizr.min.js"></script> <!-- Modernizr -->

  </head>
  <style>
    body .popover {
      max-width: 150px;
    }
    .col-md-5 {
      transition: all ease 1s;
    }
    .col-md-5:hover {
        transform: scale( 1.1 );
      }
    .event_rdate{
    display: inline-block;
    padding: 8px 12px 0px;
    font-size: 10px;
    border-top: none;
    text-align: right;
    border-bottom: none;
    float: right!important;
    background-color: #fafafa;
    } 
    body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  color: #000;
  background-color: #fafafa;
}

.topnav a {
  float: left;
  color: #fafafa;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  color:#000;
}

.topnav a:hover {
  border-bottom: 4px solid #1fb7a6;
  color: black;
  color: #1fb7a6;
}

.topnav a.active {
  border-bottom: 4px solid #1fb7a6;
  color: #1fb7a6;
}
.best_review{
    display: inline-block;
    background-color: #1fb7a6;
    margin-top: 8px;
    font-size: 15px;
    color: #ffffff;
    padding: 0 14px;
    position: absolute !important;
    top: 0;
    right: auto;
    bottom: auto;
    left: 0;
    z-index: 1;
   border-radius: 3px;
   margin-left:90%;
   margin-top:5%;
}
  .best_review_triangle {
    position: absolute !important;
    top: 55%;
    right: 63px;
    bottom: auto;
    left: auto;
    z-index: 1;
    content: "";
    margin-top: -8px;
    width: 0;
    height: 0;
    border-right: 6px solid #1fb7a6;
    border-top: 6px solid transparent;
    border-bottom: 6px solid transparent;
    
  }
  </style>

  <script type="text/javascript">
    //Wait for the web page to be ready
    $(document).ready(function() {
      // grab all thumbnails and add bootstrap popovers
      // https://getbootstrap.com/javascript/#popovers
      $('[data-toggle="popover"]').popover({
        container: 'body',
        html: true,
        placement: 'auto',
        trigger: 'hover',
        content: function() {
          // get the url for the full size img
          var url = $(this).data('full');
          return '<img style="width:100px;" src="' + url + '">'
        }
      });
    });
    
    
    function pet_category(category_no, member_no) {
      if(category_no == 0){
        $('#div_list').show();
        $('#cat').removeClass("active");
        $('#dog').removeClass("active");
        $('#etc').removeClass("active");
        $('#all').addClass("active");
      }
      else{
        if(category_no == 1) {
          $('#all').removeClass("active");
          $('#cat').removeClass("active");
          $('#etc').removeClass("active");
          $('#dog').addClass("active");
        } else if(category_no == 2) {
          $('#all').removeClass("active");
          $('#dog').removeClass("active");
          $('#etc').removeClass("active");
          $('#cat').addClass("active");
        } else if(category_no == 3) {
          $('#all').removeClass("active");
          $('#dog').removeClass("active");
          $('#cat').removeClass("active");
          $('#etc').addClass("active");
        }
				$('#div_list').hide();
      }
      $.ajax({
        url: "./pet_category.do", // 요청을 보낼주소
        type: "get",  // or get
        cache: false,
        dataType: "json", // 응답 데이터 형식, or json
        data: 'category_no=' +category_no+'&member_no='+member_no,  
        // Ajax 통신 성공, JSP 정상 처리
        success: function(rdata) { // callback 함수
          var panel="";
          if(rdata.length == "0" && category_no != 0){
            panel += "<section id='error-page' style='padding: 100px 0 160px;'>";
            panel += "<div class='container'>";
            panel += "<div class='row'>";
            panel += "<div class='col-md-8 col-md-offset-2'>";
            panel += "<img style='padding-bottom:10px;' id='logo-header' src='${pageContext.request.contextPath}/resources/images/logo.jpg'  alt='Logo' />";
            panel += "<h2 class='line-broken'>등록된 글이 없습니다.</h2>";
            panel += "</div>";
            panel += "</div>";
            panel += "</div>";
            panel += "</section>";
          }
          if(rdata.length > 0){
          for(index=0; index < 1; index++) {
            panel += "<c:forEach var='reviewVO' items='${member_review_list }'>";
            panel += "<div class='col-md-5' style='float:left; margin-left:7%;'>";
            panel += "<c:if test='${reviewVO.review_good >= 5 }'>";
            panel += "<div class='best_review'>";
            panel += "BEST";
            panel += "<div class='best_review_triangle'></div></div></c:if>";
            panel += "<a href='./read.do?category_no=${reviewVO.category_no }&review_no=${reviewVO.review_no}'>";
            panel += "<img style='float:left; margin-right:20px; margin-top:20px; clear:both; width:30%; height:130px;' src='./storage/${reviewVO.review_file }'>";
            panel += "</a>";
            panel += "<div style='border: 0.5px solid #1fb7a6; height:130px; margin-top:20px; background-color: #fafafa;'>";
            panel += "<a href='./read.do?category_no=${reviewVO.category_no }&review_no=${reviewVO.review_no}'>";
            panel += "<div style='font-weight:bold; color:#1fb7a6; margin-top:20px;'>${reviewVO.review_title }</div>";
            panel += "</a>";
            panel += "<div style=' margin-top:10px;'>";
            panel += "<a	 data-toggle='popover' data-full='./storage/${reviewVO.product_img }'><c:choose><c:when test='${fn:length(reviewVO.product_name) > 20}'><c:out value='${fn:substring(reviewVO.product_name,0,19)}'/>....";
            panel += "</c:when><c:otherwise><c:out value='${reviewVO.product_name}'/>";
            panel += "</c:otherwise></c:choose></a>";
            panel += "</div>";
            panel += "<div style='margin-top: 25px;'>";
            panel += "<img src='./images/good.png' style='width: 3%;  margin-right: 3px;'>${reviewVO.review_good }";
            panel += "<img src='./images/reply.png' style='width: 3%; margin-left:12px; margin-right: 3px;'>${reviewVO.review_reply_cnt }";
            panel += "<span class='event_rdate'>${fn:substring(reviewVO.review_rdate, 0, 10) }</span>";
            panel += "</div>";
            panel += "</div>";
            panel += "</div>";
            panel += "</c:forEach>";
          }
          }
          $('#tbody_panel').empty();
          $('#tbody_panel').append(panel);

        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
  				alert('pet_category error')
   
        }
      });
    }
  </script>
  <body class="fixed-header*">

	<div id="page-container">

		<c:import url="/menu/top2.jsp" />
		<section id="header-page" class="header-margin-base">
			<div class="skyline">
				<div data-offset="50" class="p1 parallax"></div>
				<div data-offset="25" class="p2 parallax"></div>
 				<span class="cover"></span>
				<div class="container header-text" style="margin-left:40%;">
         <div>
          <div><img style="border-radius: 50%; margin-left:10%; float:left; margin-right:20px; clear:both; width:7%;" src="./storage/${member_image }"></div>
					<div><h2 class="title" style="margin-left:9%; font-size:25px; margin-top:2px;">${member_nickname }</h2></div>
					<div style="margin-left:4%;">
            <c:forEach var="pet_specific" items="${pet_specific }">
              <h2 class="sub-title" style="font-size:15px; margin-right:5px;">${pet_specific.pet_specific }</h2>
            </c:forEach>
          </div>
				 </div>
        </div>   
			</div>
      <div class="topnav" style="border-bottom: 1px solid #DDD; ">
        <a id="all" class="active" onclick="javascript:pet_category(0,${member_no})" style="width:25%;">전체보기</a>
        <a id="dog" class="" onclick="javascript:pet_category(1,${member_no})" style="width:25%;">강아지</a>
        <a id="cat" onclick="javascript:pet_category(2,${member_no})" style="width:25%;">고양이</a>
        <a id="etc" onclick="javascript:pet_category(3,${member_no})" style="width:25%;">기타</a>
      </div>
			<span class="cover"></span>
		</section><!-- /#header -->

		<section id="agent-list">
			<div class="container">
				<div class="row" id="div_list">
         <c:forEach var="reviewVO" items="${member_review_list }">
          <div class="col-md-5" style="float:left; margin-left:7%;">
          <c:if test="${reviewVO.review_good >= 5 }">
            <div class="best_review">
                BEST
              <div class="best_review_triangle"></div>
            </div>
          </c:if>
             <a href="./read.do?category_no=${reviewVO.category_no }&review_no=${reviewVO.review_no}">
              <img style="float:left; margin-right:20px; margin-top:20px; clear:both; width:30%; height:130px;" src="./storage/${reviewVO.review_file }">
             </a>
            <div style="border: 0.5px solid #1fb7a6; height:130px; margin-top:20px; background-color: #fafafa;">
              <a href="./read.do?category_no=${reviewVO.category_no }&review_no=${reviewVO.review_no}">
                <div style="font-weight:bold; color:#1fb7a6; margin-top:20px;">${reviewVO.review_title }</div>
              </a>
              <div style=" margin-top:10px;">
              <a href="" data-toggle="popover" data-full="./storage/${reviewVO.product_img }">
               <c:choose>
                <c:when test="${fn:length(reviewVO.product_name) > 20}">
                <c:out value="${fn:substring(reviewVO.product_name,0,19)}"/>....
                </c:when>
                <c:otherwise>
                <c:out value="${reviewVO.product_name}"/>
                </c:otherwise> 
                </c:choose>
              </a>
              </div> 
              <div style="margin-top: 25px;">
                <img src='./images/good.png' style="width: 3%;  margin-right: 3px;">${reviewVO.review_good }
                <img src='./images/reply.png' style="width: 3%; margin-left:8px; margin-right: 3px;">${reviewVO.review_reply_cnt }
                <span class="event_rdate">${fn:substring(reviewVO.review_rdate, 0, 10) }</span>
              </div>
            </div>
          </div>
         </c:forEach>
        </div>
      </div> 
      <div class="container">
        <div class="row" >
        <TABLE>
          <tbody id='tbody_panel' data-nowPage='0' data-endPage='0'></tbody>
        </TABLE>
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

<c:import url="../menu/js/review_read_js.jsp" />


  </body>
</html>