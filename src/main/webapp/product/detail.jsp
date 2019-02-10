<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">

var cd = '${vo.cdu_result_code}';
var msgs = '${vo.cdu_result}';
if(cd == 1){
  alert(msgs);
}

function like(){
  var btn = $('#likebtn');
  var cgo = $('#likev');
  var lcnt = btn.data("likecnt");
  if(btn.data("like") > 0){
    lcnt--;
    cgo.html(lcnt+" 개의 좋아요")
    $('#likeimg').attr('src', '/review/product/storage/likebtn.png');
    btn.data("likecnt", lcnt);
    btn.data("like", 0);
  } else {
    lcnt++;
    cgo.html(lcnt+" 개의 좋아요")
    $('#likeimg').attr('src', '/review/product/storage/likebtn2.png');
    btn.data("likecnt", lcnt);
    btn.data("like", 1);
  }
  $.ajax({
    url: "./like.do",
    type: "post", // or get
    cache: false,
    async: true, // true: 비동기
    dataType: "json", // 응답 형식, html, xml...
    data: { prono : ${outproductVO.product_no}, memno : 1},  // 보내는 데이터
    success: function(rdata) {
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
          <div class="col-md-12">
          <div class="section-title line-style no-margin"><h3 class="title">Product</h3></div>
                <div class="col-md-12">
                  <div class="col-md-6">
                    <img src="storage/${outproductVO.product_img }" class="img-responsive" alt="project image" style="width: 100%; max-height:500px; height: auto; vertical-align: middle; display: inline;">         
                  </div>
                  <div class="col-md-6">
                    <h5>${categoryVO.category_title} > ${outproductVO.category_title }</h5>
                    <h3>${outproductVO.product_name } ${outproductVO.product_weight }</h3>
                    <div class="section-title line-style"><h3 class="title">제조브랜드</h3></div>
                    <div class="col-md-6" style="height: 60px">
                      <img src="${pageContext.request.contextPath}/manufacturer/storage/${outproductVO.manufacturer_img }" class="img-responsive" alt="project image" style="width: auto; max-height:100%; height: auto;">
                    </div>
                    <div class="col-md-6">
                      ${outproductVO.manufacturer_name }<br>
                      ${outproductVO.country_name }
                    </div><br>
                    <div style="clear: both;"></div> 
                    <div class="col-md-6" style="padding: 0px;">
                    <div class="section-title line-style"><h3 class="title">대상</h3></div>
                    <div class="col-md-12">${outproductVO.product_target }</div><div style="clear: both;"></div>
                    </div>
                    <div class="col-md-6" style="padding: 0px;">
                    <div class="section-title line-style"><h3 class="title">가격</h3></div>
                    <div class="col-md-12">${outproductVO.product_price } 원</div><div style="clear: both;"></div>
                    </div>
                    <div style="clear: both;"></div> 
                    <div class="section-title line-style"><h3 class="title">재료</h3></div>
                    <div class="col-md-12">${outproductVO.material }</div><div style="clear: both;"></div>
                    <div class="col-md-6" style="text-align: center; margin-top: 16px;">
                      <c:choose>
                       <c:when test="${prolikecnt > 0 }">
                        <button style="background: #00000000; border: none;" onclick="like();" id="likebtn" name="likebtn" data-like="${prolikecnt }" data-likecnt="${outproductVO.product_like }">
                          <img alt="좋아요" id="likeimg" name="likeimg" src="${pageContext.request.contextPath}/product/storage/likebtn2.png">
                          <br>
                          ${outproductVO.product_like } 개의 좋아요
                        </button>
                       </c:when>
                       <c:otherwise>
                        <button style="background: #00000000; border: none;" onclick="like();" id="likebtn" name="likebtn" data-like="${prolikecnt }" data-likecnt="${outproductVO.product_like }">
                          <img alt="좋아요" id="likeimg" name="likeimg" src="${pageContext.request.contextPath}/product/storage/likebtn.png">
                          <br>
                          <cgo id="likev" name="likev">${outproductVO.product_like } 개의 좋아요</cgo>
                        </button>
                        </c:otherwise>
                      </c:choose>
                    </div>
                    <div class="col-md-6" style="text-align: center; margin-top: 16px;">
                      <button class="button-read button-read btn btn-default" type="button" onclick="location.href='${pageContext.request.contextPath}/proreport/create.do?prono=${outproductVO.product_no }'">수정요청</button>
                    </div>
                  </div>
                </div>
                <div class="col-md-12">
                <div class="section-title line-style no-margin"><h3 class="title">성분함량</h3></div> 
                ※ AAFCO 미국사료협회에서 지정한 강아지 고양이 최소 영양 수치 정보입니다.
                <div class="col-md-12">
                 <c:choose>
                       <c:when test="${categoryVO.category_no == 1 }">
                                           <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px;"><h3 class="title">조단백</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자견</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 40.5%"></span></span>
                    <span class="count">20.25%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성견</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 32.4%"></span></span>
                    <span class="count">16.20%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wprotein*2}%"></span></span>
                    <span class="count">${outproductVO.product_wprotein}%</span>
                  </li>
                </ul>
                </section>
                <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px; margin-top: 0px;"><h3 class="title">조지방</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자견</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 15.3%"></span></span>
                    <span class="count">7.65%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성견</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 9.9%"></span></span>
                    <span class="count">4.95%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wfat*2}%"></span></span>
                    <span class="count">${outproductVO.product_wfat}%</span>
                  </li>
                </ul>
                </section>
                <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px; margin-top: 0px;"><h3 class="title">칼슘</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자견</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 9.0%; background-color: #5555ff;"></span>
                    <span class="percent" style="width: 4.32%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">2.16 ~ 4.5%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성견</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 3.22%; background-color: #5555ff;"></span>
                    <span class="percent" style="width: 0.9%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.45 ~ 1.62%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wcalcium*2}%"></span></span>
                    <span class="count">${outproductVO.product_wcalcium}%</span>
                  </li>
                </ul>
                </section>
                <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px; margin-top: 0px;"><h3 class="title">인</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자견</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 2.88%; background-color: #5555ff;"></span>
                    <span class="percent" style="width: 1.8%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.9 ~ 1.44%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성견</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 2.88%; background-color: #5555ff;"></span>
                    <span class="percent" style="width: 0.72%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.36 ~ 1.44%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wp*2}%"></span></span>
                    <span class="count">${outproductVO.product_wp}%</span>
                  </li>
                </ul>
                </section>
 
                       </c:when>
                       
                       <c:when test="${categoryVO.category_no == 2 }">
                                           <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px;"><h3 class="title">조단백</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자묘</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 54.0%"></span></span>
                    <span class="count">27%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성묘</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 46.8%"></span></span>
                    <span class="count">23.4%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wprotein*2}%"></span></span>
                    <span class="count">${outproductVO.product_wprotein}%</span>
                  </li>
                </ul>
                </section>
                <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px; margin-top: 0px;"><h3 class="title">조지방</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자묘</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 16.2%"></span></span>
                    <span class="count">8.1%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성묘</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="width: 16.2%"></span></span>
                    <span class="count">8.1%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 70px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wfat*2}%"></span></span>
                    <span class="count">${outproductVO.product_wfat}%</span>
                  </li>
                </ul>
                </section>
                <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px; margin-top: 0px;"><h3 class="title">칼슘</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자묘</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 9%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.9%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성묘</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 5.4%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.54%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wcalcium*10}%"></span></span>
                    <span class="count">${outproductVO.product_wcalcium}%</span>
                  </li>
                </ul>
                </section>
                <div class="col-md-2">
                    <div class="section-title line-style" style="margin-bottom: 0px; margin-top: 0px;"><h3 class="title">인</h3></div>
                  </div>
                    <div style="clear: both;"></div>
                    <section id="property-content">
                    <ul class="rating">
                  <li class="value">
                    <span class="name">AAFCO 자묘</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 7.2%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.72%</span>
                  </li>
                  <li class="value">
                    <span class="name">AAFCO 성묘</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;">
                    <span class="percent" style="width: 4.5%"></span>
                    </span>
                    <span class="count" style="width: 100px; text-align: right;">0.45%</span>
                  </li>
                  <li class="value">
                    <span class="name">상품</span>
                    <span class="graphic" style="margin: 0 120px 0 120px;"><span class="percent" style="background-color: #3da5f4; width: ${outproductVO.product_wp*10}%"></span></span>
                    <span class="count">${outproductVO.product_wp}%</span>
                  </li>
                </ul>
                </section>
 
                       </c:when>
                       </c:choose>
                 
                  </div>
                  </div>
                  
                <div class="col-md-12">
                <div class="section-title line-style no-margin"><h3 class="title">상세정보</h3></div> 
                <img src="storage/${outproductVO.product_introimg}" style="width: 100%; height: auto;">
                </div>
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