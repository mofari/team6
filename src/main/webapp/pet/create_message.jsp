<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
 <%
String root = request.getContextPath();  // 절대 경로
%>
<!DOCTYPE html> 
<html lang="ko"> 

  <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/js.cookie-2.2.0.min.js"></script>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
  <div id="page-container">
    <c:import url="/menu/top.jsp" />
  <div id="page-container">
 
<DIV class="list-box-title"></DIV>
 
<DIV id='page-container'>
  <fieldset class='col-md-4'>
    <UL>
     <c:choose>
            <c:when test="${param.count == 0}">
              <li class='list-group-item'>펫 등록에 실패했습니다.</li>
              <li class='list-group-item'>다시한번 시도해주세요.</li>
              <li class='content-box'>
                <br>
                <button type='button' onclick='history.back()'>다시 시도</button>
                <button type='button' onclick="location.href='${pageContext.request.contextPath}/index.jsp''">취소</button>
              </li>
            </c:when>
            <c:when test="${param.count == 1 }">
              <li class='list-group-item'>펫 등록에 성공했습니다.</li>
              <li class='list-group-item'>
                <br>
                <button type='button'  class="btn btn-default button-form" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">확인</button>
              </li>          
 
            </c:when>
            </c:choose>
    </UL>
  </fieldset>
 
</DIV>
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html> 