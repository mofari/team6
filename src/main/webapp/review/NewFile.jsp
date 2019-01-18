<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){

});
</script>

</head>
  <body class="fixed-header">
<DIV class='container' style='width: 100%;'>
    <c:import url="/menu/top.jsp" />
<DIV class='content'  style="padding-top:10%;">
  <form name='frm' id='frm' method="get" action="./list.do">
  <ASIDE style='float: left;'>
    <A href='../review/list.do?category_no=${categoryVO.category_no }'>리뷰 목록</A>
    >  
    <A href='./list_by_category.do?category_no=${categoryVO.category_no }'>${categoryVO.category_title }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do?category_no=${param.category_no }'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>  
  
   <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 37%;"></col>
        <col style="width: 8%;"></col>
        <col style="width: 8%;"></col>
        <col style="width: 8%;"></col>
        <col style="width: 19%;"></col>
        <col style="width: 10%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align:center'>파일</th>
          <th style='text-align:center'>제목</th>
          <th style='text-align:center'>추천</th>
          <th style='text-align:center'>평점</th>
          <th style='text-align:center'>아이디</th>
          <th style='text-align:center'>등록일</th>
          <th style='text-align:center'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="review_MemberVO" items="${list }">
          <tr> 
            <td style='vertical-align: middle;'>
              <c:choose>
                <c:when test="${review_MemberVO.review_thumb != ''}">
                  <IMG id='thumb' src='./storage/${review_MemberVO.review_thumb }'> <!-- 이미지 파일명 출력 -->
                </c:when>
                <c:otherwise>
                  <!-- 파일이 존재하지 않는 경우 -->
                  <IMG src='./images/none1.jpg' style='width: 120px; height: 80px;'>
                </c:otherwise>
              </c:choose>
            </td>
            
            <td style='text-align:center; vertical-align: middle;'>
              <a href="./read.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}">${review_MemberVO.review_title}</a> 
            </td> 
    
            <td style='text-align:center; vertical-align: middle;'>${review_MemberVO.review_good}</td>
            <td style='text-align:center; vertical-align: middle;'>${review_MemberVO.review_grade}점</td>
            <td style='text-align:center; vertical-align: middle;'>${review_MemberVO.member_nickname}</td>
            <td style='text-align:center; vertical-align: middle;'>${review_MemberVO.review_rdate.substring(0,10)}</td>
            <td style='text-align:center; vertical-align: middle;'>
              <a href="./update.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?review_no=${review_MemberVO.review_no}&category_no=${review_MemberVO.category_no}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
              ${review_MemberVO.category_no} / 
            </td>
          </tr>
        </c:forEach>
        
      </tbody> 
    </table>
    <br><br>
  </div>
  </form>
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
</html>