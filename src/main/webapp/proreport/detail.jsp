<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">

</script>
</head>
<body class="fixed-header">
<div id="page-container">
<jsp:include page="/menu/top.jsp" flush='false' />
<section id="home-slide" class="header-margin-dual-line">
    <section id="contact">
      <div class="container">
          <div class="col-md-12">
          <div class="section-title line-style no-margin">
            <h3 class="title">수정 요청</h3>
          </div>
          <div class="col-md-12">
          <div class="section-title line-style no-margin">
            <h3 class="title">${OutProreportVO.proreport_title }　　-　　${OutProreportVO.product_name }  ${OutProreportVO.product_weight }</h3>
            </div> 
          </div>
            <div class="col-md-12">
              ${OutProreportVO.proreport_doc }
            </div>                 
            <div class="col-md-12">
              <img src="storage/${OutProreportVO.proreport_img}" style="width: 100%; height: auto;">
            </div>
            <div class="col-md-12" style="height: 70px;">
                    <a  class="btn btn-default" style="position: absolute; padding: 2px 6px; position: absolute !important; top: auto; right: 7px; bottom: 7px; left: auto; z-index: 3;"
                      href="${pageContext.request.contextPath}/proreport/list.do">목록</a>
                    <a  class="btn btn-default" style="position: absolute; padding: 2px 6px; position: absolute !important; top: auto; right: 55px; bottom: 7px; left: auto; z-index: 3;"
                      href="${pageContext.request.contextPath}/product/update2.do?prono=${OutProreportVO.product_no}">수정</a>
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