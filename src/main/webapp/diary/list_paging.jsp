<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>

<script type="text/javascript">
</script>
</head>

<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='container' style='width: 80%;'  style="margin-bottom:20px;">
  
      <a href="#" class="fixed-button top"><i class="fa fa-chevron-up"></i></a>
      <a href="#" class="hidden-xs fixed-button email" data-toggle="modal" data-target="#modal-contact" data-section="modal-contact"><i class="fa fa-envelope-o"></i></a>
 
    
<DIV class='content'>     
<section id="header-page" class="header-margin-base">
<div class="skyline">
        <div data-offset="50" class="p1 parallax"></div>
        <div data-offset="25" class="p2 parallax"></div>
        <div data-offset="15" class="p3 parallax"></div>
        <div data-offset="8"  class="p4 parallax"></div>
        <span class="cover"></span>
        <div class="container header-text">
          <div><h1 class="title">${categoryVO.category_title } 다이어리</h1></div>
          <div><h2 class="sub-title">자신의 애완동물을 자랑해보아요~</h2></div>
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
			</div>
     
      
      
 
   </section> <!-- header  -->
   <section>
   
   <div class="section-title line-style no-margin" >
              <h3 class="title">목록</h3>
     </div>
     
   <ASIDE style='float: right;'>
       <button class="btn btn-default signout-button" type="submit" 
       onclick="javascript:location.reload();">
        새로고침</button> 
        
    <button class="btn btn-default signin-button"  type="button"
    onclick="location.href='./create.do?category_no=${param.category_no}'" >    
        <i class="fa fa-sign-in"></i>등록</button>
      
        </ASIDE>
        
  </section>
  
  <!--  본문 -->
  
  
   <section id="blog">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
          <form name ='frm'  method="get" action="./list_paging.do">
            <input type='hidden' name='category_no' id='category_no' value='${categoryVO.category_no }'>
          <div class= "row"style="">
          <input type='text'   class ="margin form-control" name='word' id='word' value='' style='width: 35%;'>
           <button  class = "btn btn-default signin-button" type='submit'><i class="fa fa-pinterest-p">검색</i></button>
               <c:if test="${param.word.length() > 0}"> 
      
      [${param.word}] 검색 목록(${search_count } 건) 
      <button class="btn btn-default "  type="button"
    onclick="location.href='./list_paging.do?category_no=${param.category_no}'" >    
        <i class="fa fa-sign-in"></i>취소</button>
    </c:if>
           </div>
          <c:forEach var="diaryVO" items="${list }">   <!--  VO 가져와서 리스트에 넣음? -->
          
            <div class="row blog-list" style="border:5px solid #E5E5E5;">
              <div class="col-md-5" style= "padding-top:20px;">
                <div class="social">
                  <span class="date">${diaryVO.diary_no}<span></span></span>
                  <a href="#"><i class="fa fa-heart-o"></i><span>${diaryVO.diary_like}</span></a>
                  <a href="#"><i class="fa fa-eye"></i><span>${diaryVO.diary_cnt }</span></a>
                  <a href="#"><i class="fa fa-comments"></i><span>${diaryVO.diary_rcnt }</span></a>
                </div>
                <c:choose>
                <c:when test="${diaryVO.diary_thumb != ''}">
                  <IMG id='diary_thumb' src='./storage/${diaryVO.diary_thumb }'  style="width: 77%;height: 200px;"> 
                </c:when>
                <c:otherwise>
                   
                  <IMG src='./images/none1.png' style='width: 77%; height: 200px;'>
                </c:otherwise>
              </c:choose>
                <%-- <div class="image image-fill" >
                  <!-- <img src="http://placehold.it/1280x850/bbbbbb/ffffff" alt="Image Sample" /> -->
                         <img src='./storage/${diaryVO.diary_thumb }' alt="Image Sample"  style="width:100%; height: 100%;"/>
                </div> --%>
              </div>
              <div class="col-md-7">
                <%-- <h2 class="subtitle"><a href="blog-detail.html">${diaryVO.diary_title }</a></h2> --%>
                 <h3 class="subtitle"  style="margin-top:20px;">제목 : ${diaryVO.diary_title }</h3><br>
                <h2 class="title" >작성자 : ${diaryVO.member_nickname }</h2>
                <h2 class="title" >등록일 : ${diaryVO.diary_rdate.substring(0, 10) } ${diaryVO.category_no }</h2>
               <div class="text"  id="diary_content" >
               <c:choose>
               <c:when test="${fn:length(diaryVO.diary_content) >59 }">
                 <c:out value="${fn:substring(diaryVO.diary_content,0,60) }"/>...
                 </c:when>
                 <c:otherwise>
                 ${diaryVO.diary_content }  
                 </c:otherwise>
                  </c:choose>
                  </div>
                <input type="button" value="Read now" class="btn btn-default" 
                onclick="location.href='./read.do?diary_no=${diaryVO.diary_no }&category_no= ${diaryVO.category_no}&nowPage=${param.nowPage }' " />
                <div style="float:right;">
              <a href="./update.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}&nowPage=${param.nowPage}"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}&nowPage=${param.nowPage}"><img src="./images/delete.png" title="삭제"  border='0'/></a>
              </div>
             </div> 
             
            </div><!-- /.blog-list -->
            </c:forEach>
            </form>
            </div>
            </div>
            </div>
            
   </section>
     
