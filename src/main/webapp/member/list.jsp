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
  
  <form name='frm' id='frm' method="get" action="./member_search.do">
  <ASIDE style='float: left;'>

    <A href='./member_search.do?'>${memberVO.member_name }</A>

    <c:if test="${param.member_name.length() > 0}"> 
      >
      [${param.member_name}] 검색 목록(${search_count } 건) 
    </c:if>

  </ASIDE>
  <ASIDE style='float: right;'>
    
    <c:choose>
      <c:when test="${param.member_name != '' }">
        <input type='text' name='member_name' id='member_name' value='${param.member_name }' style='width: 35%;'>
      </c:when>
      <c:otherwise>
        <input type='text' name='member_name' id='member_name' value='' style='width: 35%;'>
      </c:otherwise>
    </c:choose>
    <button class= 'btn btn-default button-form'  type='submit'>이름으로 검색</button>
   <%--  <button type='button' 
                 onclick="location.href='./member_search.do?categoryno=${categoryVO.categoryno }'">전체 보기</button> --%>
  </ASIDE>
  </form>
  

  <table class="table" style='width: 100%;'>
  
  <span><i class="icon fa fa-plus-square"></i>회원 목록</span>
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
    <TH class='thead-dark'>번호</TH>
    <TH class='thead-dark'>이메일</TH>
    <TH class='thead-dark'>성명</TH>
    <TH class='thead-dark'>전화번호</TH>
    <TH class='thead-dark'>주소</TH>
    <TH class='thead-dark'>등록일</TH>
    <TH class='thead-dark'>기타</TH>
  </TR>

  <c:forEach var="memberVO" items="${list }">
    <c:set var="member_no" value ="${memberVO.member_no}" /> 
  <TR>
    <TD class='td'>${member_no}</TD>
    <TD class='td'><A href="./read.do?member_no=${member_no}">${memberVO.member_email}</A></TD>
    <TD class='td'>${memberVO.member_name}</TD>
    <TD class='td'>${memberVO.member_tel}</TD>
    <TD class='td'>${memberVO.member_address}</TD>
    <TD class='td'>${memberVO.member_date}</TD> <!-- 년월일 -->
    <TD class='td'>
      <A href="./read.do?member_no=${member_no}"><IMG src='./images/update.jpg' title='수정'></A>
      <A href="./delete.do?member_no=${member_no}"><IMG src='./images/delete.jpg' title='삭제'></A>
    </TD>
    
  </TR>
  </c:forEach>


  
</TABLE>

<DIV class='bottom_menu'>
  <button type='button'  class="btn btn-default button-form" onclick="location.href='./create.do'">등록</button>
  <button type='button' class="btn btn-default button-form" onclick="location.reload();">새로 고침</button>
</DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  