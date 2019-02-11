<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
<c:import url="/menu/top.jsp" />
  <div id="page-container">
  <div id="page-container">
<span><i class="icon fa fa-plus-square"></i>알림</span>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count == 0}">
          <li class='list-group-item'>회원 수정에 실패했습니다.</li>
          <li class='list-group-item'>다시한번 시도해주세요.</li>
          <li class='list-group-item'>
            <br>
            <button type='button' onclick='history.back()'>다시 시도</button>
            <button type='button' onclick="location.href='${pageContext.request.contextPath}'">취소</button>
          </li>
        </c:when>
        <c:when test="${param.count == 1 }">
          <li class='list-group-item'>회원 수정에 성공했습니다.</li>
          <li class='list-group-item'>
            <br>
            <button type='button'  class="btn btn-default button-form"  onclick="location.href='./read.do?member_no=${param.member_no}'">수정 확인</button>
             <button type='button'  class="btn btn-default button-form" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">홈으로</button>
          </li>          
 
        </c:when>
      </c:choose>    
 
    </UL>
  </fieldset>
 
</DIV>
 
</DIV> <!-- content END -->

</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
   
   