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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
<DIV id='page-container'>
<DIV id='page-container'>
  <div class='menu_line'></div>
  

  <table class="table" style='width: 100%;'>
  
  <span><i class="icon fa fa-plus-square"></i>로그인 내역</span>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 30%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='thead-dark'>로그인 번호</TH>
    <TH class='thead-dark'>아이피</TH>
    <TH class='thead-dark'>이메일</TH>
    <TH class='thead-dark'>등록 시간</TH>
    <TH class='thead-dark'>권한</TH>
    <TH class='thead-dark'>기타</TH>
  </TR>

  <c:forEach var="loginhistoryVO" items="${list }">
    <c:set var="loginhistory_loginno" value ="${loginhistoryVO.loginhistory_loginno }" /> 
  <TR>
    <TD class='td'>${loginhistoryVO.loginhistory_loginno }</TD>
    <TD class='td'>${loginhistoryVO.loginhistory_ip}</TD>
    <TD class='td'>${loginhistoryVO.loginhistory_email}</TD>
    <TD class='td'>${loginhistoryVO.loginhistory_time}</TD>
    <TD class='td'>${loginhistoryVO.act_no}</TD> <!-- 년월일 -->
    <TD class='td'>
      <A href="./delete.do?loginhistory_loginno=${loginhistory_loginno}"><IMG src='./images/delete.jpg' title='삭제'></A>
    </TD>
    
  </TR>
  </c:forEach>


  
</TABLE>

<DIV class='bottom_menu'>
   ${paging }
  <button type='button' class="btn btn-default button-form" onclick="location.reload();">새로 고침</button>
</DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush='false'  />
</body>

</html>
  