<!--   <DIV class='menu_line' style='clear: both;'></DIV>  
 <div class="row">
          <div class="col-md-12">
            <ul id="filter-container" class="filter-options">
              <li><a href="#" data-group="all" class="active">All</a></li>
              <li><a href="#" data-group="sale">Sale</a></li>
              <li><a href="#" data-group="commercial">Commercial</a></li>
              <li><a href="#" data-group="mortgage">Mortgage</a></li>
              <li><a href="#" data-group="refinance">Refinance</a></li>
            </ul>       
          </div>
        </div> -->


 
 <!--        <div class ="images-container" id=""> -->
   <%-- <table class="table table-striped" style='width: 100%;'>
      <tbody>
          <c:forEach var="diaryVO" items="${list }">
          <div class="col-xs-12 col-sm-4 col-md-3" data-groups='["refinance"]'  >
          
            <c:choose>
                <c:when test="${diaryVO.diary_thumb != ''}"><a class="image image-fill">
                  <IMG id='diary_thumb' src='./storage/${diaryVO.diary_thumb }'> </a>
                </c:when>
                <c:otherwise>       
                  <IMG src='./images/none1.png' style='width: 220px; height: 80px;'>
                </c:otherwise>
              </c:choose>
              <div>
             <a href="./read.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}">${diaryVO.diary_title} (${diaryVO.diary_cnt})</a>
          </div>
          <div class="col-xs-6 col-sm-4 col-md-3 shuffle_sizer">
          ${diaryVO.member_nickname}
          </div> 
          </div>
          
           
              
            
            
          <tr id ="images-container"> 
            <td style='vertical-align: middle;' class="col-xs-12 col-sm-4 col-md-3">
             <c:choose>
                <c:when test="${diaryVO.diary_thumb != ''}">
                  <IMG id='diary_thumb' src='./storage/${diaryVO.diary_thumb }'> 
                </c:when>
                <c:otherwise>
                   
                  <IMG src='./images/none1.png' style='width: 120px; height: 80px;'>
                </c:otherwise>
              </c:choose>
            </td>
            
            
              
         
          </tr>
          <td style='vertical-align: middle;'>
              <a href="./read.do?diary_no=${diaryVO.diary_no}&category_no=${diaryVO.category_no}">${diaryVO.diary_title} (${diaryVO.diary_cnt})</a>
              <tr>${diaryVO.member_nickname}</tr>  
            </td>  
            
            <td style='vertical-align: middle;'>${diaryVO.diary_rdate.substring(0, 10)}</td> 
            <td style='vertical-align: middle;'>${diaryVO.diary_rcnt}</td>
            <td style='vertical-align: middle;'>${diaryVO.diary_like}</td>
      
        </c:forEach>
        
      </tbody>
    </table>  --%>

    <br><br>
  
  </div>
<DIV class = 'bottom_menu'> ${paging }</DIV>

</DIV> <!-- content END -->


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
