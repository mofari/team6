<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PFreview :: 제조사</title>
<style type="text/css">
  .balloon {
  display: none;
  position: absolute;
  padding: 20px;
  top: 0%;
  width: calc(100% - 30px);
  height: 100%;
  background: #030303bb;
  color: #fff;
}
  div:hover + a.balloon {
  display: block;
}
 .balloon:hover{
  display: block;
  background: #030303bb;
  color: #fff;
 }
</style>
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
            <li class="active">제조사</li>
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
          <div class="section-title line-style no-margin"><h3 class="title">제조사</h3></div>
          <div style="margin: 20px;">
          <A style="float: right;" href="./create.do" class="button-read button-read btn btn-default">등록</A>
          <div style="clear: both;"></div>
          </div>

          <c:forEach var="manufacturerVO" items="${list}">
<!--             <div class="col-md-3">
                  <a href="${pageContext.request.contextPath}/manufacturer/storage/${manufacturerVO.manufacturer_img}" class="hover-effect galleryItem" data-group="1">
                    <img src="${pageContext.request.contextPath}/manufacturer/storage/${manufacturerVO.manufacturer_img}" alt="Sample images" class="img-responsive">
                    <span class="cover"></span>
                    <span class="cover-title">${manufacturerVO.manufacturer_name}</span>
                  </a>
                </div> -->
                <div class="col-md-3" style="margin-bottom: 24px;">
                  <div class="recent-post" style="margin-bottom: 0px;">
                    <a href="./update.do?manno=${manufacturerVO.manufacturer_no }" class="image image-fill" style="overflow: hidden; line-height: 160px">
                      <img src="${pageContext.request.contextPath}/manufacturer/storage/${manufacturerVO.manufacturer_img}" alt="Image Sample" class="" style="width: 100%; max-height: 100%; left: 0px; vertical-align: middle;">

                    </a><!-- /.image -->
                    <div class="body">
                      <span class="title">${manufacturerVO.manufacturer_name}</span>
                      <form action="./delete.do" method="post" onsubmit="">
                        <input type="hidden" id="manno" name="manno" value="${manufacturerVO.manufacturer_no}">
                        <button type="submit" style="z-index: 3;" class="button-read button-read btn btn-default" onclick="javascript:return confirm('정말 삭제하시겠습니까?');">삭제</button>
                      </form>
                    </div><!-- /.body -->
                  </div>
                      <a href="./update.do?manno=${manufacturerVO.manufacturer_no }" class="balloon" style="z-index: 2;">
                      <span style="word-wrap: break-word;">
                      ${manufacturerVO.manufacturer_zipcode}<br><br>
                      ${manufacturerVO.manufacturer_callnumber}<br><br>
                      ${manufacturerVO.manufacturer_webpageurl}<br>
                      </span>
                      </a>
                </div>
          </c:forEach>
          <DIV style="clear: both;">${paging }</DIV><br>
          <DIV style="text-align: center;">
          <form action="./list.do" method="get">
          <input type="text" id="word" name="word" value="${word }">
          <button type="submit" class="button-read button-read btn btn-default">검색</button>
          </form>
          </DIV>
        </div>
      </div>
    </section>
    </section>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- page-container END -->
</body>
</html> 