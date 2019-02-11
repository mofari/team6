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
<DIV id='page-container'>
    <c:import url="/menu/top.jsp" />
<DIV id='page-container'>

  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
        <span><i class="icon fa fa-plus-square"></i>알림</span>
        <li class='list-group-item'>이용해 주셔서감사합니다.</li>
        <li class='list-group-item'>
           <button type='button'  class="btn btn-default button-form" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">확인</button>
        </li>
        
      </ul>
    </fieldset>    
  </DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>

</html> 


 