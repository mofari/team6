<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String root = request.getContextPath();  // 절대 경로
%>

<!DOCTYPE html>
<html lang="ko">

  <body class="fixed-header">
  <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/js.cookie-2.2.0.min.js"></script>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>




<script type="text/javascript">
$(function() {
  Cookies('checkID', 'FALSE'); // Cookie 생성
  $('#popup').hide();
});
function checkId(){
  var frm = $('#frm');
  var params = 'member_email='+$('#member_email', frm).val(); // #: id
  // alert('params: ' + params);
  
  $.ajax({
    url: "./checkId.do",
    type: "GET",
    cache: false,
    dataType: "json", // or html
    data: params,
    success: function(data){
      var msg = "";

      if (data.cnt > 0) {
        $('#modal_content').attr('class', 'alert alert-warning'); // Bootstrap
        msg = "이미 사용중인 ID 입니다.";
      } else {
        $('#modal_content').attr('class', 'alert alert-primary'); // Bootstrap
        msg = "사용 가능한 ID 입니다.";
        
        Cookies('checkID', 'TRUE'); // Cookie 값 변경
      }

      $('#modal_title').html('ID 중복 확인');
      $('#modal_content').html(msg);
      $('#modal_panel').modal(); // 다이얼로그 출력   
    },
    // 통신 에러, 요청 실패, 200 아닌 경우, dataType이 다른경우
    error: function (request, status, error){  
      var msg = "에러가 발생했습니다. <br><br>";
      msg += "다시 시도해주세요.<br><br>";
      msg += "request.status: " + request.status + "<br>";
      msg += "request.responseText: " + request.responseText + "<br>";
      msg += "status: " + status + "<br>";
      msg += "error: " + error;
 
      // var panel = "";
      // panel += "<DIV id='panel' class='popup1' style='height: 350px;'>";
      // panel += msg;
      // panel += "<br>[<A href=\"javascript: $('#main_panel').hide()\">CLOSE</A>]";
      // panel += "</DIV>";
      
      // $('#main_panel').html(panel);      
      // $('#main_panel').show();
          // id_span.html(msg);
      $('#modal_title').html('ID 중복 확인');
      $('#modal_content').attr('class', 'alert alert-warning');
      $('#modal_content').html(msg);
      $('#modal_panel').modal(); // 다이얼로그 출력   
    }
  });

}

function send() {
  var check = Cookies('checkID'); // 쿠키값
  
  if (check != 'TRUE') {
    var msg = "ID 중복확인이 되지 않았습니다.<br>";
    msg += "중복확인 후 시도해 주세요.<br>";

    $('#modal_title').html('ID 체크 확인');
    $('#modal_content').attr('class', 'alert alert-warning');
    $('#modal_content').html(msg);
    $('#modal_panel').modal(); // 다이얼로그 출력   
    
    return false; // submit 중지
  }
  
  if ($('#member_passwd').val() != $('#member_passwd_sign').val()) {
    var msg = "입력된 패스워드가 일치하지 않습니다.<br>";
    msg += "패스워드를 다시 입력해주세요.<br>";

    $('#modal_title').html('패스워드 일치여부 확인');
    $('#modal_content').attr('class', 'alert alert-warning');
    $('#modal_content').html(msg);
    $('#modal_panel').modal(); // 다이얼로그 출력   
    
    return false; // submit 중지
  }
  
  return true; // submit 진행
}

</script>

 <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal END -->
  
  <div id="page-container">
    <c:import url="/menu/top.jsp" />


		<section id="header-page" class="header-margin-base">
			<div class="skyline">
				<div data-offset="50" class="p1 parallax"></div>
				<div data-offset="25" class="p2 parallax"></div>
				<div data-offset="15" class="p3 parallax"></div>
				<div data-offset="8"  class="p4 parallax"></div>
				<span class="cover"></span>
				<div class="container header-text">
					<div><h1 class="title">회원가입</h1></div>
					<div><h2 class="sub-title">Love Pet에 오신 걸 환영합니다 !</h2></div>
				</div>
			</div>
			<div id="breadcrumb">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a></li>
						<li><a href="#">Pages</a></li>
						<li class="active">Sign-in</li>
					</ol>
				</div>
			</div><!-- /#breadcrumb -->
			<span class="cover"></span>
		</section><!-- /#header -->

		<section id="signin-page">

			<div class="container">
				<div class="row">
					<div class="col-sm-7 col-sm-push-5 col-md-8 col-md-push-4">
						<div class="text-desclaimer">
						</div>
					</div>
		     <FORM name='frm' id='frm' method='POST' action='./create.do' 
              onsubmit="return send();" class="form-horizontal">
            <div id="sign-in" class="box">
              <h2 class="title">회원가입</h2>
              <div class="form-inline">
                <div class="form-group">
                  <input type='text' class="form-control input-inline margin-right" name='member_name' id='member_name' 
                   required="required" placeholder="유저 이름">
                  <i class="fa fa-user user"></i>
                </div>                     
                        
              </div>
              
                <div class="form-group">
                  <input type='text'   required="required" class="form-control" name='member_nickname' id='member_nickname' placeholder="닉네임" >
                  <i class="fa fa-user user"></i>       
                </div>
              
              <div class="form-group">
                  <input type='text'   required="required" class="form-control" name='member_email' id='member_email' placeholder="이메일" >
                  <i class="fa fa-envelope-o"></i>       
                </div>
                
                
                <button type='button' onclick="checkId()" class="btn btn-default button-form">중복확인</button>
                  <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 --> 
                
              <div class="field">
                <input id="member_passwd" required="required"  class="form-control" type="password" name="member_passwd" placeholder="비밀번호">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field">
                <input id="member_passwd_sign" required="required"  class="form-control" type="password" name="member_passwd_sign" placeholder="비밀번호 재확인">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              
             
              <div class="field">
              <input type='text'  required="required"  class="form-control input-md" name='member_tel' id='member_tel' 
                  required="required" placeholder="전화번호">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="form-group">
                <input id="member_zipcode" required="required"  class="form-control" type="text" name="member_zipcode" placeholder="우편번호">
                <i class="fa fa-ellipsis-h"></i>
                </div>
                <div>
                <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-default button-form">
                </div>
              <div class="field">
                <input id="member_address" required="required"  class="form-control" type="text" name="member_address" placeholder="주소">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field">
                <input id="member_address2" required="required"  class="form-control" type="text" name="member_address2" placeholder="상세주소">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              
              <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

//우편번호 찾기 화면을 넣을 element
  function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_zipcode').value = data.zonecode;
                document.getElementById("member_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_address2").focus();
            }
        }).open();
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
               <input id="act_no" type=hidden name="act_no" value="2" >
               <input id="member_logintype" type=hidden name="member_logintype" value="M" >
               <input id="visible" type=hidden name="visible" value="Y" >


              <div class="field footer-form text-right">
                <button type="submit" class="btn btn-default button-form">가입</button>
                <button type="button" onclick="location.href='../index.jsp'" class="btn btn-default button-form">취소</button>
              </div>
            </div>
            </form>
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
							<h2 class="title">회원가입</h2>
							<h3 class="sub-title">Love Pet에 오신 걸 환영합니다 ! </h3>
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
							<h3 class="sub-title">Enter your email address, and weâll email you instructions to reset your password.</h3>
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


  </body>
</html>