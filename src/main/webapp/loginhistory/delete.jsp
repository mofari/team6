<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 <div id="page-container">
 <div id="page-container">

  <div class='menu_line'></div>
  <span><i class="icon fa fa-plus-square"></i>로그인 내역 삭제</span>

<DIV class='content' style='width: 500px; text-align: center;'>
  <FORM name='frm' method='POST' action='./delete.do'>
    '${loginhistoryVO.getLoginhistory_email() }'님의 로그인 내역을 삭제하면 복구 할 수 없습니다.<br><br>
    정말로 삭제하시겠습니까?<br><br>         
    <input type='hidden' name='loginhistory_loginno' value='${loginhistoryVO.getLoginhistory_loginno() }'>     
        
    <button type="submit" class="btn btn-default button-form">삭제</button>
    <button type="button" class="btn btn-default button-form" onclick="location.href='./list.do'">취소</button>

  </FORM>
</DIV>

</DIV> <!-- content END -->
</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html> 


