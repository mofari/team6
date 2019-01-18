<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function(){
    action_cancel(); // panel 출력 초기화
    
    list();  // 모든 카테고리 목록
    
  });
  
  // 모든 카테고리 목록
  function list() {
    $.ajax({
      url: "./list_json.do", // 요청을 보낼주소
      type: "get",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      // data: "categrpno=" + categrpno, 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수 
        var panel = '';
 
        for(index=0; index < rdata.length; index++) {
          panel += "<TR>";
          panel += "<TD style='text-align: center ;'>"+(index+1)+"</TD>";
          panel += "<TD style='text-align: center ;'>"+rdata[index].category_title+"</A></TD>";
          panel += "<TD  style='text-align: center ;'>"+rdata[index].category_visible+"</TD>";
          panel += "<TD style='text-align: center;'>"+rdata[index].category_cnt+"개</TD>";
          panel += "<TD style='text-align: center;'>"+rdata[index].goods_cnt+"개</TD>";
          panel += "<TD style='text-align: center;'>"+rdata[index].category_ids+"</TD>";
          panel += "<TD style='text-align: center;'>"; 
          panel += "  <A href='../contents/create.do?category_no="+rdata[index].category_no+"'><IMG src='./images/create.png' title='등록'></A>";
          panel += "  <A href=\"javascript:update("+rdata[index].category_no+")\"><IMG src='./images/update.png' title='수정'></A>";  
          panel += "  <A href=\"javascript:deleteForm("+rdata[index].category_no+")\"><IMG src='./images/delete.png' title='삭제'></A>";
          panel += "</TD>";
          panel += "</TR>";
        }
        // alert(panel);
        // return;
        $('#tbody_panel').empty();
        $('#tbody_panel').append(panel);
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 450px;'>";
        panel += '  ERROR<br><br>';
        panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
        panel += '  <strong>error</strong><br>'+error + '<hr>';
        panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
        panel += "</DIV>";
        
        $('#main_panel').html(panel);
        $('#main_panel').show();
      }
    });
  }

  
  //등록 처리
  function create() {
    $.ajax({
      url: "./create_json.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: $('#frm_create').serialize(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
/*         var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 250px;'>";
        panel += '  알림<br>';
        for(index=0; index < rdata.msgs.length; index++) {
          panel += rdata.msgs[index]+'<br>';
        }
        panel += "  <button type='button' onclick=\"$('#main_panel').hide();\" class='popup_button'>닫기</button>";
        panel += "</DIV>";
        
        action_cancel(); */
        
        list();  // 전체 카테고리 목록
        
        $('#category_title').val('');
        
    //    $('#main_panel').html(panel);
     //   $('#main_panel').show();
        
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 450px;'>";
        panel += '  ERROR<br><br>';
        panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
        panel += '  <strong>error</strong><br>'+error + '<hr>';
        panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
        panel += "</DIV>";
        
        $('#main_panel').html(panel);
        $('#main_panel').show();
 
      }
    });
  }
  

  function deleteForm(category_no) {
    $('#panel_create').hide();
    $('#panel_update').hide();
    $('#panel_delete').show();
    
    
    $.ajax({
      url: "./delete.do", // 요청을 보낼주소
      type: "get",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'category_no=' +category_no,  // $('#frm').serialize(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
        var frm_delete = $('#frm_delete');
        $('#category_no', frm_delete).val(rdata.category_no);        
        $('#category_title').html(rdata.category_title); // 카테고리 이름
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 350px;'>";
        panel += '  ERROR<br><br>';
        panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
        panel += '  <strong>error</strong><br>'+error + '<hr>';
        panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
        panel += "</DIV>";
        
        $('#main_panel').html(panel);
        $('#main_panel').show();

      }
    });
  }
  
  
  
