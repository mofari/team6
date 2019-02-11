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
          <span><i class="icon fa fa-plus-square"></i>회원 정보 조회 및 수정</span>
        </div>

  <FORM name='frm' id='frm' method='POST' action='./update.do' 
              onsubmit="return send();" class="form-horizontal">
    <input type='hidden' name='member_no' id='member_no' value='${memberVO.member_no }'>          

    <div class="form-group">
      <label for="member_email" class="col-md-2 control-label">이메일</label>    
      <div class="col-md-10">
      <input type='text' class="form-control input-md" name='member_email' id='member_email' 
                   value=' ${memberVO.member_email }' required="required" style='width: 30%;' placeholder="이메일">
      </div>
    </div>   
    
     <div class="form-group">
      <label for="member_nickname" class="col-md-2 control-label">닉네임</label>    
      <div class="col-md-10">
      <input type='text' class="form-control input-md" name='member_nickname' id='member_nickname' 
                   value=' ${memberVO.member_nickname }' required="required" style='width: 30%;' placeholder="닉네임">
      </div>
    </div>   
                
    <div class="form-group">
      <label for="member_name" class="col-md-2 control-label">성명</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='member_name' id='member_name' 
                   value='${memberVO.member_name }' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   

    <div class="form-group">
      <label for="member_tel" class="col-md-2 control-label">전화번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='member_tel' id='member_tel' 
                   value='${memberVO.member_tel }' required="required" style='width: 30%;' placeholder="전화번호">
      </div>
    </div>   

    <div class="form-group">
      <label for="member_zipcode" class="col-md-2 control-label">우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='member_zipcode' id='member_zipcode' 
                   value='${memberVO.member_zipcode }' required="required" style='width: 30%;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  

    <div class="form-group">
      <label for="member_address" class="col-md-2 control-label">주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='member_address' id='member_address' 
                   value='${memberVO.member_address }' required="required" style='width: 80%;' placeholder="주소">
      </div>
    </div>   

    <div class="form-group">
      <label for="member_address2" class="col-md-2 control-label">상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='member_address2' id='member_address2' 
                   value='${memberVO.member_address2 }' required="required" style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   

    <div class="form-group">
      <div class="col-md-12">

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->

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


