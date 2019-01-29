<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>리뷰</title>

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
    <link rel="stylesheet" href="../css/review_reply.css">                              <!-- Media Query -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/css/swiper.min.css">


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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.6/js/swiper.min.js"></script>
  
  <script type="text/javascript">
  window.onload=function(){
    action_cancel();
    $('#frm_afterheart').hide();
    list();  // 모든 댓글 목록

    // rgood테이블에서 회원번호&리뷰번호 비교해서 있으면 빨간색으로(좋아요 체크) 칠하기
    like(${reviewVO.member_no});
    
    $("#text-message").keydown(function(){
      var numChar = $(this).val().length;
      var maxNum = 250;
      var charRemain = maxNum - numChar;
      $("span > em").text(charRemain);
      if(charRemain < 1){
        alert("250자 미만으로 입력해주세요!.");
        $('#text-message').val($('#text-message').val().substring(0,250));
        $(".submit").prop("disabled", true);
      } else {
        $(".submit").prop("disabled", false);
      }
    }); 
    
    
    $('[data-toggle="popover"]').popover({
      container: 'body',
      html: true,
      placement: 'auto',
      trigger: 'hover',
      content: function() {
        // get the url for the full size img
        var url = $(this).data('full');
        return '<input style="width:100px;" value="' + url + '">'
      }
    	});
  };
  

  function reply_update(review_reply_no){
    $('#panel_create').hide();
    $('#panel_update').show();

    $.ajax({
      url: "./reply_update.do", // 요청을 보낼주소
      type: "get",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'review_reply_no=' +review_reply_no,  
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
        var frm_update = $('#frm_update');
        $('#review_reply_no', frm_update).val(rdata.review_reply_no);         
        $('#text-message', frm_update).val(rdata.review_reply_content);         
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
				alert('reply_update error')
 
      }
    });
  }
  
  function reply_update_proc(){
    var frm_update = $('#frm_update');
    
    $.ajax({
      url: "./update_json.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'review_reply_content='+$('#text-message', frm_update).val()+'&review_reply_no='+$('#review_reply_no').val(),
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
      	 list();  // 전체 카테고리 목록
         
      	 action_cancel();
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        alert("reply_update_proc error")
      }
    });   
  }
  
  function reply_delete(review_reply_no){
    if (confirm("정말 삭제하시겠습니까?") == true){    //확인
      $.ajax({
        url: "./delete_json.do", // 요청을 보낼주소
        type: "post",  // or get
        cache: false,
        dataType: "json", // 응답 데이터 형식, or json
        data: 'review_reply_no='+review_reply_no,
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
       data: "review_no=" + ${param.review_no}, 
      // Ajax 통신 성공, JSP 정상 처리  
      success: function(rdata) { // callback 함수  
        var panel = '';
       // var like_check = ${like_check}; // 회원이 게시글에 좋아요를 눌렀다면 1 (빨간색)

       for(index=0; index < rdata.length; index++) {
          panel += "<div id='comments'>";
          panel += "<div class='medialist'>";
          panel += "<div class='media' style='padding-left:3%'>";
          panel += "<div class='media-left'>";
          panel += "<a href='#'>";
          panel += "<img style='float: left;' src='./storage/pet.jpg' alt='Image sample' />";
          panel += "</a>";
          panel += "<div class='media-body' style='padding-left:3%; padding-top:2%'>";
          panel += "<div class='comment-line' style='padding-bottom:5%;'>";
          panel += "<div class='media-heading'>";
          panel += rdata[index].review_reply_content;		
          panel += "<span class='date-comment'>"+rdata[index].review_reply_rdate+"</span>";
          panel += "</div>";
          panel += "<i class='icon fa fa-pencil' style='float:right; margin-right:2%;' onclick='javascript:reply_update("+rdata[index].review_reply_no+");'></i><i class='fa fa-trash-o' style='float:right; padding-right:2%;' onclick='javascript:reply_delete("+rdata[index].review_reply_no+");'></i></div>";
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
				alert("error!!!")
      } 
    }); 
  }
   
   
  function create(){
    $.ajax({
      url: "./create_json.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'review_no=' +${param.review_no}+'&member_no='+$('#member_no').val()+'&review_reply_content='+$('#text-message').val(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
     	  list();  // 전체 카테고리 목록
         
        $('#text-message').val(''); 
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        alert("create error")
      }
    });  
      
  }
  
  function action_cancel() {
    $('#panel_update').hide();
    $('#panel_create').show();

    $('#frm_create')[0].reset(); // id가 frm_create인 첫번째폼을 reset
  } 
  
  function like(member_no){
   var like_check = ${like_check};
		if(like_check==1){		// 좋아요
		  document.beforeheart.src="../menu/images/afterheart.png";
		  like_check=0;
		} else {	// None
		  document.beforeheart.src="../menu/images/beforeheart.png";
		  like_check=1;
		}
  } 
  
   function like_change(member_no, like_check){
    $.ajax({
       url: "./like_change.do", // 요청을 보낼주소
       type: "get",  // or get
       cache: false,
       dataType: "json", // 응답 데이터 형식, or json
       data: 'review_no=' +${param.review_no},
       // Ajax 통신 성공, JSP 정상 처리 
       success: function(rdata) { // callback 함수
         var review_rgood_cnt = rdata.review_rgood_cnt;
       $('.review_rgood_cnt').text(review_rgood_cnt);
 					var like_check = rdata.like_check;      // 성공시 1
					if(like_check==0){	// 흰색 -> 빨강
					  document.beforeheart.src="../menu/images/afterheart.png";
					} else {	// 빨강 -> 흰색
					  document.beforeheart.src="../menu/images/beforeheart.png";
					} 
       		
       },
       // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
       error: function(request, status, error) { // callback 함수
         alert("like_check error");
       }
     });   
   }
    
   
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
  
  <style type="text/css">
  body .popover {
      max-width: 250px;
    }
/* 슬라이드 효과 css 시작*/
.swiper-container {
  height:420px;
  border:5px solid silver;
  border-radius:7px;
  box-shadow:0 0 20px #ccc inset;
}
.swiper-slide {
  text-align:center;
  display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
  align-items:center; /* 위아래 기준 중앙정렬 */
  justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
  box-shadow:0 0 5px #555;
  max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
  /* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}
/* 슬라이드 효과 css 끝*/
</style>

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
					<div><h1 class="title">리뷰</h1></div>
					<div><h2 class="sub-title">리뷰도 보고 댓글도 남겨보세요!</h2></div>
				</div>
			</div>
			<div id="breadcrumb">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a></li>
						<li><a href="#">리뷰</a></li>
						<li class="active"></li>
					</ol>
				</div>
			</div><!-- /#breadcrumb -->
			<span class="cover"></span>
		</section><!-- /#header -->

		<section id="agency" class="agency">

			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-2 agency-logo">
           <div style='text-align:center; margin-bottom:10px;'><button onclick="javascript:data_analysis(${reviewVO.product_no}, ${reviewVO.review_no });" class="btn btn-default btn-sm">상품 만족도 보기</button></div>
						<div class="logo">
              <a data-toggle='popover'  data-full='${review_memberVO.product_name }'>
							 <img src='./storage/${review_memberVO.product_img }' style='width:100%;' class="img-responsive" alt="logo Agency" />
              </a>
						</div><br>
            <div style='text-align:center'>
            <c:forEach begin='1' end='${review_memberVO.review_grade }'>
              <img src='../menu/images/star.png' style='width:15%;'>
            </c:forEach>
					  </div>
          </div>
          <input type="hidden" id= "member_no" name="member_no" value="${reviewVO.member_no }">
          <input type="hidden" id= "like_check" name="like_check" value="${like_check }">
					<div class="col-sm-9 col-md-7">
          <div class="section-title line-style no-margin">
						<h1 class="title">${review_memberVO.review_title }</h1>
            </div>
						<div class="description">
              ${review_memberVO.review_content }
						</div>
					</div>
         

					<div class="col-sm-12 col-md-3">
						<div class="row">
							<div class="col-sm-6 col-md-12">
								<!-- . Agent Box -->
								<div class="section-title line-style no-margin">
									<h3 class="title">반려동물 정보</h3>
								</div>
								<div class="agent-box-card grey">
									<div class="image-content">
										<div class="image image-fill">
											<img alt="Image Sample" src='./storage/${petVO.pet_image }' style='width:100%'>
										</div>						
									</div>
									<div class="info-agent"> 
										<span class="name">${petVO.pet_name} (${petVO.pet_age}살/${petVO.pet_gender }) </span> 
									  <div class="detail" style="text-align:center">
											<i class="fa fa-quote-left"></i> ${petVO.pet_kind } <i class="fa fa-quote-right"></i><br>
											<i class="fa fa-quote-left"></i> ${petVO.pet_weight }kg <i class="fa fa-quote-right"></i><br>
											<i class="fa fa-quote-left"></i> ${petVO.pet_specific } <i class="fa fa-quote-right"></i>
										</div> 
									</div>
								</div>				
							</div>
						</div>
					</div>
				</div>

       <div style='margin-left:45%; margin-top:8%;'>
          <img name="beforeheart" id="beforeheart" src="../menu/images/beforeheart.png"  onclick="like_change(${reviewVO.member_no},${like_check })">
       </div>
       <div class="review_rgood_cnt" style="text-align:center; margin-right:7%;" id="review_rgood_cnt" >${review_rgood_cnt }
       </div>
       
       <DIV id='panel_create' style='width: 80%; margin-left:10%; margin-top:8%' >
          <h3 class="title-form"><i class="icon fa fa-comment"></i> 댓글 </h3>
              <form class="form-large grey-color" action="./create.do" method="post" id="frm_create" name='frm_create'>
              <input type='hidden' value='2' id='member_no' name='member_no'>
                <div class="row">
                  <div class="col-md-12">
                    <label for="text-message">내용</label>
                    <textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"></textarea>
                  </div>
                </div>
                <button type="button" class="btn btn-default" onclick="create()">등록</button>
                <span style="float:right;"><em>250</em> / 250</span>
              </form> 
          </DIV>
          
         <DIV id='panel_update' style='width: 80%; margin-left:10%; margin-top:8%' >
          <h3 class="title-form"><i class="icon fa fa-comment"></i> 댓글</h3>
              <form class="form-large grey-color" action="./update.do" method="post" id="frm_update" name="frm_update">
              <input type='hidden' id='review_reply_no' name='review_reply_no'>
                <div class="row">
                  <div class="col-md-12">
                    <label for="text-message">내용</label>
                    <textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"></textarea>
                  </div>
                </div>
                <button type="button" class="btn btn-default"  onclick="reply_update_proc()">수정</button>
              </form> 
          </DIV>
          
          <TABLE style='width: 80%; margin-left:10%; ' >
             <tbody id='tbody_panel' data-nowPage='0' data-endPage='0'></tbody>
          </TABLE>
          
          <DIV style="margin-left:10%; padding-top:5%; font-size:20px;" class="section-title line-style no-margin">
            <a href="./member_review_list.do?member_no=${reviewVO.member_no }"><span style="font-weight:bold; color:#ff5400">${reviewVO.member_nickname }</span></a>님의 다른 리뷰
          </DIV>
          <div class="swiper-container" style="width:80%; height:190px;">
	           <div class="swiper-wrapper">
                <c:forEach var ="reviewVO"  items="${member_review_list }">
                  <div class="swiper-slide"><a href="./read.do?review_no=${reviewVO.review_no }&catgory_no=${reviewVO.category_no}"><img src="./storage/${reviewVO.review_file}"></a></div>
                </c:forEach>
	           </div>

          	<!-- 네비게이션 -->
          	<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
          	<div class="swiper-button-prev"></div><!-- 이전 버튼 -->

          	<!-- 페이징 -->
          	<div class="swiper-pagination"></div>
        </div>

<script>

new Swiper('.swiper-container', {

  slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
  spaceBetween : 30, // 슬라이드간 간격
  slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

  // 그룹수가 맞지 않을 경우 빈칸으로 메우기
  // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
  loopFillGroupWithBlank : true,

  loop : true, // 무한 반복

  autoplay : { // 자동 재생
		delay : 0, // 딜레이 0
	},
	speed : 4000, // 슬라이드 속도 4초
  pagination : { // 페이징
    el : '.swiper-pagination',
    clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
  },
  navigation : { // 네비게이션
    nextEl : '.swiper-button-next', // 다음 버튼 클래스명
    prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
  },
});

</script>


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