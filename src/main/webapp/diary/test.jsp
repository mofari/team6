<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 



<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script src="script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
<script src="script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->

  
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('diary_content');  // <TEXTAREA>태그 id 값
  };

</script>

</head> 

<body class ="fixed-header">
<jsp:include page="/menu/top.jsp" flush='false' />
<DIV id ="page-container" class='container'  style="margin-bottom:20px;">

<section id="header-page" class="header-margin-base">
      <div class="skyline">
        <div data-offset="50" class="p1 parallax"></div>
        <div data-offset="25" class="p2 parallax"></div>
        <div data-offset="15" class="p3 parallax"></div>
        <div data-offset="8"  class="p4 parallax"></div>
        <span class="cover"></span>
        <div class="container header-text">
          <div><h1 class="title">강아지 다이어리♥</h1></div>
          <div><h2 class="sub-title">자신의 강아지를 자랑해보아요~</h2></div>
        </div>
      </div>
      <div id="breadcrumb">
        <div class="container">
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">Diary</a></li>
            <li class="active">${categoryVO.category_title }</li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->
    
<DIV class='content'>     



  <div class='menu_line'></div>
  <DIV class='content' style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do'
               enctype="multipart/form-data" class="form-horizontal">
               
      <input type='hidden' name='category_no' id='category_no' value=' ${param.category_no }'>
      <input type='hidden' name='member_no' id='member_no' value=1>
      
      <div class="section-title line-style no-margin" >
              <h3 class="title">등록</h3>
            </div>
      <div class="form-group">   
        <label for="diary_title" class="col-md-1 control-label" style="">글 제목</label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='diary_title' id='diary_title' value='댕댕이 산책' required="required" style='width: 100%;'>
        </div>
      </div>   
      <div class="form-group">   
        <label for="content" class="col-md-1 control-label">내용</label>
        <div class="col-md-11">
          <textarea class="form-control input-lg" name='diary_content' id='diary_content'  rows='10' >크리스마스에 갔던곳</textarea>
       
        </div>
      </div>
      <div class="form-group">   
        <label for="content" class="col-md-1 control-label">장소</label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='diary_place' id='diary_place' value='한강'>
        </div>
      </div>
      <div class="form-group">   
        <label for="filesMF" class="col-md-1 control-label" style="marigin:0px;">썸네일</label>
        <div class="col-md-11">
          <input type="file" class="form-control input-lg" name='filesMF' id='filesMF' size='40' multiple="multiple">
          <br>
          Preview(미리보기) 이미지는 자동 생성됩니다.
        </div>
      </div>   

      <DIV style='text-align: right;'>
        <button class="btn btn-default signin-button"  type="submit">
        <i class="fa fa-sign-in"></i>등록</button>
        <button class="btn btn-default signout-button" type="button" 
        onclick="location.href='./list.do?category_no=${categoryVO.category_no}'">
        <i class="fa fa-sign-out"></i>취소[목록]</button> 
      </DIV>
    </FORM>
  </DIV>


</DIV> <!-- content END -->

</DIV> <!-- container END -->
 <jsp:include page="/menu/bottom.jsp" flush='false' />
 
  <script src="script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="script/jquery-ui.min.js"></script>   <!-- jQuery UI is a curated set of user interface interactions, effects, widgets, and themes -->
  <script src="script/bootstrap.min.js"></script>   <!-- Include all compiled plugins (below), or include individual files as needed -->

  <script src="script/vendor/mmenu/mmenu.min.all.js"></script>          <!-- Menu Responsive -->
  <script src="script/vendor/animation-wow/wow.min.js"></script>          <!-- Animate Script -->
  <script src="script/vendor/labelauty/labelauty.min.js"></script>          <!-- Checkbox Script -->
  <script src="script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
  <script src="script/vendor/images-fill/imagesloaded.min.js"></script>     <!-- Loaded image with ImageFill -->
  <script src="script/vendor/images-fill/imagefill.min.js"></script>          <!-- ImageFill Script -->
  <script src="script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->

  <script src="script/custom.js"></script>    <!-- Custom Script -->
 
</body>

</html> 

