<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
String root = request.getContextPath();  // 절대 경로
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>러브펫</title>
    <style type="text/css">
.box-ads .description dt,
.box-ads .description dd {
  border-bottom: 1px solid #f7f7f7;
  height: 35px;
  padding: 5px 6px 3px;
  width: 35%;
  font-size: 14px;
}
.box-ads .description dt {
  background: url(../../images/icon-ads-grey.png) no-repeat scroll left center;
  float: left;
  font-weight: 400 !important;
}
.box-ads .description dt.status {
  background-position: left -35px;
}
.box-ads .description dt.bed {
  background-position: left -134px;
}
.box-ads .description dt.bath {
  background-position: left -164px;
}
.box-ads .description dd {
  background: url(../../images/separator.png) no-repeat scroll left center;
  float: right;
  width: 64%;
  padding-left: 18px;
}
.box-ads .description dd span {
  text-align: right;
  display: block;
  padding: 1px 6px;
  background-color: #FAFAFA;
  border: 1px solid #F0F0F0;
  -webkit-border-radius: 1px;
  -khtml-border-radius: 1px;
  -moz-border-radius: 1px;
  -o-border-radius: 1px;
  border-radius: 1px;
}
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
  </head>
  

  <body class="fixed-header">

  <div id="page-container">
    <c:import url="/menu/top.jsp" />
    
    
    <section id="welcome" style="margin-top: 120px; margin-bottom: 80px;">
     <img alt="welcome"  src='${pageContext.request.contextPath}/menu/images/main3.PNG'  style="width: 100%; height: 550px;">
    </section>
    
    <div style="text-align: center;">
    <b style="font-size: 35px;"><strong>나의 소중한 반려동물</strong></b> <br>
    <p style="font-size: 25px; font-weight: 400;">러브펫과 함께 최적의 사료 간식을 찾아보세요</p>
    </div>
    
    <div style="text-align: center; font-size: 20px; font-weight: 400; margin: 60px 0px 40px 0px">
    나를 위해 함께해주는 반려동물을 위한 <br>
    다양한 사료들과 간식 브랜드 까지
    </div>
    
<div class="gallery"  style="position: relative;">
  <div class="row"  style="margin: 70px 70px 30px 70px;">
  
     <div class="col-md-3">
        <img src='${pageContext.request.contextPath}/menu/images/diary.png'  alt="Sample images" class="img-responsive" style="border: 1px solid #d1d1d1;">
        <div style="text-align: center; margin-top: 5px;">
        <span style="font-size: 17px; font-weight: 600;">러브펫 다이어리</span> <br>
        <button class="btn btn-reverse  select-button" onclick="location.href='diary/list_paging.do?category_no=1'" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
      </div>
      
     <div class="col-md-3">
        <img src='${pageContext.request.contextPath}/menu/images/review.png'   alt="Sample images" class="img-responsive" style="border: 1px solid #d1d1d1;">
         <div style="text-align: center; margin-top: 5px;">
         <span style="font-size: 17px; font-weight: 600;">사료/간식 리뷰</span> <br>
        <button class="btn btn-reverse  select-button" onclick="location.href='review/list.do?category_no=1'" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
      </div>
      
      <div class="col-md-3">
         <img src='${pageContext.request.contextPath}/menu/images/event.png'  alt="Sample images" class="img-responsive" style="border: 1px solid #d1d1d1;">
        <div style="text-align: center; margin-top: 5px;">
        <span style="font-size: 17px; font-weight: 600;">러브펫 이벤트</span> <br>
        <button class="btn btn-reverse  select-button" onclick="location.href='event/list_event_paging.do'" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
       </div>
       
        <div class="col-md-3">
           <img src='${pageContext.request.contextPath}/menu/images/product.png'  alt="Sample images" class="img-responsive" style="border: 1px solid #d1d1d1;">
         <div style="text-align: center; margin-top: 5px;">
         <span style="font-size: 17px; font-weight: 600;">사료/간식 상품</span> <br>
        <button class="btn btn-reverse  select-button" onclick="location.href='product/list.do'" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
          margin-bottom: 5px;">자세히 알아보기 →</button></div>
        </div>
        
    </div>
