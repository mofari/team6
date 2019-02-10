<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- 화면 상단 메뉴 -->
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>PROHOME - Responsive Real Estate Template</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">                            <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/font-awesom/css/font-awesome.min.css">  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/mmenu/jquery.mmenu.all.css" />          <!-- Menu Responsive -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/animate-wow/animate.css">               <!-- Animation WOW -->

 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/flipclock/flipclock.css">               <!-- Flip Countdown -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/labelauty/labelauty.css">               <!-- Checkbox form Style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/nouislider/nouislider.min.css">         <!-- Slider Price -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/vendor/easydropdown/easydropdown.css">         <!-- Select form Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ui-spinner.css">                               <!-- Spinner -->
    

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">                                     <!-- Include Menu stylesheet -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">                                   <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/media-query.css">                              <!-- Media Query -->

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

  <script src="${pageContext.request.contextPath}/resources/script/modernizr.min.js"></script> <!-- Modernizr -->

  </head>
  

<header class="menu-base" id="header-container-box">
      <div class="info"><!-- info -->
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <a href="#mobile-menu" id="mobile-menu-button" class="visible-xs"><i class="fa fa-bars"></i></a>
              <a href="call:1-800-555-1234" class="hidden-xs"><i class="icon fa fa-phone"></i> (011)-8800-555</a>
              <a href="#" data-section="modal-contact" data-target="#modal-contact" data-toggle="modal" class="hidden-xs"><i class="icon fa fa-envelope-o"></i> Info</a>
            </div>
            <div id="login-pan" class="col-md-6 hidden-xs">
              <a href="#" data-toggle="modal" data-target=".login-modal" data-section="sign-in"><i class="icon fa fa-pencil-square-o"></i> Sign up</a>
              <a href="#" data-toggle="modal" data-target=".login-modal" data-section="login"><i class="icon fa fa-user user"></i> Login</a>
            </div>
          </div>
        </div>      
      </div><!-- /.info -->
      <div class="logo hidden-xs">
        <a href="${pageContext.request.contextPath}/index.jsp"><img id="logo-header" src="${pageContext.request.contextPath}/resources/images/logo-lovepet3_2.png" alt="Logo" /></a>
      </div><!-- /.logo -->
      <div class="menu-navbar">
        <div class="container" id="menu-nav">
          <nav id="navigation">
          <ul>
            <li class="submenu">
              <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
            </li>
            <li class="has_submenu"><a href="#">카테고리</a>
            <ul>
                <li>
                  <a href="${pageContext.request.contextPath}/category/list.do">리뷰/상품 카테고리</a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/qna/cate_qna.jsp">Q&A 카테고리</a>
                </li>
              </ul>
            </li>
            <li class="has_submenu"><a href="#">리뷰</a>
              <ul>
                <li>
                  <a href="${pageContext.request.contextPath}/review/list.do?category_no=1">강아지</a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/review/list.do?category_no=2">고양이</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/review/list.do?category_no=3">기타</a></li>
                
              </ul>
            </li>
            <li class="current-menu-item submenu">
              <a href="${pageContext.request.contextPath}/product/list.do">상품</a>
            </li>
            <li class="has_submenu">
              <a href="#">다이어리</a>
                 <ul>
                <li>
                  <a href="${pageContext.request.contextPath}/diary/list_paging.do?category_no=1">강아지</a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/diary/list_paging.do?category_no=2">고양이</a>
                </li>
                <li><a href="${pageContext.request.contextPath}/diary/list_paging.do?category_no=3">기타</a></li>
              </ul>
            </li>
            <li class="current-menu-item submenu">
              <a href="${pageContext.request.contextPath}/event/create.do">이벤트</a>
              </li>
              <li class="has_submenu"><a href="#">관리</a>
                <ul>
                <li><a href="${pageContext.request.contextPath}/mnf/list.do">제조사</a></li>
                <li><a href="${pageContext.request.contextPath}/country/list.do">제조국</a></li>
                <li><a href="${pageContext.request.contextPath}/proreport/list.do">상품수정 요청</a></li>
                </ul>
              </li>         
              <li class="has_submenu"><a href="#">Q&A</a>
                <ul>
                <li><a href="${pageContext.request.contextPath}/qna/qna_list.do?qnacategory_no=1">상품 문의</a></li>
                <li><a href="${pageContext.request.contextPath}/qna/qna_list.do?qnacategory_no=2">리뷰 문의</a></li>
                </ul>
              </li>               
            </ul>
          </nav>
        </div>
      </div><!-- /.menu -->
      <a href="#" class="fixed-button top"><i class="fa fa-chevron-up"></i></a>
      <a href="#" class="hidden-xs fixed-button email" data-toggle="modal" data-target="#modal-contact" data-section="modal-contact"><i class="fa fa-envelope-o"></i></a>
    </header>