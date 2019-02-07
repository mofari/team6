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
    action_cancel();
  
    list();  // 모든 댓글 목록
  };
  
  $(function() {
    $('#panel_create').show();
    $('#panel_update').hide();
  });
  
  function reply_update(diary_reply_no){
 //   alert(diary_reply_no);
    $('#panel_create').hide();
    $('#panel_update').show();
    $.ajax({ 
      url: "./reply_update.do", // 요청을 보낼주소
      type: "get",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'diary_reply_no=' +diary_reply_no,
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
         var frm_update = $('#frm_update');

         $('#diary_reply_no', frm_update).val(rdata.diary_reply_no);         
        $('#text-message', frm_update).val(rdata.diary_reply_content);      
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
				alert('reply_update error');
      }
    });
  }
  function diary_update_proc(){
    var frm_update = $('#frm_update');
    $.ajax({
      url: "./update_json.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'diary_reply_content='+$('#text-message', frm_update).val()+'&diary_reply_no='+$('#diary_reply_no').val(),
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
      	 list();  // 전체 카테고리 목록
      	 action_cancel();
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        alert("diary_update_proc error")
      }
    });   
  }
  
  function reply_delete(diary_reply_no){
    if (confirm("정말 삭제하시겠습니까?") == true){    //확인
      $.ajax({
        url: "./delete_json.do", // 요청을 보낼주소
        type: "post",  // or get
        cache: false,
        dataType: "json", // 응답 데이터 형식, or json
        data: 'diary_reply_no='+diary_reply_no,
        // Ajax 통신 성공, JSP 정상 처리
        success: function(rdata) { // callback 함수
        	 list();  // 전체 카테고리 목록
           
        	 action_cancel(); 
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          alert("reply_delete error")
        }
      });   
    }else{   //취소
        return;
    }
  }
  
  // 모든 댓글 목록
  function list() {
     $.ajax({
      url: "./list_json.do", // 요청을 보낼주소
      type: "get",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
       data: "diary_no=" + ${param.diary_no}, 
      // Ajax 통신 성공, JSP 정상 처리  
      success: function(rdata) { // callback 함수  
        //alert(" 리스트 확인");
        var panel = ''; 
               
        for(index=0; index < rdata.length; index++) {
         
          panel += "<div id='comments'>"; 
          panel += "<div class='medialist'>";
          panel += "<div class='media' style='padding-left:3%'>";
          panel += "<div class='media-left'>";
          panel += "<a href='#'>";
        //   panel += "<img style='float: left;' src='./storage/member.jpg' alt='Image sample' />";
        // panel += "<a>"+rdate[index].member_image+"</a>"; 
          panel += "<img style='float: left;' src='./storage/"+rdata[index].member_image+"' alt='Image sample' />";
          panel += "</a>";
          panel += "<div class='media-body' style='padding-left:3%; padding-top:2%'>";
          panel += "<div class='comment-line' style='padding-bottom:5%;'>";
          panel += "<div class='media-heading'>";
          panel += rdata[index].diary_reply_content;		
          panel += "<span class='date-comment'>"+(rdata[index].diary_reply_rdate).substring(2, 16)+"</span>";
          panel += "</div>";
          panel += "작성자 : "+rdata[index].member_nickname+"<i class='icon fa fa-pencil' style='float:right; margin-right:2%;' onclick='javascript:reply_update("+rdata[index].diary_reply_no+");'></i><i class='fa fa-trash-o' style='float:right; padding-right:2%;' onclick='javascript:reply_delete("+rdata[index].diary_reply_no+");'></i></div>";
          panel += "</div>";
          panel += "</div>";
          panel += "</div>";
          panel += "</div>";
          panel += "</div>";
          panel += "</div>";
        }
         
        $('#tbody_panel').empty();
        $('#tbody_panel').append(panel);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
				
      } 
    }); 
  }
    
   
  function create(){
    $.ajax({
      url: "./create_json.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json 
      data: 'diary_no=' +${param.diary_no}+'&member_no='+$('#member_no').val()+'&diary_reply_content='+$('#text-message').val(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
     	  list();  // 전체 카테고리 목록
         // alert("댓글 등록 성공");
     	   
        $('#text-message').val(''); 
        alert(diary_reply_content); 
      }, 
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        alert("create error")
      }
    });  
       
  }
  
  function like(member_no, like_check){
    $.ajax({
       url: "./like.do", // 요청을 보낼주소
       type: "get",  // or get
       cache: false,
       dataType: "json", // 응답 데이터 형식, or json
       data: 'diary_no=' +${param.diary_no},
       // Ajax 통신 성공, JSP 정상 처리 
       success: function(rdata) { // callback 함수
         var diary_like = rdata.diary_like;
       $('.diary_like').text(diary_like);
 					var like_check = rdata.like_check;      // 성공시 1
					if(like_check==0){	// 흰색 -> 빨강
					  document.heart.src="./images/like.png";
					} else {	// 빨강 -> 흰색
					  document.heart.src="./images/dislike.png";
					} 
       		 
       },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
       error: function(request, status, error) { // callback 함수
         alert("like_check error");
       }
     });   
   }
   
  function action_cancel() {
    $('#panel_update').hide();
    $('#panel_create').show();
    $('#frm_create')[0].reset(); // id가 frm_create인 첫번째폼을 reset
  } 
   /*  function like(member_no){
      var like_check =${like_check};
      if(like_check==1){
        document.heart.src="./images/like.png";
        like_check=0;
      } else{
        document.heart.src="./images/dislike.png";
        like_check=1;
      }
    }
    
 */

  /* $(function() {
    $('#heart').click(function() {
      var $this = $(this);
      if ($this.hasClass('highlighted')) {
        $this.removeClass('highlighted');
        $this.text('Like');
        $('#heart').prop("src","./images/like.png");
      } else {
        $this.addClass('highlighted');
        $("#heart").prop("src", "./images/dislike.png");
        $this.text('Unlike');
      }
    });
  }); */
  