<!--     <div style="height: 190px;width: 100%;background-color: #eaeaea;bottom: -30px;position: absolute;z-index: -1;">
    </div> -->
 </div>
    
  <div style="margin-top: 60px; margin-bottom: 15px; background-color: #f8f7f7;">
  <div style="padding: 30px;">
    <div style="text-align: center;font-size: 35px;font-weight: 400;">
      이달의 인기 상품
    </div>
    </div>
    <div class="gallery"  style="position: relative;">
  <div class="row"  style="margin: 30px 70px 30px 70px;">
    <c:forEach var="outproductVO" items="${listproduct}">
                                <div class="col-md-3">
                           <div class="box-ads box-grid">
                              <a class="hover-effect image image-fill" href="product/detail.do?prono=${outproductVO.product_no }" style="overflow: hidden; text-align:center; line-height: 100%;     background: white;">
                                 <span class="cover"></span>
                                 <img alt="Sample images" src="product/storage/${outproductVO.product_img }" class="" style="max-width: 100%; top: 0px;  max-height: 100%; left: 0px; vertical-align: middle;">
                              </a>
                              <span class="price">￦ ${outproductVO.product_price }</span>
                              <span class="address" style="background: white;"><i class="fa fa-map-marker"></i> ${outproductVO.product_name }</span>
                              <span class="description" style="background-color: #fff;">
                                            <dt class="bath">중량</dt><dd><span>${outproductVO.product_weight }</span></dd>
                                            <dt class="status">좋아요</dt><dd><span>${outproductVO.product_like } 개</span></dd>
                                        </span>
                              <dl class="detail">
                                            <dt class="bath">제조국</dt><dd><span>${outproductVO.country_name }</span></dd>
                                            <dt class="status">제조사</dt><dd><span>${outproductVO.manufacturer_name }</span></dd>
                                 <dt class="bed">타겟</dt><dd><span>${outproductVO.product_target }</span></dd>
                              </dl>
                              <div class="footer">
                              </div>
                           </div>
                        </div>
          </c:forEach>
    </div>
    </div>
    
  </div>
    
  <div>
   <div style="padding: 30px;">
    <div style="text-align: center; font-size: 35px; font-weight: 400; ">
    러브펫 리얼 리뷰
    </div>
    <div style="text-align: center; margin-top: 15px; font-size: 18px;">러브펫 이용자들의 리뷰를 확인해보세요!</div>
    </div>
    <div class="gallery"  style="position: relative;">
  <div class="row"  style=" margin: 30px 70px 30px 90px; padding-left:50px;">
    <c:forEach var="review_MemberVO" items="${list }">
               <div class="col-md-4" style="width:420px;">
                  <div class="box-ads box-home" style="padding-bottom: 0px;">
               <a class="hover-effect image image-fill" href="review/read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}">
                        <span class="cover"></span> 
                <c:choose>
                  <c:when test="${review_MemberVO.review_thumb != ''}">
                            <img alt="thumb" id='thumb'  style="width:100%; height:300px;" src='review/storage/${review_MemberVO.review_file }'>
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
                    <a href="review/read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><c:out value="${fn:substring(review_MemberVO.review_title,0,11)}"/>....</a>
                    <span style="float:right;">
                      <a href="review/update.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><img alt="update" src="review/images/update.png" title="수정"></a>
                      <a href="review/delete.do?review_no=${review_MemberVO.review_no }&category_no=${review_MemberVO.category_no}"><img alt="delete" src="review/images/delete.png" title="삭제" onclick="javascript:review_delete(${review_MemberVO.review_no})"></a>
                    </span>
                  </c:when>
                  <c:otherwise >
                    <a href="review/read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><c:out value="${review_MemberVO.review_title}"/></a>
                    <span style="float:right;">
                      <a href="review/update.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><img alt="update" src="review/images/update.png" title="수정"></a>
                      <a href="review/delete.do?review_no=${review_MemberVO.review_no }&category_no=${review_MemberVO.category_no}"><img alt="delete" src="review/images/delete.png" title="삭제" onclick="javascript:review_delete(${review_MemberVO.review_no})"></a>
                    </span>
                  </c:otherwise> 
                </c:choose>        
             </span>  
             <span>
             <img src="product/storage/${review_MemberVO.product_img }" style="width:20%;" onclick="javascript:data_analysis(${review_MemberVO.product_no}, ${review_MemberVO.review_no });">
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
                <img src='review/images/good.png' style="width: 8%; margin-right: 3px;">${review_MemberVO.review_good }
                <img src='review/images/reply.png' style="width: 8%; margin-right: 3px; margin-left:8px;">${review_MemberVO.review_reply_cnt }
              </span>
              <span class="event_rdate" >${fn:substring(review_MemberVO.review_rdate, 0, 10) }</span>
              
            </div><!-- /.box-home .box-ads -->  
          </div><!-- ./col-md-4 -->
          </c:forEach> 
          </div>
  </div>
  
  <div style="background-color:#1fb7a694; padding: 30px;">
  <div style="text-align: center;font-size: 35px;font-weight: 400;">
  러브펫 Q & A
  </div>
  <div style="text-align: center; margin-top: 15px; font-size: 18px;">
  궁금하신 사항이 있으면, 언제든지 문의해주세요! <br><br>
      <button class="btn btn-reverse  select-button" onclick="location.href='qna/qna_list.do?qnacategory_no=1'" style="color: #1fb7a6; font-size: 17px;    margin-top: 8px;
      margin-bottom: 5px;">문의하기 ▶</button>
    </div>
  </div> 

   <div style="padding: 30px;"> </div>
 
  
  
  
 </div> <!-- page end -->
 

    
    
     
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
 
 
  <script src="<%=root%>/resources/script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="<%=root%>/resources/script/jquery-ui.min.js"></script>   <!-- jQuery UI is a curated set of user interface interactions, effects, widgets, and themes -->
  <script src="<%=root%>/resources/script/bootstrap.min.js"></script>   <!-- Include all compiled plugins (below), or include individual files as needed -->

  <script src="<%=root%>/resources/script/vendor/mmenu/mmenu.min.all.js"></script>          <!-- Menu Responsive -->
  <script src="<%=root%>/resources/script/vendor/animation-wow/wow.min.js"></script>          <!-- Animate Script -->
  <script src="<%=root%>/resources/script/vendor/labelauty/labelauty.min.js"></script>          <!-- Checkbox Script -->
  <script src="<%=root%>/resources/script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
  <script src="<%=root%>/resources/script/vendor/images-fill/imagesloaded.min.js"></script>     <!-- Loaded image with ImageFill -->
  <%-- <script src="<%=root%>/resources/script/vendor/images-fill/imagefill.min.js"></script>          <!-- ImageFill Script --> --%>
  <script src="<%=root%>/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->
  <script src="<%=root%>/resources/script/vendor/carousel/responsiveCarousel.min.js"></script>    <!-- Carousel Script -->

  <script src="<%=root%>/resources/script/custom.js"></script>    <!-- Custom Script -->

  </body>
</html>