<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/JavaScript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="http://malsup.github.com/jquery.form.js"></script> 
<script type="text/javascript">

$(document).ready(function() {
  var frm2 = $('#frm2');
  frm2.ajaxForm(send_response); // 응답 처리 함수 등록, ajax 지원 기능 등록
});

function uploadfile() {
  $('#frm2').submit();
}

function send_response(data, state){
  var jsondata = JSON.parse(data);
  var fileimgname = jsondata.imgname;
  $('#image').attr('src', '/review/manufacturer/storage/'+fileimgname);
}
</script>
</head>
<body class="fixed-header">
<div id="page-container">
<jsp:include page="/menu/top.jsp" flush='false' />
<section id="home-slide" class="header-margin-dual-line">
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3 form-container">
            <h3 class="title">제조사 수정</h3>
            <form method="post" id="frm" name="frm" action="update.do" class="form-large" role="form" data-toggle="validator" enctype='multipart/form-data'>
            <input type="hidden" id="manno" name="manno" value="${manufacturerVO.manufacturer_no }">
              <div class="row">
                <div class="col-md-12">
                  <label for="name">Name</label>
                  <input type="text" class="margin-bottom form-control" id="name" name="name" placeholder="제조사명" value="${manufacturerVO.manufacturer_name }" required>
                </div>
                <div class="col-md-12">
                  <label for="email">Phone Number</label>
                  <input type="text" class="margin-bottom form-control" id="callnumber" name="callnumber" placeholder="전화번호 ex)02-1234-5678" value="${manufacturerVO.manufacturer_callnumber }" required>
                </div>
                <div class="col-md-12">
                  <label for="subject">Address</label>
                  <input type="text" class="margin-bottom form-control" id="zipcode" name="zipcode" placeholder="주소" value="${manufacturerVO.manufacturer_zipcode }" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Webpage</label>
                  <input type="text" class="margin-bottom form-control" id="webpageurl" name="webpageurl" placeholder="URL" value="${manufacturerVO.manufacturer_webpageurl }" required>
                </div>
                </div>
              </form>
              <div class="row">
                <div class="col-md-12 margin-bottom">
                   <label for="text-message">Logo Image</label><br>
                   <div class="col-sm-3 col-md-2" id="edit-image">
                     <!-- avatar -->
                   <a onclick="alert('이미지 변경 즉시 적용됩니다');document.getElementById('img').click();" class="avatar image-fill" style="overflow: hidden; position: relative; width: 165px; height: auto;">
                   <c:choose>
                   <c:when test="${manufacturerVO.manufacturer_img eq 'default-user-image.png' }">
                   <img src="${pageContext.request.contextPath}/resources/images/${manufacturerVO.manufacturer_img }" id="image" name="image" style="width: 100%; height: auto; top: -6.5px; left: 0px;">
                   </c:when>
                   <c:otherwise>
                   <img src="${pageContext.request.contextPath}/manufacturer/storage/${manufacturerVO.manufacturer_img }" id="image" name="image" style="width: 100%; height: auto; top: -6.5px; left: 0px;">
                   </c:otherwise>
                   </c:choose>
                     </a>
                   </div>
                   <form name="frm2" id="frm2" action="./updateimg.do" method="post" enctype="multipart/form-data" >
                     <input type="hidden" id="manno" name="manno" value="${manufacturerVO.manufacturer_no }">
                     <input style="display: none;" type="file" class="margin-bottom form-control" id="img" name="img" placeholder="로고" onchange="uploadfile()" accept=".jpg, .png, .jpeg, .gif"> 
                     <div id="a"></div>
                   </form>
                </div>
              </div>
              <br>
              <div style="text-align: right;">
              <button id="submit" name="submit" type="button" class="btn btn-default" onclick="document.getElementById('frm').submit();">수정</button>
              <button id="back" name="back" type="button" class="btn btn-default" onclick="location.href='./list.do'">취소</button>
              </div>
          </div><!-- /.form-container -->

          <div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9 hidden-xs">
            <div class="info-container">
              <h1>Update<br>Manufacturer</h1>
              <span class="clear-fix"></span>
            </div><!-- /.info-container -->
          </div><!-- ./col-sm-4 -->

        </div>
      </div>
    </section>
    </section>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- page-container END -->

  <script src="${pageContext.request.contextPath}/resources/script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="${pageContext.request.contextPath}/resources/script/jquery-ui.min.js"></script>   <!-- jQuery UI is a curated set of user interface interactions, effects, widgets, and themes -->
  <script src="${pageContext.request.contextPath}/resources/script/bootstrap.min.js"></script>   <!-- Include all compiled plugins (below), or include individual files as needed -->

  <script src="${pageContext.request.contextPath}/resources/script/vendor/mmenu/mmenu.min.all.js"></script>          <!-- Menu Responsive -->
  <script src="${pageContext.request.contextPath}/resources/script/vendor/animation-wow/wow.min.js"></script>          <!-- Animate Script -->
  <script src="${pageContext.request.contextPath}/resources/script/vendor/labelauty/labelauty.min.js"></script>          <!-- Checkbox Script -->
  <script src="${pageContext.request.contextPath}/resources/script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
  <script src="${pageContext.request.contextPath}/resources/script/vendor/images-fill/imagesloaded.min.js"></script>     <!-- Loaded image with ImageFill -->
<!--    <script src="${pageContext.request.contextPath}/resources/script/vendor/images-fill/imagefill.min.js"></script> -->         <!-- ImageFill Script -->
  <script src="${pageContext.request.contextPath}/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->

<!--  <script src="${pageContext.request.contextPath}/resources/script/custom.js"></script> -->                   <!-- Custom Script -->


<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="http://malsup.github.com/jquery.form.js"></script> 

</body>
</html> 