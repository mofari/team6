<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>리뷰 등록</title>        
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
    <script type="text/javascript">
        $(document).ready(function () {
					$('#frm_product_name_search').hide();
        });
        
        function product_select(product_name,product_no){
          $('#product_name').val(product_name);
          $('#product_no').val(product_no);
          $('#frm_product_name_search').hide();
          $('#tbody_panel').hide();

					// 상품명 재검색시 다시 jquery 호출
        }

        function product_name_search(){
          $('#frm_product_name_search').show();
					var product_name = $('#product_name').val();

					$.ajax({
			      url: "./product_name_search.do", // 요청을 보낼주소
			      type: "get",  // or get
			      cache: false,
			      data: "product_name=" + product_name, 
			      dataType: "json", // 응답 데이터 형식, or json
            success: function(rdata) { // callback 함수
              var panel = '';            
            
              for(index=0; index < rdata.length; index++) {                
                panel += "<TR>";
                panel += "<TD rowspan='2' style='width:8%; height:8%;'><img src='./storage/"+rdata[index].product_img+"' style='width:100%;'></TD>";
                panel += "<TD style='font-weight: bold; font-size:20px; ' onclick='javascript:product_select(\"" + rdata[index].product_name + "\",\"" + rdata[index].product_no + "\")'>"+rdata[index].product_name+"</TD>";
                panel += "</TR>";
                panel += "<TR>";
                panel += "<TD>"+rdata[index].product_price+"원</TD>";
                panel += "</TR>";
              }
              
              $('#tbody_panel').empty();
              $('#tbody_panel').append(panel);
            }
			    });
       }  
      
    </script>
    
    
  <link rel="stylesheet prefetch" href="../resources/css/vendor/dropzone/dropzone.css">        <!-- Dropzone Upload File -->
  <link rel="stylesheet" href="../resources/css/vendor/death/jquery.death.css">                <!-- edit text script -->
   
  <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
  <script type="text/JavaScript">
    window.onload=function(){
      CKEDITOR.replace('review_content');  // <TEXTAREA>태그 id 값
    };
  </script>

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
          <div><h1 class="title">${categoryVO.category_title} 리뷰 등록</h1></div>
          <div><h2 class="sub-title">반려동물의 사료 간식 리뷰를 남겨보세요!</h2></div>
        </div>
      </div>
      <div id="breadcrumb">
        <div class="container">
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="./list.do?category_no=${categoryVO.category_no} ">리뷰</a></li>
            <li class="active">${categoryVO.category_title }</li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->
    
<FORM name='frm' method='POST' action='./create.do'
               enctype="multipart/form-data" class="form-horizontal">
    <section id="new-property">
      <div class="container">
        <div class="row">
          <div class="col-sm-3 col-md-3" id="block-menu-content">
            <ul class="block-menu" data-spy="affix" data-offset-top="500" data-offset-bottom="400">
              <li><a class="faq-button active" href="#pet"><i class="icon fa fa-heartbeat"></i>반려동물 선택</a></li>
              <li><a class="faq-button" href="#basic"><i class="icon fa fa-check-square-o"></i>정보 입력</a></li>
              <li><a class="faq-button" href="#summary"><i class="icon fa fa-th-list"></i> 내용 입력</a></li>
              <li><a class="faq-button" href="#images"><i class="icon fa fa-picture-o"></i> 썸네일 등록</a></li>

            </ul>
          </div>
          <div class="col-sm-9 col-md-9">
            <div class="info-block" id="pet">
              <div class="section-title line-style no-margin">
                <h3 class="title">반려동물 선택</h3>
              </div>
              <div class="row">
                <div class="col-md-12 space-form">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">반려동물</div>
                  <select id="pet_no" name="pet_no" ><c:forEach var ="petVO"  items="${pet_list }"><option value="${petVO.pet_no }">${petVO.pet_name }</option></c:forEach></select>
                </div>
                </div>
            </div>
            
            <div class="info-block" id="basic" >
              <div class="section-title line-style no-margin" style="margin-top: 30px;">
                <h3 class="title">정보 입력</h3>
              </div>
              <div class="row">
                <div class="col-md-12 space-form">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">리뷰 제목</div>
                  <input id="review_title" class="form-control" type="text" placeholder="제목을 입력해주세요" name="review_title"  required>
                </div>  
                </div>
                <div class="row">
              <div class="col-md-12"  style="margin-top: 30px;">
                  <div class="ui-widget">
                       <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">
                          <label for="product_name">상품명</label>
                          <input type='hidden' name='product_no' id='product_no' value=''>
                          <input type='hidden' name='member_no' id='member_no' value='3'>
                          <input type='hidden' name='category_no' id='category_no' value='${param.category_no}'>
                        </div>
                        
                      <input id="product_name" class="form-control" type="text" placeholder="'어'를 입력해보세요" name="product_name" onkeyup="javascipt:product_name_search();" required>
                        <div id="frm_product_name_search" class="col-md-12" style="overflow:scroll; width:850px; height:200px; ">
                          <TABLE>
                            <tbody id='tbody_panel' data-nowPage='0' data-endPage='0'>
                            </tbody>
                          </TABLE>
                        </div>
                  </div>
              </div>
              </div>
              <div class="row">
              <div class="col-md-5"  style="margin-top: 30px;">
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">별점</div>
                  <input id="review_grade" class="form-control" type="number" name="review_grade"  value="" max='5' min='1' required>
              </div>
              </div>
            </div>
            
            <div class="info-block" id="summary">
              <div class="section-title line-style">
                <h3 class="title">내용 입력</h3>
              </div>
              <div class="row">
                <div class="col-md-12 " >
                <div style="font-size: 13px; margin-bottom: 6px; color: #1fb7a6;">내용</div>
                  <textarea name='review_content' id='review_content' rows='10' cols='70' ></textarea>
                </div>
            </div>
            <div class="info-block" id="images">
              <div class="section-title line-style">
                <h3 class="title">썸네일 등록</h3>
              </div>
               <input type="file" class="form-control input-lg" name='filesMF' id='filesMF' size='40' multiple="multiple"  required>
              <span class="text">
                <strong>썸네일</strong> 이미지를 등록해 주세요.<br />
              </span>
            </div>

            <!-- 작성정보 끝 -->
          </div>
          <div class="row">
          <div class="col-sm-12 col-md-8 text-right" style="margin-top: 30px;">
            <button class="btn btn-default signin-button" type="submit"><i class="fa fa-sign-in"></i> 등록</button>
          </div>
        </div>
          
        </div>
      </div>
      </div>
    </section>
    </FORM>

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
<c:import url="/menu/js/review_create_js.jsp" />
  </body>
</html>