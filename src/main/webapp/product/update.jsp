<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  var frm2 = $('#frm2');
  var frm3 = $('#frm3');
  frm2.ajaxForm(send_response); // 응답 처리 함수 등록, ajax 지원 기능 등록
  frm3.ajaxForm(send_response2); // 응답 처리 함수 등록, ajax 지원 기능 등록
});

function uploadfile() {
  $('#frm2').submit();
}

function send_response(data, state){
  var jsondata = JSON.parse(data);
  var fileimgname = jsondata.imgname;
  $("#img").val(fileimgname);
}

function uploadfile2() {
  $('#frm3').submit();
}

function send_response2(data, state){
  var jsondata = JSON.parse(data);
  var fileimgname = jsondata.imgname;
  $("#introimg").val(fileimgname);
}

function submit_a(){
  $("#frma").submit();
}

function selcate1(){
  var params = "categoryno="+$("#category1 option:selected").val();
  $.ajax({
    url: "./selcate.do",
    type: "post", // or get
    cache: false,
    async: true, // true: 비동기
    dataType: "json", // 응답 형식, html, xml...
    data: params,  // 보내는 데이터
    success: function(rdata) {
      $("#category2").empty();
      var str ='<option value="">카테고리2 선택</option>';
          for(var i = 0; i < rdata.length; i++){
            str += '<option value="'+rdata[i].categoryno+'">'+rdata[i].categorytitle+'</option>';
      }
  	    $("#category2").append(str);
  	    $("#category2").easyDropDown ( 'destroy' );
  	  	var $selects = $('#category2');
				
  	  	$selects.easyDropDown({
  	  		cutOff: 10,
  	  		wrapperClass: 'dropdown'
  	  	});
  	  	if(rdata.length==0){
  	  	  selcate2();
  	  	}
  	    }
    });
}

