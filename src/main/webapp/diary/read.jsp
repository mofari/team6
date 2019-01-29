<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
  <meta charset="UTF-8">
    <title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
window.onload=function(){
  CKEDITOR.replace('diary_content');  // <TEXTAREA>태그 id 값
};
</script>

  </head>
  <body>
<jsp:include page="/menu/top.jsp" flush='false' />
	<div id="page-container">
		

			<a href="#" class="fixed-button top"><i class="fa fa-chevron-up"></i></a>
			<a href="#" class="hidden-xs fixed-button email" data-toggle="modal" data-target="#modal-contact" data-section="modal-contact"><i class="fa fa-envelope-o"></i></a>

		<section id="header-page" class="header-margin-base">
			<div class="skyline">
				<div data-offset="50" class="p1 parallax"></div>
				<div data-offset="25" class="p2 parallax"></div>
				<div data-offset="15" class="p3 parallax"></div>
				<div data-offset="8"  class="p4 parallax"></div>
				<span class="cover"></span>
				<div class="container header-text">
					<div><h1 class="title">${categoryVO.category_title } 다이어리</h1></div>
					<div><h2 class="sub-title">서로의 펫 다이어리를 보고 공감해보세요</h2></div>
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

		<section id="blog">

			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-9">
						<div class="blog-list blog-detail">
             <FORM name= 'frm' method="get" action='./update.do'> 
							<div class="section-title line-style no-margin" >
              <h3 class="title">목록</h3>
            </div>
            <%-- <span>
             <a href='./update.do?diary_no=${diaryVO.diary_no }&nowPage=${param.nowPage }'>수정</a>
            </span> --%>
							<div class="social">
								<span class="date"><span>${diaryVO.diary_no }</span></span>
								<a href="#"><i class="fa fa-heart-o"></i><span>${diaryVO.diary_like }</span></a>
								<a href="#"><i class="fa fa-eye"></i><span>${diaryVO.diary_cnt }</span></a>
								<a href="#"><i class="fa fa-comments"></i><span>${diaryVO.diary_rcnt }</span></a>
							</div>
              
							 <div class="image">
              <c:choose>
                <c:when test="${diaryVO.diary_file != ''}">
                  <IMG  src='./storage/${diaryVO.diary_file }'  style="width: 100%;height: 100%;"> 
                </c:when>
                <c:otherwise>
                   
                  <IMG src='./images/none1.png' style='width: 100%; height: 100%;'>
                </c:otherwise>
              </c:choose>
              </div>
              <!-- <a class=
              "image image-fill" href="blog-detail.html">
                <img alt="Image Sample" src="http://placehold.it/1280x680/bbbbbb/ffffff">
              </a>/.image -->
              
							<h3 class="subtitle">${diaryVO.diary_title }.</h3>
							<div class="text" style="">
                ${diaryVO.diary_rdate.substring(0, 10) }  ... ${diaryVO.diary_place } 에서
              </div>
              <div class="text">
								${diaryVO.diary_content }
							</div>
              
            </FORM> 
            <input type="button" class="button-read button-read btn btn-default" value="수정"  
             onclick="location.href='./update.do?diary_no=${diaryVO.diary_no }&nowPage=${param.nowPage }'">  
            <input type="button" class="button-read button-read btn btn-default" value="삭제"
             onclick="location.href='./delete.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}&nowPage=${param.nowPage}'" >  
						</div><!-- /.blog-list --> 


              <!--  댓글 ajax 로 해야함  -->
						<div id="comments"> 
							<h2 class="title-comment"> <span class="total-comment">댓글</span></h2>
							<div class="medialist">
												
								<div class="media">
									<div class="media-left">
										<a href="#">
											<img class="media-object" src='./images/none1.png'   />
										</a>
									</div>
									<div class="media-body">
										<div class="comment-line">
											<h4 class="media-heading">
												Margaret Smith
												<span class="date-comment">4 February at 16:52</span> 
												<button class="reply"><i class="fa fa-share-square-o"></i></button>
											</h4>
											Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.							
										</div>
									</div>
								</div>
							</div>
              
							<h3 class="title-form"><i class="icon fa fa-comment"></i> 댓글 쓰기 </h3>
							<form class="form-large grey-color" action="#" method="post">
								<div class="row">
									<div class="col-md-6 col-sm-6 col-xs-12">
										<label for="name">Name</label>
										<input type="text" placeholder="Name .." name="name" id="name" class="margin-bottom form-control">
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<label for="email">Email</label>
										<input type="text" placeholder="Email .." name="email" id="email" class="margin-bottom form-control">
									</div>
									<div class="col-md-12">
										<label for="text-message">Message</label>
										<textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"></textarea>
									</div>
								</div>
								<input type="submit" class="btn btn-default" value="Send Comment">
							</form>			
						</div><!-- /. end-comment -->

					</div>
					<div class="col-sm-4 col-md-3">
						<c:forEach var="petVO"  items="${pet_list }">
						<div class="section-title line-style">
							<h3 class="title">반려동물 정보  </h3>
						</div >
                 <!-- 반려동물 정보   -->
						<div class="recent-post">
							<a class="image image-fill" href="blog-detail.html">
								<img id='pet_image' alt="Image Sample" src='./storage/${petVO.pet_image }' >
							</a><!-- /.image -->
							<div class="body">
              
								<span class="title">${petVO.pet_name } ${petVO.pet_age } 살 (${petVO.pet_gender })</span>
								<span class="date">${petVO.pet_kind}  ${petVO.pet_weight }kg</span>
								<div class="text">
									<p>${petVO.pet_specific }</p>
								</div><!-- /.text -->
								<input type="submit" class="button-read button-read btn btn-default" value="Read now" name="submit" id="submit">	
							</div><!-- /.body -->
						</div><!-- recent-post -->

				</c:forEach>
					</div>
				</div>
			</div>

		</section>

		
			<div class="">
				
        
        
			</div>
			
		

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
<jsp:include page="/menu/bottom.jsp" flush='false' />
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

	<script	src="script/custom.js"></script>		<!-- Custom	Script -->

  </body>
</html>