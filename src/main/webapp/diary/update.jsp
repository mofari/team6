<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title></title>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
<script src="script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->
<script src="script/modernizr.min.js"></script> <!-- Modernizr -->

<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('diary_content');  // <TEXTAREA>태그 id 값
  };
  </script>
  </head>
  <body class="fixed-header*">
  <jsp:include page="/menu/top2.jsp" flush='false' />
 
	<div id="page-container">
		
		<section id="header-page" class="header-margin-base">
			<div class="skyline">
				<div data-offset="50" class="p1 parallax"></div>
				<div data-offset="25" class="p2 parallax"></div>
				<div data-offset="15" class="p3 parallax"></div>
				<div data-offset="8"  class="p4 parallax"></div>
				<span class="cover"></span>
				<div class="container header-text">
					<div><h1 class="title">${categoryVO.category_title } 다이어리♥</h1></div>
					<div><h2 class="sub-title">자신의 ${categoryVO.category_title }를 자랑해보아요~  </h2></div>
				</div>
			</div>
			<div id="breadcrumb">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a></li>
						<li><a href="#">Diary</a></li>
						<li class="active">${categoryVO.category_title }</li>
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
							<li><a class="faq-button active" href="#basic"><i class="icon fa fa-check-square-o"></i>반려동물 등록</a></li>
							<li><a class="faq-button" href="#summary"><i class="icon fa fa-th-list"></i> 기본정보 등록</a></li>
							<li><a class="faq-button" href="#images"><i class="icon fa fa-picture-o"></i> 썸네일 등록</a></li>
						</ul>
					</div>
          
					<div class="col-sm-9 col-md-9">
          <FORM name='frm' method='POST' action='./update.do'
               enctype="multipart/form-data" class="form-horizontal">
               
         
      <input type='hidden' name='category_no' id='category_no' value=' ${categoryVO.category_no }'>
      <input type='hidden' name='diary_no' id='diary_no' value=' ${diaryVO.diary_no }'>
      <%-- <input type='hidden' name='nowPage' id='nowPage' value=' ${param.nowPage }'>  --%>

						<div class="info-block" id="basic">
							<div class="section-title line-style no-margin">
								<h3 class="title">반려동물 정보    ${categoryVO.category_no }</h3>
      
							</div>
                 <div class="form-group" style="width:100%;">
                <div class="col-md-11">
                  <select id="pet_no" name="pet_no" >
                    <c:forEach var ="petVO"  items="${pet_list}" varStatus='status' >
                    <option value="${petVO.pet_no }"   >${petVO.pet_name }        </option>
                    </c:forEach>
                  </select> 
                  </div>
                </div>  
					
						</div>
		<div class="info-block" id="summary" style="margin-top : 30px;">
      <div class="section-title line-style no-margin">
         <h3 class="title">기본 정보 등록</h3>
      </div>
    <div class= "row" >
			<div class="form-group" style="margin:0px ;">    
        <label for="diary_title" class="col-md-1 control-label" ></label>
        <div class="col-md-11" style="margin-top : 20px; width:95%;">
          <input type='text' class="form-control input-lg" name='diary_title' id='diary_title' value='${diaryVO.diary_title }'  placeholder="제목" required="required" style='width: 100%;'>
        </div>
        
        <label for="content" class="col-md-1 control-label"></label>
        <div class="col-md-11"  style="margin-top : 20px; width:95%;">
          <input type='text' class="form-control input-lg" name='diary_place' id='diary_place' value=' ${diaryVO.diary_place }' placeholder="장소">
        </div>
     
      </div>    
      <div class="form-group">   
        <label for="content" class="col-md-1 control-label"></label>
        <div class="col-md-11"  style="margin-top : 20px; width:95%;">
          <textarea class="form-control input-lg" name='diary_content' id='diary_content'  rows='10' >${diaryVO.diary_content}</textarea>
       
        </div>
      </div> 
      
		</div>
				<!-- 썸네일 등록 -->
        <div id='file1Panel' class="form-group">
        <label class="col-md-1 control-label"></label>
        <div class="col-md-11">
          <!-- 파일명을 소문자로 변경 -->
          <c:set var='diary_file' value="${fn:toLowerCase(diaryVO.diary_file)}" />
          <!-- 소문자로 변경된 파일명이 이미지인지 검사 -->
          <c:choose>
            <c:when test="${fn:endsWith(diary_file, '.jpg')}">
              <IMG id='diary_file' src='./storage/${diaryVO.diary_file}' style='width: 20%;'>
            </c:when>
            <c:when test="${fn:endsWith(diary_file, '.gif')}">
              <IMG id='diary_file'  src='./storage/${diaryVO.diary_file}' style='width: 20%;'>
            </c:when>
            <c:when test="${fn:endsWith(diary_file, '.png')}">
              <IMG id='diary_file'  src='./storage/${diaryVO.diary_file}' style='width: 20%;'>
            </c:when>
            <c:when test="${diaryVO.diary_file.length() > 0}">
              ${diaryVO.diary_file }  <!-- 이미지가 아니면서 파일이 존재하는 경우 파일명 출력 -->
            </c:when>
          </c:choose>
        </div>
      </div>
      <div class="form-group">   
        <label for="file1MF" class="col-md-1 control-label" style="marigin:0px;"></label>
        <div class="col-md-11" style="width:95%;">
          <input type="file" class="form-control input-lg" 
               name='file1MF' id='file1MF' size='40' >
          <br>
          이전 썸네일 : ${diaryVO.diary_thumb } 이미지는 자동 생성됩니다.  
        </div>
      </div>  
      </div> 
      
     
       <DIV style='text-align: right;'>
        <button class="btn btn-default signin-button"  type="submit">
        <i class="fa fa-sign-in"></i>변경된 내용 저장</button>
        <button class="btn btn-default signout-button" type="button" 
        onclick="location.href='./list_paging.do?category_no=${categoryVO.category_no}'">
        <i class="fa fa-sign-out"></i>취소[목록]</button> 
      </DIV>
      </FORM>
					</div>
				</div>
			</div>
		</section>

		 <jsp:include page="/menu/bottom.jsp" flush='false' />

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


	<script	src="script/jquery.min.js"></script>		<!-- jQuery	(necessary for Bootstrap's JavaScript plugins) -->
	<script	src="script/jquery-ui.min.js"></script>		<!-- jQuery	UI is a	curated	set	of user	interface interactions,	effects, widgets, and themes -->
	<script	src="script/bootstrap.min.js"></script>		<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script	src="script/vendor/mmenu/mmenu.min.all.js"></script>					<!-- Menu Responsive -->
	<script	src="script/vendor/animation-wow/wow.min.js"></script>					<!-- Animate Script	-->
	<script src="script/vendor/labelauty/labelauty.min.js"></script>					<!-- Checkbox Script -->
	<script	src="script/vendor/parallax/parallax.min.js"></script>						<!-- Parallax Script -->
	<script	src="script/vendor/images-fill/imagesloaded.min.js"></script>			<!-- Loaded	image with ImageFill -->
	<script src="script/vendor/images-fill/imagefill.min.js"></script>					<!-- ImageFill Script -->
	<script	src="script/vendor/easydropdown/jquery.easydropdown.min.js"></script>	<!-- Select	list Script	-->
	<script src="script/vendor/death/death.min.js"></script>							<!-- Edit Textarea -->
	<script	src="script/vendor/noui-slider/nouislider.all.min.js"></script>				<!-- Range Slider -->
	<script	src="http://maps.google.com/maps/api/js?sensor=false"></script>			<!-- Google Map -->
	<script	src="script/vendor/dropzone/dropzone.min.js"></script>					<!-- Dropzone Upload Image Script -->
	<script	src="script/vendor/dropzone/custom.js"></script>						<!-- Dropzone custom Script -->

	<script	src="script/custom.js"></script>		<!-- Custom	Script -->

	<script>

		// MAPS GOOGLE
		function initialize() {
		  var mapOptions = {
			scrollwheel: false,
			zoom: 18,
			center: new google.maps.LatLng(-33.890542, 151.274856)
		  }
		  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
		  var myLatLng = new google.maps.LatLng(-33.890542, 151.274856);
		  var marker = new google.maps.Marker({
			  position: myLatLng,
			  map: map,
			  icon: 'images/maps/pin-drag.png',
			  draggable: true
		  });
			google.maps.event.addListener(marker, 'drag', function(event) {
				$('#position').text('Position: ' + event.latLng.lat() + ' , ' + event.latLng.lng() );
			});
			google.maps.event.addListener(marker, 'dragend', function(event) {
				$('#position').text('Position: ' + event.latLng.lat() + ' , ' + event.latLng.lng() );
			});
		}
		google.maps.event.addDomListener(window, 'load', initialize);

		// TEXT EDITOR INITIALIZATION
		$('#description').editor();

	</script>

  </body>
</html>