function selcate2(){
  var params = "categoryno="+$("#category2 option:selected").val();
  $.ajax({
    url: "./selcate.do",
    type: "post", // or get
    cache: false,
    async: true, // true: 비동기
    dataType: "json", // 응답 형식, html, xml...
    data: params,  // 보내는 데이터
    success: function(rdata) {
      $("#category3").empty();
      var str ='<option value="">카테고리3 선택</option>';
          for(var i = 0; i < rdata.length; i++){
            str += '<option value="'+rdata[i].categoryno+'">'+rdata[i].categorytitle+'</option>';
      }
  	    $("#category3").append(str);
  	    $("#category3").easyDropDown ( 'destroy' );
  	  	var $selects = $('#category3');
				
  	  	$selects.easyDropDown({
  	  		cutOff: 10,
  	  		wrapperClass: 'dropdown'
  	  	});
  	    }
    });
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
            <h3 class="title">상품 수정</h3>
            <form method="post" action="update.do" class="form-large" role="form" data-toggle="validator" enctype='multipart/form-data' id="frma" name="frma">
              <div class="row">
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">Category.1</label>
                  <select id="category1" name="category1" onchange="selcate1()">
                    <option value="">카테고리1 선택</option>
                    <c:forEach var="categoryVO" items="${category_one_list}">
                      <c:choose>
                        <c:when test="${categoryVO.category_no == fi_cateVO.category_no }">
                          <option value="${categoryVO.category_no}" selected="selected">${categoryVO.category_title }</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${categoryVO.category_no}" >${categoryVO.category_title }</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">Category.2</label>
                  <select id="category2" name="category2" onchange="selcate2()">
                    <option value="">카테고리2 선택</option>
                    <c:forEach var="category2VO" items="${category_two_list}">
                      <c:choose>
                        <c:when test="${category2VO.category_no == se_cateVO.category_no }">
                          <option value="${category2VO.category_no}" selected="selected">${category2VO.category_title }</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${category2VO.category_no}" >${category2VO.category_title }</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">Category.3</label>
                  <select id="category3" name="category3">
                    <option value="">카테고리3 선택</option>
                    <c:forEach var="category3VO" items="${category_three_list}">
                      <c:choose>
                        <c:when test="${category3VO.category_no == th_cateVO.category_no }">
                          <option value="${category3VO.category_no}" selected="selected">${category3VO.category_title }</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${category3VO.category_no}" >${category3VO.category_title }</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12" style="margin-bottom: 14px;">
                  <label for="name">Country</label>
                  <select id="country" name="country">
                    <option value="">제조국가 선택</option>
                    <c:forEach var="countryVO" items="${country_list}">
                      <c:choose>
                        <c:when test="${countryVO.country_no == outProductVO.country_no }">
                        <option value="${countryVO.country_no}" selected="selected">${countryVO.country_name }</option>
                        </c:when>
                        <c:otherwise>
                        <option value="${countryVO.country_no}">${countryVO.country_name }</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12" style="margin-bottom: 14px;">
                  <label for="subject">Manufacturer</label>
                  <select id="manufacturer" name="manufacturer">
                    <option value="">제조사 선택</option>
                    <c:forEach var="manufacturerVO" items="${manufacturer_list}">
                      <c:choose>
                        <c:when test="${manufacturerVO.manufacturer_no == outProductVO.manufacturer_no }">
                    <option value="${manufacturerVO.manufacturer_no}" selected="selected">${manufacturerVO.manufacturer_name}</option>
                        </c:when>
                        <c:otherwise>
                    <option value="${manufacturerVO.manufacturer_no}">${manufacturerVO.manufacturer_name}</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Name</label>
                  <input type="text" class="margin-bottom form-control" id="name" name="name" placeholder="제품명" value="${outProductVO.product_name }" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Material</label>
                  <input type="text" class="margin-bottom form-control" id="material" name="material" placeholder="재료" value="${outProductVO.material }" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Target</label>
                  <input type="text" class="margin-bottom form-control" id="target" name="target" placeholder="상품 타겟" value="${outProductVO.product_target }" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Weight</label>
                  <input type="text" class="margin-bottom form-control" id="weight" name="weight" placeholder="상품 중량" value="${outProductVO.product_weight }" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Price</label>
                  <input type="text" class="margin-bottom form-control" id="price" name="price" placeholder="상품 가격" value="${outProductVO.product_price }" required>
                </div>
                
                <div class="col-md-4">
                  <label for="text-message">조단백</label>
                  <input type="number" class="margin-bottom form-control" step="0.1" id="wprotein" name="wprotein" placeholder="조단백" value="${outProductVO.product_wprotein }" required>
                </div>
                <div class="col-md-4">
                  <label for="text-message">조지방</label>
                  <input type="number" class="margin-bottom form-control" step="0.1" id="wfat" name="wfat" placeholder="조지방" value="${outProductVO.product_wfat }" required>
                </div>
                <div class="col-md-4">
                  <label for="text-message">조회분</label>
                  <input type="number" class="margin-bottom form-control" step="0.1" id="wash" name="wash" placeholder="조회분" value="${outProductVO.product_wash }" required>
                </div>
                <div class="col-md-4">
                  <label for="text-message">조섬유</label>
                  <input type="number" class="margin-bottom form-control" step="0.1" id="wfiber" name="wfiber" placeholder="조섬유" value="${outProductVO.product_wfiber }" required>
                </div>
                <div class="col-md-4">
                  <label for="text-message">칼슘</label>
                  <input type="number" class="margin-bottom form-control" step="0.1" id="wcalcium" name="wcalcium" placeholder="칼슘" value="${outProductVO.product_wcalcium }" required>
                </div>
                <div class="col-md-4">
                  <label for="text-message">인</label>
                  <input type="number" class="margin-bottom form-control" step="0.1" id="wp" name="wp" placeholder="인" value="${outProductVO.product_wp }" required>
                </div>
                   <input type="hidden" id="img" name="img" placeholder="상품이미지" value="${outProductVO.product_img }">
                   <input type="hidden" id="introimg" name="introimg" placeholder="상품이미지" value="${outProductVO.product_introimg }">
                   <input type="hidden" id="prono" name="prono" value="${outProductVO.product_no }">
              </div>
            </form>
              <div class="row">
            <form method="post" action="updateimg.do" class="form-large" role="form" data-toggle="validator" enctype='multipart/form-data' id="frm2" name="frm2">
                <div class="col-md-12 margin-bottom">
                   <label for="text-message">Image</label>
                   <input type="file" class="margin-bottom form-control" id="imgz" name="imgz" placeholder="상품이미지" onchange="uploadfile()">
                </div>
                </form>
            <form method="post" action="updateimg.do" class="form-large" role="form" data-toggle="validator" enctype='multipart/form-data' id="frm3" name="frm3">
                <div class="col-md-12 margin-bottom">
                   <label for="text-message">Intro Image</label>
                   <input type="file" class="margin-bottom form-control" id="introimgz" name="introimgz" placeholder="상품이미지" onchange="uploadfile2()">
                </div>
                </form>
                </div>
              <div style="text-align: right;">
              <button id="submit" name="submit" type="button" onclick="submit_a();" class="btn btn-default">등록</button>
              <button id="back" name="back" type="button" class="btn btn-default" onclick="location.href='./list.do'">취소</button>
              </div>
          </div><!-- /.form-container -->

          <div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9 hidden-xs">
            <div class="info-container">
              <h1>Update<br>Product</h1>
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
  <script src="${pageContext.request.contextPath}/resources/script/vendor/images-fill/imagefill.min.js"></script>          <!-- ImageFill Script -->
  <script src="${pageContext.request.contextPath}/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->

 <!--  --> <script src="${pageContext.request.contextPath}/resources/script/custom.js"></script>                    <!-- Custom Script -->



<script src="http://malsup.github.com/jquery.form.js"></script> 

</body>
</html> 