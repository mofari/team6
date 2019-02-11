<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PFreview :: 상품</title>
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
</style>
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
<div id="breadcrumb" style="position:relative !important;">
        <div class="container">
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">Admin</a></li>
            <li class="active">상품</li>
          </ol>
        </div>
      </div>
    <section id="contact">
      <div class="container">
        <div class="row">
          <c:if test="${vo.cdu_result_code == 1}">
            <div class="alert with-icon alert-success" role="alert">
              <i class="icon fa fa-check"></i> 
              ${vo.cdu_result}
            </div>
          </c:if>
          <c:if test="${vo.cdu_result_code == 0}">
            <div class="alert with-icon alert-danger" role="alert">
              <i class="icon fa fa-exclamation-triangle"></i> 
              ${vo.cdu_result}
            </div>
          </c:if>
          <div class="section-title line-style no-margin"><h3 class="title">상품</h3></div>
          <div style="margin: 20px;">
          <A style="float: right;" href="./create.do" class="button-read button-read btn btn-default">등록</A>
          <div style="clear: both;"></div>
          </div>
          <div style="border: 2px solid #1fb7a6; padding: 20px;">
          <form action="./list.do" method="get">
            <div class="col-md-4" style="margin-bottom: 14px;">
                  <select id="category1" name="category1" onchange="selcate1()">
                    <option value="">카테고리1 선택</option>
                    <c:forEach var="categoryVO" items="${category_one_list}">
                      <c:choose>
                        <c:when test="${categoryVO.category_no == param.category1 }">
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
                  <select id="category2" name="category2" onchange="selcate2()">
                    <option value="">카테고리2 선택</option>
                    <c:forEach var="category2VO" items="${category_two_list}">
                      <c:choose>
                        <c:when test="${category2VO.category_no == param.category2 }">
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
                  <select id="category3" name="category3">
                    <option value="">카테고리3 선택</option>
                    <c:forEach var="category3VO" items="${category_three_list}">
                      <c:choose>
                        <c:when test="${category3VO.category_no == param.category3 }">
                          <option value="${category3VO.category_no}" selected="selected">${category3VO.category_title }</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${category3VO.category_no}" >${category3VO.category_title }</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
            </div>
            <div class="col-md-4">
                  <select id="manufacturer" name="manufacturer">
                    <option value="">제조사 선택</option>
                    <c:forEach var="manufacturerVO" items="${manufacturer_list}">
                      <c:choose>
                        <c:when test="${manufacturerVO.manufacturer_no == param.manufacturer }">
                    <option value="${manufacturerVO.manufacturer_no}" selected="selected">${manufacturerVO.manufacturer_name}</option>
                        </c:when>
                        <c:otherwise>
                    <option value="${manufacturerVO.manufacturer_no}">${manufacturerVO.manufacturer_name}</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </select>
            </div>
            <div class="col-md-6">
              <input type="text" id="word" name="word" class="margin-bottom form-control" value="${param.word }" placeholder="상품명">
            </div>
            <div class="col-md-1">
              <button type="button" class="button-read button-read btn btn-default" style="float: right;" onclick="location.href='./list.do'">Reset</button>
            </div>
            <div class="col-md-1">
              <button type="submit" class="button-read button-read btn btn-default" style="float: right;">검색</button>
            </div>
              <div style="clear: both;"></div>
          </form>
          </div>
          <br>
          <c:forEach var="outproductVO" items="${list}">
                                <div class="col-md-3">
									<div class="box-ads box-grid">
										<a class="hover-effect image image-fill" href="detail.do?prono=${outproductVO.product_no }" style="overflow: hidden; text-align:center; line-height: 100%">
											<span class="cover"></span>
											<img alt="Sample images" src="./storage/${outproductVO.product_img }" class="" style="max-width: 100%; top: 0px;  max-height: 100%; left: 0px; vertical-align: middle;">
										</a>
										<span class="price">￦ ${outproductVO.product_price }</span>
										<span class="address"><i class="fa fa-map-marker"></i> ${outproductVO.product_name }</span>
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
                      <form action="./del.do" method="post" onsubmit="">
                        <input type="hidden" id="prono" name="prono" value="${outproductVO.product_no}">
                      <button class="btn btn-default" style="position: absolute; padding: 2px 6px; position: absolute !important; top: auto; right: 7px; bottom: 7px; left: auto; z-index: 3;"
                      onclick="javascript:return confirm('정말 삭제하시겠습니까?');">삭제</button>
                      <a  class="btn btn-default" style="position: absolute; padding: 2px 6px; position: absolute !important; top: auto; right: 55px; bottom: 7px; left: auto; z-index: 3;"
                      href="./update.do?prono=${outproductVO.product_no}">수정</a>
                      </form>
										</div>
									</div>
								</div>
          </c:forEach>
          <DIV style="clear: both;">${paging }</DIV><br>
          <DIV style="text-align: center;">
          </DIV>
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
  <script src="${pageContext.request.contextPath}/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->
  

  <script src="${pageContext.request.contextPath}/resources/script/custom.js"></script>                    <!-- Custom Script -->
</body>
</html> 