/*   $(document).ready(function () {

    var heartval = ${heart};

    if(heartval>0) {
        console.log(heartval);
        $("#heart").prop("src", "./images/dislike.png");
        $(".heart").prop('name',heartval)
    }
    else {
        console.log(heartval);
        $("#heart").prop("src", "./images/like.png");
        $(".heart").prop('name',heartval)
    }

    $(".heart").on("click", function () {

        var that = $(".heart");

        var sendData = {'diary_no' : '${diaryVO.diary_no}','heart' : that.prop('name')};
        $.ajax({
            url :'/diary/heart',
            type :'POST',
            data : sendData, 
            success : function(data){
                that.prop('name',data);
                if(data==1) {
                    $('#heart').prop("src","./images/dislike.png");
                }
                else{
                    $('#heart').prop("src","./images/like.png");
                }


            }
        });
    });
}
) */
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
               <div class="section-title line-style no-margin" >
							<div class="text" style="">
                ${diaryVO.diary_rdate.substring(0, 10) }  ... ${diaryVO.diary_place } 에서
              </div>
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

    <!--   좋아요 -->

       <div style='margin-left:45%; margin-top:8%;'>
          <img name="heart" id="heart" src="./images/dislike.png"  onclick="like(${diaryVO.member_no},${like_check })">
       </div>
       <div class="diary_like" style="text-align:center; margin-right:7%;" id="diary_like" >${diary_like }
       </div>
      <!--  댓글 ajax 로 해야함  -->

    <!-- 	<DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #FFAAAA; width: 100%; text-align: center;'>
        <FORM name='frm_delete' id='frm_delete'>
          <input type='hidden' name='diary_reply_no' id='diary_reply_no' value=''>
          <input type='hidden' name='member_no' id='member_no' value='2'>
      
          <span id='category_title'></span> 댓글을 삭제하시겠습니까?
          삭제하면 복구 할 수 없습니다.
         <button type="button" id='submit' onclick="delete_submit()">삭제</button>
         <button type="button" onclick="action_cancel()">취소</button>
        </FORM>
       </DIV> -->
       
       
        <DIV id='panel_create' style='width: 80%; margin-left:10%; margin-top:8%' >
          <h3 class="title-form"><i class="icon fa fa-comment"></i> 댓글 </h3>
              <form class="form-large grey-color" action="./create.do" method="POST" id="frm_create" name='frm_create'>
              <input type='hidden' value='2' id='member_no' name='member_no'>
            <input type='hidden' value='${diaryReplyVO.diary_no }' id='diary_no' name='diary_no'>
              
               
                <div class="row">
                  <div class="col-md-12">
                    <label for="text-message">내용</label>
                    <textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"></textarea>
                  </div>
                </div>
                <button type="button" id='submit'   class="btn btn-default" onclick="create()">등록</button>
              </form> 
          </DIV>
          
         <DIV id='panel_update' style='width: 80%; margin-left:10%; margin-top:8%' >
          <h3 class="title-form"><i class="icon fa fa-comment"></i> 댓글</h3>
              <form class="form-large grey-color" id="frm_update" name="frm_update">
              <input type='hidden' id='diary_reply_no' name='diary_reply_no' value = '${param.diary_reply_no }'>
             
                <div class="row">
                  <div class="col-md-12">
                    <label for="text-message">내용</label>
                    <textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"></textarea>
                  </div>
                </div>
                <button type="button" id='submit'  name='submit' class="btn btn-default"  onclick="diary_update_proc()">수정</button>
              </form> 
          </DIV>
          
          
          
          <TABLE style='width: 80%; margin-left:10%; ' >
                <tbody id='tbody_panel' data-nowPage='0' data-endPage='0'></tbody>
              </TABLE>
					

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

       <div id = "other diary">
         
       </div>
		</section>

	
		

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