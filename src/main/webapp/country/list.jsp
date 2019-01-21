<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>PFreview :: 제조국</title>
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
            <li class="active">제조국</li>
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
          <div class="section-title line-style no-margin"><h3 class="title">제조국</h3></div>
          <div style="margin: 20px;">
          <A style="float: right;" href="./create.do" class="button-read button-read btn btn-default">등록</A>
          <div style="clear: both;"></div>
          </div>

          <c:forEach var="countryVO" items="${list}">
                <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom: 20px;">
                  <a href="./update.do?countryno=${countryVO.country_no }" class="margin-bottom form-control" style="float: left;">
                  ${countryVO.country_name}
                       <form action="./delete.do" method="post" style="position: absolute; right: 5%; top: 15%;">
                        <input type="hidden" id="countryno" name="countryno" value="${countryVO.country_no}">
                        <button type="submit" style="padding-left: 7px; padding-right: 7px;" class="btn btn-danger btn-xs" onclick="javascript:return confirm('정말 삭제하시겠습니까?');">X</button>
                      </form>
                  </a>
                </div>
          </c:forEach>
        </div>
      </div>
    </section>
    </section>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- page-container END -->
</body>
</html> 