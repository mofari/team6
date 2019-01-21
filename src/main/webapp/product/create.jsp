<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
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
            <h3 class="title">상품 신규 등록</h3>
            <form method="post" action="create.do" class="form-large" role="form" data-toggle="validator" enctype='multipart/form-data'>
              <div class="row">
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">Category.1</label>
                  <select id="category1" name="category1" onchange="selcate1()">
                    <option value="">카테고리1 선택</option>
                    <c:forEach var="categoryVO" items="${category_one_list}">
                    <option value="${categoryVO.category_no}">${categoryVO.category_title }</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">Category.2</label>
                  <select id="category2" name="category2" onchange="selcate2()">
                    <option value="">카테고리2 선택</option>
                  </select>
                </div>
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">Category.3</label>
                  <select id="category3" name="category3">
                    <option value="">카테고리3 선택</option>
                  </select>
                </div>
                <div class="col-md-12" style="margin-bottom: 14px;">
                  <label for="name">Country</label>
                  <select id="country" name="country">
                    <option value="">제조국가 선택</option>
                    <c:forEach var="countryVO" items="${country_list}">
                    <option value="${countryVO.country_no}">${countryVO.country_name }</option>
                    </c:forEach>
                  </select>
                </div>
                <div class="col-md-12">
                  <label for="subject">Manufacturer</label>
                  <input type="text" class="margin-bottom form-control" id="manufacturer" name="manufacturer" placeholder="제조사" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">Webpage</label>
                  <input type="text" class="margin-bottom form-control" id="webpageurl" name="webpageurl" placeholder="URL" required>
                </div>

                <div class="col-md-12 margin-bottom">
                   <label for="text-message">Logo Image</label>
                   <input type="file" class="margin-bottom form-control" id="img" name="img" placeholder="로고">
                </div>
              </div>
              <div style="text-align: right;">
              <button id="submit" name="submit" type="submit" class="btn btn-default">등록</button>
              <button id="back" name="back" type="button" class="btn btn-default" onclick="location.href='./list.do'">취소</button>
              </div>
            </form>
          </div><!-- /.form-container -->

          <div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9 hidden-xs">
            <div class="info-container">
              <h1>New<br>Product</h1>
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

  <script src="${pageContext.request.contextPath}/resources/script/custom.js"></script>                    <!-- Custom Script -->

</body>
</html> 