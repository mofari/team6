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
  
  <span><i class="icon fa fa-plus-square"></i>펫 전체 목록</span>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 20%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 30%;'/>
    <col style='width: 5%;'/>
  </colgroup>
  <TR>
    <TH class='thead-dark'></TH>
    <TH class='thead-dark'>이미지</TH>
    <TH class='thead-dark'>이름</TH>
    <TH class='thead-dark'>나이</TH>
    <TH class='thead-dark'>몸무게</TH>
    <TH class='thead-dark'>성별</TH>
    <TH class='thead-dark'>종류</TH>
    <TH class='thead-dark'>특이사항</TH>
    <TH class='thead-dark'>기타</TH>
  </TR>

  <c:forEach var="petVO" items="${mylist }">
    <c:set var="pet_no" value ="${petVO.pet_no }" /> 
  <TR>
    <TD class='td'>${petVO.pet_no }</TD>
    
    <td style='vertical-align: middle;'> 
              <c:choose>
                <c:when test="${petVO.pet_thumbs != ''}">
                  <IMG id='thumbs' src='./storage/${petVO.pet_thumbs }'> <!-- 이미지 파일명 출력 -->
                </c:when>
                <c:otherwise> 
                  <!-- 파일이 존재하지 않는 경우 -->
                  <IMG src='./images/none1.jpg' style='width: 120px; height: 80px;'>
                </c:otherwise>
              </c:choose>  
            </td>
  
    <TD class='td'>${petVO.pet_name}</TD>
    <TD class='td'>${petVO.pet_age}</TD>
    <TD class='td'>${petVO.pet_weight}</TD>
    <TD class='td'>${petVO.pet_gender}</TD>
    <TD class='td'>${petVO.pet_kind}</TD>
    <TD class='td'>${petVO.pet_specific}</TD> 
    <TD class='td'>
      <A href="./read.do?pet_no=${pet_no}"><IMG src='./images/update.jpg' title='수정'></A>
      <A href="./delete.do?pet_no=${pet_no}"><IMG src='./images/delete.jpg' title='삭제'></A>
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
  