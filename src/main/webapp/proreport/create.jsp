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
        <div class="row">
          <div class="col-sm-8 col-sm-push-4 col-md-9 col-md-push-3 form-container">
            <h3 class="title">상품 수정요청</h3>
            <form method="post" action="create.do" class="form-large" role="form" data-toggle="validator" enctype='multipart/form-data'>
            <input type="hidden" id="prono" name="prono" value="${param.prono }">
              <div class="row">
                <div class="col-md-4" style="margin-bottom: 14px;">
                  <label for="name">요청할 상품</label>
                  <span class="margin-bottom form-control" id="name" >${productVO.product_name }  ${productVO.product_weight }</span>
                </div>
                <div class="col-md-12">
                  <label for="text-message">제목</label>
                  <input type="text" class="margin-bottom form-control" id="title" name="title" placeholder="제목" required>
                </div>
                <div class="col-md-12">
                  <label for="text-message">내용</label>
                  <textarea name="docum" id="docum" class="form-control" style="resize: none;" rows="10" required></textarea>
                </div>
                <div class="col-md-12 margin-bottom">
                   <label for="text-message">참고 이미지</label>
                   <input type="file" class="margin-bottom form-control" id="img" name="img" placeholder="참고이미지">
                </div>
              </div>
              <div style="text-align: right;">
              <button id="submit" name="submit" type="submit" class="btn btn-default">요청 전송</button>
              <button id="back" name="back" type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
              </div>
            </form>
          </div><!-- /.form-container -->

          <div class="col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9 hidden-xs">
            <div class="info-container">
              <h1>New<br>Report</h1>
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