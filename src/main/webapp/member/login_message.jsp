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
    
<DIV class='content'>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
       <span><i class="icon fa fa-plus-square"></i>알림</span>
        <li class='list-group-item'>회원 로그인에 실패했습니다.</li>
        <li class='list-group-item'>ID 또는 패스워드가 일치하지 않습니다.</li>
        <li class=list-group-item>
          <A class="btn btn-default button-form" href='./login.do'>로그인 다시 시도</A>
          <A class="btn btn-default button-form" href='${pageContext.request.contextPath}/index.jsp'>확인</A>
        </li>
        
      </ul>
    </fieldset>    
  </DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>

</html> 