//삭제 처리
  function delete_submit() {
    $.ajax({
      url: "./delete.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: $('#frm_delete').serialize(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 250px;'>";
        panel += '  알림<br>';
        for(index=0; index < rdata.msgs.length; index++) {
          panel += rdata.msgs[index]+'<br>';
        }
        panel += "  <button type='button' onclick=\"$('#main_panel').hide();\" class='popup_button'>닫기</button>";
        panel += "</DIV>";
        
        action_cancel();
        
        list();  // 전체 카테고리 목록
        
        $('#main_panel').html(panel);
        $('#main_panel').show();
        
        // $('#frm_create')[0].reset(); // id가 frm_create인 첫번째폼을 reset
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 450px;'>";
        panel += '  ERROR<br><br>';
        panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
        panel += '  <strong>error</strong><br>'+error + '<hr>';
        panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
        panel += "</DIV>";
        
        $('#main_panel').html(panel);
        $('#main_panel').show();
 
      }
    });
  }

  function update(category_no) {
    $('#panel_create').hide();
    $('#panel_update').show();
    
    $.ajax({
      url: "./update.do", // 요청을 보낼주소
      type: "get",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: 'category_no=' +category_no,  // $('#frm').serialize(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
        var frm_update = $('#frm_update');
        $('#category_no', frm_update).val(rdata.category_no);        
        $('#category_title', frm_update).val(rdata.category_title);
        $('#category_visible', frm_update).val(rdata.category_visible);
        $('#category_ids', frm_update).val(rdata.category_ids);        
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 350px;'>";
        panel += '  ERROR<br><br>';
        panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
        panel += '  <strong>error</strong><br>'+error + '<hr>';
        panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
        panel += "</DIV>";
        
        $('#main_panel').html(panel);
        $('#main_panel').show();

      }
    });
  } 

  // 수정 처리
  function update_submit() {
    $.ajax({
      url: "./update.do", // 요청을 보낼주소
      type: "post",  // or get
      cache: false,
      dataType: "json", // 응답 데이터 형식, or json
      data: $('#frm_update').serialize(), 
      // Ajax 통신 성공, JSP 정상 처리
      success: function(rdata) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 250px;'>";
        panel += '  알림<br>';
        for(index=0; index < rdata.msgs.length; index++) {
          panel += rdata.msgs[index]+'<br>';
        }
        panel += "  <button type='button' onclick=\"$('#main_panel').hide();\" class='popup_button'>닫기</button>";
        panel += "</DIV>";
        
        action_cancel();
        
        list();  // 전체 카테고리 목록
        
        $('#main_panel').html(panel);
        $('#main_panel').show();
        
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var panel = '';
        panel += "<DIV id='panel' class='popup1' style='heigth: 450px;'>";
        panel += '  ERROR<br><br>';
        panel += '  <strong>request.status</strong><br>'+request.status + '<hr>';
        panel += '  <strong>error</strong><br>'+error + '<hr>';
        panel += "  <br><button type='button' onclick=\"$('#main_panel').hide();\">닫기</button>";
        panel += "</DIV>";
        
        $('#main_panel').html(panel);
        $('#main_panel').show();
 
      }
    });
  }

  
  function action_cancel() {
    $('#panel_update').hide();
    $('#panel_delete').hide();
    $('#panel_create').show();

    $('#frm_create')[0].reset(); // id가 frm_create인 첫번째폼을 reset
  } 
  
</script>
 
</head> 
 
  <body class="fixed-header">
<DIV class='container' style='width: 100%;'>
    <c:import url="/menu/top.jsp" />
<DIV class='content' style="padding-top:10%;">
  
  <DIV id='main_panel'></DIV>
  
  <DIV class='title_line'>전체 카테고리 목록</DIV>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #FFAAAA; width: 100%; text-align: center;'>
    <FORM name='frm_delete' id='frm_delete'>
      <input type='hidden' name='category_no' id='category_no' value=''>
      
      <span id='delete_panel'></span> 카테고리를 삭제하시겠습니까?
      삭제하면 복구 할 수 없습니다.
      <button type="button" id='submit' onclick="delete_submit()">삭제</button>
      <button type="button" onclick="action_cancel()">취소</button>
    </FORM>
  </DIV>
 
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F5F5F5; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
             
      <label for='title'>카테고리 이름</label>
      <input type='text' name='category_title' id='category_title' size='10' value='' required="required" style='width: 10%;'>
  
      <label for='visible'>출력 형식</label>
       <select name='category_visible'>
         <option value='Y' selected="selected">Y</option>
         <option value='N'>N</option>
       </select>
       
      <label for='ids'>접근 계정</label>
      <input type='text' name='category_ids' id='category_ids' value='admin' required="required" style='width: 10%;'>
 
      <button type="button" id='submit' onclick="create()">등록</button>
      <button type="button" onclick="action_cancel()">취소</button>
    </FORM>
  </DIV>  
  
  <!--  수정폼은 항상 PK 전달한다. -->
  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 100%; text-align: center;'>  
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='category_no' id='category_no' value=''> 
 
      <label for='name'>카테고리 이름</label>
      <input type='text' name='category_title' id='category_title' size='15' value='' required="required" style='width: 20%;'>
 
  
      <label for='visible'>출력 형식</label>
       <select name='category_visible'>
         <option value='Y' selected="selected">Y</option>
         <option value='N'>N</option>
       </select>
 
      <label for='ids'>접근 계정</label>
      <input type='text' name='category_ids' id='category_ids' value='admin' required="required" style='width: 10%;'>
 
      <button type="button" onclick="update_submit();">저장</button>
      <button type="button" onclick="action_cancel()">취소</button>
    </FORM>
  </DIV>
  
<TABLE class='table table-striped' > 
  <colgroup>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
    <col style='width: 20%;'/>
  </colgroup>
  <thead>  
  <TR>
    <TH style='text-align: center ;'>번호</TH>
    <TH style='text-align: center ;'>카테고리</TH>
    <TH style='text-align: center ;'>출력</TH>
    <TH style='text-align: center ;'>리뷰 수</TH>
    <TH style='text-align: center ;'>상품 수</TH>
    <TH style='text-align: center ;'>접근 계정</TH>
    <TH style='text-align: center ;'>기타</TH>
     
  </TR>
  </thead>
 
  <tbody id='tbody_panel' data-nowPage='0' data-endPage='0'>
  </tbody>
  
</TABLE>
 
 
</DIV> <!-- content END -->
</DIV> <!-- container END -->
</body>
 
</html> 
 