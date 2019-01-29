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
        <a href="#"><img id="logo-header" src="${pageContext.request.contextPath}/resources/images/logo-lovepet3_2.png" alt="Logo" /></a>
      </div><!-- /.logo -->
      <div class="menu-navbar">
        <div class="container" id="menu-nav">
          <nav id="navigation">
            <ul>
              <li class="has_submenu">
                <a href="#">Home</a>
                <ul>
                  <li><a href="index-property-slide.html">carousel Property</a></li>
                  <li class="has_submenu">
                    <a href="#">carousel</a>
                    <ul>
                      <li><a href="index-carousel.html">Menu Base</a></li>
                      <li><a href="index-carousel-v2.html">Menu V2</a></li>
                      <li><a href="index-carousel-v3.html">Menu V3</a></li>
                      <li><a href="index-carousel-v4.html">Menu V4</a></li>
                      <li><a href="index-carousel-v5.html">Menu V5 + FullHeight</a></li>
                    </ul>
                  </li>
                  <li class="has_submenu">
                    <a href="#">Interactive Map</a>
                    <ul>
                      <li><a href="index-map.html">Menu Base</a></li>
                      <li><a href="index-map-v2.html">Menu V2</a></li>
                      <li><a href="index-map-v3.html">Menu V3</a></li>
                      <li><a href="index-map-v4.html">Menu V4</a></li>
                      <li><a href="index-map-v5.html">Menu V5 + FullHeight</a></li>
                    </ul>
                  </li>
                  <li class="has_submenu">
                    <a href="#">carousel + Search</a>
                    <ul>
                      <li><a href="index-search.html">Menu Base</a></li>
                      <li><a href="index-search-v2.html">Menu V2</a></li>
                      <li><a href="index-search-v3.html">Menu V3</a></li>
                      <li><a href="index-search-v4.html">Menu V4</a></li>
                      <li><a href="index-search-v5.html">Menu V5 + FullHeight</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="has_submenu">
                <a href="#">Properties</a>
                <ul>
                  <li><a href="new-property.html">Create new Property</a></li>
                  <li><a href="property-detail.html">Property Detail</a></li>
                  <li class="has_submenu">
                    <a href="#">Masonry Listing</a>
                    <ul>
                      <li><a href="properties-listing-2c.html">Listing 2 column</a></li>
                      <li><a href="properties-listing.html">Listing 3 Column</a></li>
                    </ul>
                  </li>
                  <li class="has_submenu">
                    <a href="properties-listing-grid.html">Grid Listing</a>
                    <ul>
                      <li><a href="properties-listing-grid-rc.html">Listing Right column</a></li>
                      <li><a href="properties-listing-grid-lc.html">Listing Left Column</a></li>
                    </ul>
                  </li>
                  <li class="has_submenu">
                    <a href="#">Lines Listing</a>
                    <ul>
                      <li><a href="properties-listing-lines-rc.html">Listing Right column</a></li>
                      <li><a href="properties-listing-lines-lc.html">Listing Left Column</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="has_submenu"><a href="#">Pages</a>
                <ul>
                  <li class="has_submenu">
                    <a href="#">Gallery</a>
                    <ul>
                      <li><a href="gallery.html">Isotope</a></li>
                      <li><a href="gallery-v2.html">Masonry</a></li>
                      <li><a href="gallery-v3.html">Masonry + Isotope</a></li>
                    </ul>
                  </li>
                  <li class="has_submenu">
                    <a href="#">Contact</a>
                    <ul>
                      <li><a href="contact.html">Contact V1</a></li>
                      <li><a href="contact-v2.html">Contact V2</a></li>
                      <li><a href="contact-v3.html">Contact V3</a></li>
                    </ul>
                  </li>
                  <li><a href="faq.html">FAQ</a></li>
                  <li><a href="left-sidebar.html">Left Sidebar</a></li>
                  <li><a href="right-sidebar.html">Right Sidebar</a></li>
                  <li><a href="shortcodes.html">Shortcodes</a></li>
                  <li class="has_submenu">
                    <a href="#">Timeline</a>
                    <ul>
                      <li><a href="timeline.html">Timeline</a></li>
                      <li><a href="timeline-v2.html">Parallax Timeline</a></li>
                    </ul>
                  </li>
                  <li class="has_submenu">
                    <a href="#">Pricing Plans</a>
                    <ul>
                      <li><a href="pricing.html">Pricing</a></li>
                      <li><a href="pricing-v2.html">Pricing V2</a></li>
                    </ul>
                  </li>
                  <li><a href="terms-conditions.html">Terms &amp; Conditions</a></li>
                  <li><a href="comingsoon.html">Coming Soon</a></li>
                  <li class="has_submenu">
                    <a href="#">Error Pages</a>
                    <ul>
                      <li><a href="401.html">401</a></li>
                      <li><a href="403.html">403</a></li>
                      <li><a href="404.html">404</a></li>
                      <li><a href="500.html">500</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
              <li class="has_submenu">
                <a href="#">Agents</a>
                <ul>
                  <li><a href="create-agency.html">Create Agency</a></li>
                  <li class="has_submenu">
                    <a href="#">Agents Listing</a>
                    <ul>
                      <li><a href="agents-listing.html">Agents Listing</a></li>
                      <li><a href="agents-listing-v2.html">Agents Listing V2</a></li>
                      <li><a href="agents-listing-v3.html">Agents Listing V3</a></li>
                    </ul>
                  </li>
                  <li><a href="agent-detail.html">Agent Detail</a></li>
                  <li><a href="agencies-listing.html">Agencies Listing</a></li>
                  <li><a href="agency-detail.html">Agency Detail</a></li>
                </ul>
              </li>
              <li class="has_submenu">
                <a href="#">User Pages</a>
                <ul>
                  <li><a href="invoice-print.html">Invoice</a></li>
                  <li><a href="profile.html">Profile</a></li>
                  <li><a href="my-properties.html">My Properties</a></li>
                  <li><a href="bookmarked.html">Bookmarked Properties</a></li>
                  <li><a href="create-account.html">Create Account</a></li>
                  <li><a href="sign-in.html">Sign In</a></li>
                  <li><a href="login.html">Login page</a></li>
                </ul>
              </li>
              <li class="current-menu-item submenu">
              <a href="${pageContext.request.contextPath}/event/list_event_paging.do">이벤트</a>
              </li>
              <li class="has_submenu"><a href="#">Blog</a>
                <ul>
                  <li><a href="blog.html">blog V1</a></li>
                  <li><a href="blog-v2.html">blog V2</a></li>
                  <li><a href="blog-v3.html">blog V3</a></li>
                  <li><a href="blog-detail.html">blog Details</a></li>
                  <li><a href="blog-detail-full.html">blog Details V2</a></li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
      </div><!-- /.menu -->
      <a href="#" class="fixed-button top"><i class="fa fa-chevron-up"></i></a>
      <a href="#" class="hidden-xs fixed-button email" data-toggle="modal" data-target="#modal-contact" data-section="modal-contact"><i class="fa fa-envelope-o"></i></a>
    </header>
