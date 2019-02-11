<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
<script type="text/javascript">
  $(function(){ 
  
  });
</script>

</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 <div id="page-container">
 <div id="page-container">

<DIV class='title_line'>알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <c:choose>
          <c:when test="${param.count == 0}">
            <li class='li_none'>반려동물 삭제에 실패했습니다.</li>
          </c:when>
          <c:when test="${param.count == 1}">
            <li class='li_none'>반려동물 삭제에 성공했습니다.</li>
          </c:when>
        </c:choose>
     
        <li class='li_none'>
          <A class="btn btn-default button-form" href='${pageContext.request.contextPath}/index.jsp'>확인</A>
        </li>
        
      </ul>
    </fieldset>    
  </DIV>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>

</html> 


  