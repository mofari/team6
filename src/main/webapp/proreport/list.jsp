<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PFreview :: 상품수정요청</title>
<script type="text/javascript">
var cd = '${vo.cdu_result_code}';
var msgs = '${vo.cdu_result}';
if(cd == 1){
  alert(msgs);
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
            <li class="active">상품수정요청</li>
          </ol>
        </div>
      </div>
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="section-title line-style no-margin"><h3 class="title">상품수정요청 목록</h3></div>
          <br>
          <table class="table">
                <thead>
                <tr>
                  <th style='width: 5%;'>No</th>
                  <th style='width: 30%;'>상품</th>
                  <th style='width: 55%;'>제목</th>
                  <th style='width: 10%;'>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="proreportVO" items="${list}">
                <tr>
                  <td>${proreportVO.proreport_no }</td>
                  <td>${proreportVO.product_name }  ${proreportVO.product_weight}</td>
                  <td><a href="./detail.do?rptno=${proreportVO.proreport_no }">${proreportVO.proreport_title }</a></td>
                  <td>
                  <form action="./del.do" method="post" onsubmit="">
                        <input type="hidden" id="prono" name="prono" value="${proreportVO.product_no}">
                  <button class="btn btn-default" style="position: absolute; padding: 2px 6px; position: absolute !important; top: auto; right: 7px; bottom: 7px; left: auto; z-index: 3;"
                      onclick="javascript:return confirm('정말 삭제하시겠습니까?');">삭제</button>
                      </form>
                  </td>
                </tr>
          </c:forEach>
                </tbody>
              </table>
          
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


