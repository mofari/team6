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


<body>
<DIV id='page-container'>
    <c:import url="/menu/top.jsp" />
<DIV id='page-container'>

  <DIV id='main_panel'></DIV>

  <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal END -->
  <div class='menu_line'></div>
  
    <div class="list-box-title">
          <span><i class="icon fa fa-plus-square"></i>펫 정보 조회 및 수정</span>
        </div>

  <FORM name='frm' id='frm' method='POST' action='./update.do' 
            class="form-horizontal" enctype='multipart/form-data'>
    <input type='hidden' name='pet_no' id='pet_no' value='${petVO.pet_no }'>          

    <div class="form-group">
      <label for="pet_name" class="col-md-2 control-label">이름</label>    
      <div class="col-md-10">
      <input type='text' class="form-control input-md" name='pet_name' id='pet_name' 
                   value=' ${petVO.pet_name }' required="required" style='width: 30%;' placeholder="반려동물 이름">
      </div>
    </div>   
    
     <div class="form-group">
      <label for="pet_age" class="col-md-2 control-label">나이</label>    
      <div class="col-md-10">
      <input type='text' class="form-control input-md" name='pet_age' id='pet_age' 
                   value=' ${petVO.pet_age }' required="required" style='width: 30%;' placeholder="반려동물 나이">
      </div>
    </div>   
                
    <div class="form-group">
      <label for="pet_weight" class="col-md-2 control-label">몸무게</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='pet_weight' id='pet_weight' 
                   value='${petVO.pet_weight }' required="required" style='width: 30%;' placeholder="반려동물 몸무게">
      </div>
    </div>   

    <div class="form-group">
      <label for="pet_gender" class="col-md-2 control-label">성별</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='pet_gender' id='pet_gender' 
                   value='${petVO.pet_gender }' required="required" style='width: 30%;' placeholder="반려동물 성별">
      </div>
    </div>   

    <div class="form-group">
      <label for="pet_kind" class="col-md-2 control-label">반려동물 종류</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='pet_kind' id='pet_kind' 
                   value='${petVO.pet_kind }' required="required" style='width: 30%;' placeholder="반려동물 종류">
      </div>
    </div>  

    <div class="form-group">
      <label for="pet_specific" class="col-md-2 control-label">특이사항</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='pet_specific' id='pet_specific' 
                   value='${petVO.pet_specific }' required="required" style='width: 80%;' placeholder="특이사항">
      </div>
    </div>   


    <div class="form-group">
      <div class="col-md-12">

      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-info btn-md">저장</button>
        <button type="button" onclick="history.go(-1);" class="btn btn-info btn-md">취소</button>

      </div>
    </div>   
  </FORM>

</DIV> <!-- content END -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</DIV> <!-- container END -->
</body>

</html> 


