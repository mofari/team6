<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>PROHOME - Responsive Real Estate Template</title>

	<link rel="stylesheet" href="../css/bootstrap.min.css">                            <!-- Bootstrap -->
    <link rel="stylesheet" href="../css/vendor/font-awesom/css/font-awesome.min.css">  <!-- Font Awesome -->
	<link rel="stylesheet" href="../css/vendor/mmenu/jquery.mmenu.all.css" />          <!-- Menu Responsive -->
	<link rel="stylesheet" href="../css/vendor/animate-wow/animate.css">               <!-- Animation WOW -->

    <link rel="stylesheet" href="../css/vendor/labelauty/labelauty.css">               <!-- Checkbox form Style -->

	<link rel="stylesheet" href="../css/menu.css">                                     <!-- Include Menu stylesheet -->
	<link rel="stylesheet" href="../css/custom.css">                                   <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="../css/media-query.css">                              <!-- Media Query -->

	<!-- Use Iconifyer to generate all the favicons and touch icons you need: http://iconifier.net -->
	<link rel="shortcut icon" href="images/favicon/favicon.ico" type="image/x-icon" />
	<link rel="apple-touch-icon" href="images/favicon/apple-touch-icon.png" />
	<link rel="apple-touch-icon" sizes="57x57" href="images/favicon/apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon" sizes="72x72" href="images/favicon/apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon" sizes="76x76" href="images/favicon/apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon" sizes="114x114" href="images/favicon/apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon" sizes="120x120" href="images/favicon/apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon" sizes="144x144" href="images/favicon/apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon" sizes="152x152" href="images/favicon/apple-touch-icon-152x152.png" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script src="script/modernizr.min.js"></script> <!-- Modernizr -->
  
  <script type="text/javascript">
  	function open_modal(qna_no, qnacategory_no){
  	  $('#qnacategory_no').val(qnacategory_no);
  	  $('#qna_no').val(qna_no);
  	  $("#myModal").modal('show');
  	}
  </script>
  
  </head>
  <body class="fixed-header*">

	<div id="page-container">
		<c:import url="/menu/top2.jsp" /> 
     <section id="header-page" class="header-margin-base">
      <div class="skyline">
        <div data-offset="50" class="p1 parallax"></div>
        <div data-offset="25" class="p2 parallax"></div>
        <div data-offset="15" class="p3 parallax"></div>
        <div data-offset="8"  class="p4 parallax"></div>
        <span class="cover"></span>
        <div class="container header-text">
          <div><h1 class="title">Q&A</h1></div>
          <div><h2 class="sub-title">궁금한 점을 질문해주세요!</h2></div>
        </div>
      </div>
      <div id="breadcrumb">
        <div class="container"> 
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">Q&A</a></li>
            <li style="float:right;"><button type="button" onclick="location.href='./create.do'" class="btn btn-default btn-sm">등록</button></li>
          </ol>
        </div>
      </div><!-- /#breadcrumb -->
      <span class="cover"></span>
    </section><!-- /#header -->
		<section id="user-profile">
			<div class="container"> 
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="section-title line-style no-margin">
							<h3 class="title">질문과 답변</h3>
						</div>
						<div class="table-responsive property-list">
							<table class="table-striped table-hover">
							  <thead>
								<tr>
									<th style="text-align:center;" class="hidden-xs">&nbsp;</th>
									<th style="text-align:center;">제목</th>
									<th class="hidden-xs" style="text-align:center;">닉네임</th>
									<th class="hidden-xs hidden-sm" style="text-align:center;">등록날짜</th>
									<th class="hidden-xs" style="text-align:center;">공개 여부</th>
								</tr> 
							  </thead>
							  <tbody> 
                <c:forEach var="qnaVO" items="${list }">
								<tr>
                <c:choose>
                <c:when test="${qnaVO.qna_ansnum == 0 }"> <!-- 부모글인 경우 -->
                  <th class="hidden-xs" style="text-align:center;">&nbsp;&nbsp;질문</th>
                </c:when>
                <c:when test="${qnaVO.qna_ansnum > 0}">    <!-- 답변글인 경우 -->
                  <th class="hidden-xs" style="text-align:center;"><font color="#1fb7a6">답변</font></th>
                </c:when> 
              </c:choose>   
              <c:choose>
                   <c:when test="${qnaVO.qna_visible == 'Y'}"><!-- 공개글 -->
                    <td style="text-align:center;">
                      <a href="./read.do?qna_no=${qnaVO.qna_no}&qnacategory_no=${qnaVO.qnacategory_no}&nowPage=${param.nowPage}">${qnaVO.qna_title}</a> 
                    </td>
                   </c:when>
                   <c:otherwise><!-- 비공개글 -->
                    <td style="text-align:center;">
                    <a data-toggle="modal" onclick="javascript:open_modal(${qnaVO.qna_no}, ${qnaVO.qnacategory_no });">비공개 글 입니다</a>
                    </td> 
                   </c:otherwise> 
                </c:choose>
									<td class="hidden-xs" style="text-align:center;">${qnaVO.member_nickname }</td>
									<td class="hidden-xs hidden-sm" style="text-align:center;">${qnaVO.qna_date.substring(0, 16)}</td>
                  <c:choose>
                   <c:when test="${qnaVO.qna_visible == 'Y'}"> 
                    <td style="text-align:center;"><span class="label label-success" >공개</span></td>
                   </c:when>
                   <c:otherwise>
                    <td style="text-align:center;"><span class="label label-danger" >비공개</span></td>
                   </c:otherwise> 
                </c:choose>
								</tr>
                
                <!-- 비밀번호 모달 시작 -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
          			<div class="modal-dialog">
          				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
          				<div class="form-container full-fixed">
                    <FORM name='frm' method='POST' action='./qna_pw.do'
                                enctype="multipart/form-data" class="form-horizontal">
                    <input type="hidden" id="qna_no" name="qna_no" value="${qnaVO.qna_no }">
                    <input type="hidden" id="qnacategory_no" name="qnacategory_no" value="${qnaVO.qnacategory_no }">
                    
          						<div id="form-modal-contact" class="box active modal-contact">
          							<h2 class="title">비밀번호 입력</h2>
          							<h3 class="sub-title">해당글은 비밀글입니다. 비밀번호를 입력해주세요</h3>
          							<div class="field">
          								<input class="form-control" name="qna_pw" id="qna_pw" placeholder="비밀번호를 입력해주세요" type="password">
                          <i class="set-privacy fa fa-lock"></i>
          							</div>	
          							<div class="field footer-form text-right">
          								<button type="submit" class="btn btn-default button-form" >확인</button>
          							</div>
          						</div>
                    </FORM>
				          </div>
          			</div><!-- /.modal-dialog -->
          		</div><!-- /.modal -->
                  <!-- 비밀번호 모달 끝 -->
                </c:forEach>
							  </tbody>
							</table>
						</div><!-- /.table-responsive -->
					</div>
				</div>
			</div>
		</section> 

		 <c:import url="/menu/bottom.jsp" />

		<div class="modal fade" id="modal-contact" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>

				<div class="form-container full-fixed">
					<form method="post" action="#">
						<div id="form-modal-contact" class="box active modal-contact">
							<h2 class="title">How can we help?</h2>
							<h3 class="sub-title">Please send us your thoughts by filling out the below form. Comments are solely for internal use. Your address will not be shared with outside parties or used for any other purpose than to respond to your comments.</h3>
							<ul class="object-contact">
								<li><a href="#"><i class="fa fa-code"></i>Suggestion</a></li>
								<li><a href="#"><i class="fa fa-question"></i>Question</a></li>
								<li><a href="#" class="active"><i class="fa fa-bug"></i>Problems</a></li>
								<li><a href="#"><i class="fa fa-comment-o"></i>Feedback</a></li>
							</ul>
							<div class="field">
								<textarea class="form-control" name="message" id="message" placeholder="Your message"></textarea>
							</div>
							<div class="field">
								<input id="short-summary" class="form-control" type="text" name="short-summary" placeholder="Short summary">
								<i class="fa fa-tag"></i>
							</div>
							<div class="field">
								<input id="email-help" class="form-control" type="text" name="email-help" placeholder="Your email">
								<i class="fa fa-envelope-o"></i>
							</div>
							<div class="field footer-form text-right">
								<button type="button" class="btn btn-reverse button-form">Cancel</button>
								<button type="button" class="btn btn-default button-form">Send</button>
							</div>

						</div>
					</form>
				</div>


			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div><!-- /#page-container -->

<c:import url="../menu/js/qna_list_js.jsp" />


  </body>
</html>