<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String root = request.getContextPath();  // 절대 경로
%> 
  
<!DOCTYPE html>
<html lang="ko">

  <body class="fixed-header">

  <div id="page-container">
    <c:import url="/menu/top.jsp" />
    

    <section id="home-slide" class="header-margin-dual-line">
      <div class="home-slider" data-navigation=".home-slider-nav">
        <div class="crsl-wrap">
          <figure class="crsl-item" data-image="http://placehold.it/1920x1080/bbbbbb/ffffff">
            <div class="container slider-box">
              <div class="content"><h2>There are many variations</h2></div>
              <div class="content"><h1>Real Estate</h1></div>
              <div class="content"><h3>If you are going to use a passage of Lorem Ipsum, you need to be sure anything</h3></div>
            </div>
          </figure>
          <figure class="crsl-item" data-image="http://placehold.it/1920x1080/bbbbbb/ffffff">
            <div class="container slider-box">
              <div class="content"><h2>Curabitur tinunt facilisis ex</h2></div>
              <div class="content"><h1>Home Design</h1></div>
              <div class="content"><h3>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks</h3></div>
            </div>
          </figure>
          <figure class="crsl-item" data-image="http://placehold.it/1920x1080/bbbbbb/ffffff">
            <div class="container slider-box">
              <div class="content"><h2>Uta ultrices lectus</h2></div>
              <div class="content"><h1>Custom Tracker</h1></div>
              <div class="content"><h3>It uses a dictionary of over 200 Latin words, combined with a handful of model</h3></div>
            </div>
          </figure>
          <figure class="crsl-item" data-image="http://placehold.it/1920x1080/bbbbbb/ffffff">
            <div class="container slider-box">
              <div class="content"><h2>Praesent ultricies lorem massa</h2></div>
              <div class="content"><h1>Quick Details</h1></div>
              <div class="content"><h3>Phasellus blandit ultricies vehicula. Proin auctor sapien justo, vitaque velit</h3></div>
            </div>
          </figure>
        </div>
        <p class="home-slider-nav previus">
          <a href="#" class="previous">previous</a>
        </p>
        <p class="home-slider-nav next">
          <a href="#" class="next">next</a>
        </p>
      </div>
    </section>

    <section id="recent-list">
      <div class="section-detail">
        <h1>
          <span>Prohome </span>
          <span id="spinner-show">
            <em class="current">Real Estate</em>
            <span class="next"><span></span></span>
          </span>
          <span>Featured Homes</span>
        </h1>
        <ul id="spinner">
           <li>Clients</li>
           <li>Stellar Service</li>
           <li>Simple Question</li>
           <li>Home Valutation</li>
           <li>Rentals</li>
        </ul>
        <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.</h2>    
      </div>
      <div class="container">
        <div class="list-box-title">
          <span><i class="icon fa fa-plus-square"></i>Recent Listed</span>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="box-ads box-home">
              <a class="hover-effect image image-fill" href="${root}/review/create-account.html">
                <span class="cover"></span>
                <img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                <h3 class="title">59 Paterson Ave</h3>
              </a><!-- /.hover-effect -->
              <span class="price">$ 536.500,00</span>
              <span class="address"><i class="fa fa-map-marker"></i> Hoboken, NJ 07030</span>
              <span class="description">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.</span>
              <dl class="detail">
                <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                <dt class="area">Area:</dt><dd><span>860m2</span></dd>
                <dt class="bed">Beds:</dt><dd><span>3</span></dd>
                <dt class="bath">Baths:</dt><dd><span>2</span></dd>
              </dl><!-- /.detail -->
              <div class="footer">
                <a class="btn btn-reverse" href="property-detail.html">Read now</a>
              </div>
            </div><!-- /.box-home .box-ads -->
          </div><!-- ./col-md-4 -->
          <div class="col-md-4">
            <div class="box-ads box-home">
              <a class="hover-effect image image-fill" href="property-detail.html">
                <span class="cover"></span>
                <img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                <h3 class="title">560 Marshall Dr</h3>
              </a><!-- /.hover-effect -->
              <span class="price">$ 709.000,00</span>
              <span class="address"><i class="fa fa-map-marker"></i> Hoboken, NJ 07056</span>
              <span class="description">Lorem Ipsum available, but the majority have suffered There are many variations of passages by injected humour.</span>
              <dl class="detail">
                <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                <dt class="area">Area:</dt><dd><span>420m2</span></dd>
                <dt class="bed">Beds:</dt><dd><span>4</span></dd>
                <dt class="bath">Baths:</dt><dd><span>1</span></dd>
              </dl><!-- /.detail -->
              <div class="footer">
                <a class="btn btn-reverse" href="property-detail.html">Read now</a>
              </div>
            </div><!-- /.box-home .box-ads -->
          </div><!-- ./col-md-4 -->
          <div class="col-md-4">
            <div class="box-ads box-home">
              <a class="hover-effect image image-fill" href="property-detail.html">
                <span class="cover"></span>
                <img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                <h3 class="title">477 Jersey Ave</h3>
              </a><!-- /.hover-effect -->
              <span class="price">$ 663.500,00</span>
              <span class="address"><i class="fa fa-map-marker"></i> Jersey City, NJ 07302</span>
              <span class="description">Nulla condimentum neque nulla. Sed at ornare lacus, id euismod felis. Aliquam et vulputate tortor. Nunc gravida nunc sed mi bibendum accumsan.</span>
              <dl class="detail">
                <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                <dt class="area">Area:</dt><dd><span>333m2</span></dd>
                <dt class="bed">Beds:</dt><dd><span>6</span></dd>
                <dt class="bath">Baths:</dt><dd><span>2</span></dd>
              </dl><!-- /.detail -->
              <div class="footer">
                <a class="btn btn-reverse" href="property-detail.html">Read now</a>
              </div>
            </div><!-- /.box-home .box-ads -->
          </div><!-- ./col-md-4 -->
        </div>
        <div class="list-box-title">
          <span><i class="icon fa fa-plus-square"></i>Featured Properties</span>
        </div>
        <div class="row">
          <div class="col-md-4">
            <div class="box-ads box-home">
              <a class="hover-effect image image-fill" href="property-detail.html">
                <span class="cover"></span>
                <img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                <h3 class="title">403 Bloomfield St</h3>
              </a><!-- /.hover-effect -->
              <span class="price">$ 772.000,00</span>
              <span class="address"><i class="fa fa-map-marker"></i> Hoboken, NJ 07030</span>
              <span class="description">Nunc gravida nunc sed mi bibendum accumsan, condimentum neque nulla. Sed at ornare lacus. Aliquam et vulputate tortor id euismod felis.</span>
              <dl class="detail">
                <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                <dt class="area">Area:</dt><dd><span>165m2</span></dd>
                <dt class="bed">Beds:</dt><dd><span>2</span></dd>
                <dt class="bath">Baths:</dt><dd><span>1</span></dd>
              </dl><!-- /.detail -->
              <div class="footer">
                <a class="btn btn-reverse" href="property-detail.html">Read now</a>
              </div>
            </div><!-- /.box-home .box-ads -->
          </div><!-- ./col-md-4 -->
          <div class="col-md-4">
            <div class="box-ads box-home">
              <a class="hover-effect image image-fill" href="property-detail.html">
                <span class="cover"></span>
                <img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                <h3 class="title">339 Broadway</h3>
              </a><!-- /.hover-effect -->
              <span class="price">$ 988.000,00</span>
              <span class="address"><i class="fa fa-map-marker"></i> New York, NY 10013</span>
              <span class="description">Proin egestas vitae mi eget commodo. Proin purus dignissim porttitous vel accumsan odio. Pulvinarut id . Proin dapibus mollis purus ac luctus.</span>
              <dl class="detail">
                <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                <dt class="area">Area:</dt><dd><span>369m2</span></dd>
                <dt class="bed">Beds:</dt><dd><span>4</span></dd>
                <dt class="bath">Baths:</dt><dd><span>2</span></dd>
              </dl><!-- /.detail -->
              <div class="footer">
                <a class="btn btn-reverse" href="property-detail.html">Read now</a>
              </div>
            </div><!-- /.box-home .box-ads -->
          </div><!-- ./col-md-4 -->
          <div class="col-md-4">
            <div class="box-ads box-home">
              <a class="hover-effect image image-fill" href="property-detail.html">
                <span class="cover"></span>
                <img alt="Sample images" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                <h3 class="title">435 Newark Ave</h3>
              </a><!-- /.hover-effect -->
              <span class="price">$ 631.000,00</span>
              <span class="address"><i class="fa fa-map-marker"></i> Jersey City, NJ 07302</span>
              <span class="description">Mut the majority have suffered alteration in. There are many variations of passages of Lorem Ipsum available, some form, by injected humour.</span>
              <dl class="detail">
                <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                <dt class="area">Area:</dt><dd><span>658m2</span></dd>
                <dt class="bed">Beds:</dt><dd><span>4</span></dd>
                <dt class="bath">Baths:</dt><dd><span>5</span></dd>
              </dl><!-- /.detail -->
              <div class="footer">
                <a class="btn btn-reverse" href="property-detail.html">Read now</a>
              </div>
            </div><!-- /.box-home .box-ads -->
          </div><!-- ./col-md-4 -->
        </div>
      </div>
    </section>

    <section id="service" class="section-color">
      <div class="section-detail">
        <h1>Services</h1>
        <h2>Pellentesque vitae dolor eu lacus lacinia viverra in sed urna. Donec vitae ipsum eu nibh convallis rutrum.</h2>   
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="content-box">
              <i class="icon-box fa fa-street-view"></i>
              <h3>
                <i class="icon-quote fa fa-quote-left"></i>
                Donec dolor
                <i class="icon-quote fa fa-quote-right"></i>
              </h3>
              <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.</h4>          
            </div>
          </div>
          <div class="col-md-4">
            <div class="content-box">
              <i class="icon-box fa fa-bug"></i>
              <h3>
                <i class="icon-quote fa fa-quote-left"></i>
                Elementum dignissim
                <i class="icon-quote fa fa-quote-right"></i>
              </h3>
              <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.</h4>          
            </div>
          </div>
          <div class="col-md-4">
            <div class="content-box">
              <i class="icon-box fa fa-key"></i>
              <h3>
                <i class="icon-quote fa fa-quote-left"></i>
                Dolor sit amet
                <i class="icon-quote fa fa-quote-right"></i>
              </h3>
              <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.</h4>          
            </div>
          </div>
        </div>
      </div>
    </section>


    <section id="recent-listed" data-parallax-speed="-0.3" class="hidden-xs">
      <div class="section-detail">
        <h1>Recent Listed</h1>
        <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.</h2>    
      </div>
      <div class="margin-box">
        <div class="property-slide" data-navigation="#property-slide-nav">
          <div class="crsl-wrap">
            <figure class="crsl-item">
              <div class="box-property-slide">
                <div class="left-block">
                  <span class="title">59 Paterson Ave</span>
                  <span class="description">Mauris ullamcorper magna a dui viverra pulvinar. Phasellus gravida risus eros, eget porta risus auctor at. Vivamus elementum odio nunc, non scelerisque nisi pulvinar vitae. Quisque in sagittis nulla. Aenean tristique purus ut ipsum suscipit laoreet.</span>
                  <dl class="detail">
                    <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                    <dt class="area">Area:</dt><dd><span>560m2</span></dd>
                    <dt class="bed">Beds:</dt><dd><span>5</span></dd>
                    <dt class="bath">Baths:</dt><dd><span>7</span></dd>
                  </dl>
                  <span class="price">$ 1.890.000,00</span>
                  <a href="property-detail.html" class="btn btn-reverse button"><i class="fa fa-search"></i> View</a>
                </div>
                <a href="property-detail.html" class="right-block hover-effect image-fill">
                  <img alt="img sample" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                  <span class="cover"></span>
                  <span class="cover-title">59 Paterson Ave</span>
                </a>
              </div>
            </figure>
            <figure class="crsl-item">
              <div class="box-property-slide">
                <div class="left-block">
                  <span class="title">560 Marshall Dr</span>
                  <span class="description">Proin fermentum, erat tempus ullamcorper vehicula, lacus quam tempor nisi, gravida rutrum arcu justo sed quam. Sed sollicitudin, ligula et rhoncus interdum, odio ex maximus lectus, laoreet mollis velit lectus quis nisl. Sed erat lacus.</span>
                  <dl class="detail">
                    <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                    <dt class="area">Area:</dt><dd><span>330m2</span></dd>
                    <dt class="bed">Beds:</dt><dd><span>9</span></dd>
                    <dt class="bath">Baths:</dt><dd><span>2</span></dd>
                  </dl>
                  <span class="price">$ 1.268.500,00</span>
                  <a href="property-detail.html" class="btn btn-reverse button"><i class="fa fa-search"></i> View</a>
                </div>
                <a href="property-detail.html" class="right-block hover-effect image-fill">
                  <img alt="img sample" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                  <span class="cover"></span>
                  <span class="cover-title">560 Marshall Dr</span>
                </a>
              </div>
            </figure>
            <figure class="crsl-item">
              <div class="box-property-slide">
                <div class="left-block">
                  <span class="title">477 Jersey Ave</span>
                  <span class="description">Morbi molestie mi eu metus gravida, eu sollicitudin neque fermentum. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum tellus orci, dictum eget fringilla at, mollis nec lorem.</span>
                  <dl class="detail">
                    <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                    <dt class="area">Area:</dt><dd><span>210m2</span></dd>
                    <dt class="bed">Beds:</dt><dd><span>6</span></dd>
                    <dt class="bath">Baths:</dt><dd><span>1</span></dd>
                  </dl>
                  <span class="price">$ 758.200,00</span>
                  <a href="property-detail.html" class="btn btn-reverse button"><i class="fa fa-search"></i> View</a>
                </div>
                <a href="property-detail.html" class="right-block hover-effect image-fill">
                  <img alt="img sample" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                  <span class="cover"></span>
                  <span class="cover-title">477 Jersey Ave</span>
                </a>
              </div>
            </figure>
            <figure class="crsl-item">
              <div class="box-property-slide">
                <div class="left-block">
                  <span class="title">403 Bloomfield St</span>
                  <span class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vulputate, nulla ac suscipit blandit, risus nisl vulputate purus, at pharetra lacus odio ut est. Donec nisi est, rutrum in sapien eu, tristique dapibus orci. Duis sagittis faucibus quam ac.</span>
                  <dl class="detail">
                    <dt class="status">Status:</dt><dd><span>Sale</span></dd>
                    <dt class="area">Area:</dt><dd><span>260m2</span></dd>
                    <dt class="bed">Beds:</dt><dd><span>5</span></dd>
                    <dt class="bath">Baths:</dt><dd><span>2</span></dd>
                  </dl>
                  <span class="price">$ 926.949,99</span>
                  <a href="property-detail.html" class="btn btn-reverse button"><i class="fa fa-search"></i> View</a>
                </div>
                <a href="property-detail.html" class="right-block hover-effect image-fill">
                  <img alt="img sample" src="http://placehold.it/1240x745/bbbbbb/ffffff">
                  <span class="cover"></span>
                  <span class="cover-title">403 Bloomfield St</span>
                </a>
              </div>
            </figure>
          </div>
        </div><!-- ./property-slide --> 
        <div id="property-slide-nav" class="nav-box">
          <a href="#" class="previous"></a>
          <a href="#" class="next"></a>
        </div>  
      </div><!-- ./margin-box -->
    </section>

    <section id="recent-news">
      <div class="section-detail">
        <h1>Recent News</h1>
        <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.</h2>    
      </div>
      <div class="container" id="blog">
        <div class="row">
          <div class="col-md-4">
            <div class="blog-list masonry-post">
              <h2 class="title"><a href="blog-detail.html">Praesent moleti ipsum</a></h2>
              <div class="image">
                <img class="img-responsive" alt="Image Sample" src="http://placehold.it/1280x850/bbbbbb/ffffff">
                <div class="social">
                  <span class="date">2<span>Apr</span></span>
                  <a href="#"><i class="fa fa-heart-o"></i><span>654</span></a>
                  <a href="#"><i class="fa fa-eye"></i><span>92435</span></a>
                  <a href="#"><i class="fa fa-comments"></i><span>69</span></a>
                </div>
              </div>
              <div class="text">
                <h3 class="subtitle">Internet tend to repeat prunks.</h3>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent molestie in ippulvinar libero enim, et finibus massa commodo vitae.
              </div>
              <a href="blog-detail.html" class="btn btn-default button-read">Read now</a>
            </div>
          </div>
          <div class="col-md-4">
            <div class="blog-list masonry-post">
              <h2 class="title"><a href="blog-detail.html">Dolor sit amet</a></h2>
              <div class="image">
                <img class="img-responsive" alt="Image Sample" src="http://placehold.it/1280x850/bbbbbb/ffffff">
                <div class="social">
                  <span class="date">18<span>Mar</span></span>
                  <a href="#"><i class="fa fa-heart-o"></i><span>654</span></a>
                  <a href="#"><i class="fa fa-eye"></i><span>92435</span></a>
                  <a href="#"><i class="fa fa-comments"></i><span>69</span></a>
                </div>
              </div>
              <div class="text">
                <h3 class="subtitle">Internet tend to redefined chunks.</h3>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent molestie in ippulvinar libero enim, et finibus massa commodo vitae.
              </div>
              <a href="blog-detail-full.html" class="btn btn-default button-read">Read now</a>
            </div>
          </div>
          <div class="col-md-4">
            <div class="blog-list masonry-post">
              <h2 class="title"><a href="blog-detail.html">Pepeat predefined chunks</a></h2>
              <div class="image">
                <img class="img-responsive" alt="Image Sample" src="http://placehold.it/1280x850/bbbbbb/ffffff">
                <div class="social">
                  <span class="date">15<span>Mar</span></span>
                  <a href="#"><i class="fa fa-heart-o"></i><span>654</span></a>
                  <a href="#"><i class="fa fa-eye"></i><span>92435</span></a>
                  <a href="#"><i class="fa fa-comments"></i><span>69</span></a>
                </div>
              </div>
              <div class="text">
                <h3 class="subtitle">Interno repeat predefined chunks.</h3>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent molestie in ippulvinar libero enim, et finibus massa commodo vitae.
              </div>
              <a href="blog-detail.html" class="btn btn-default button-read">Read now</a>
            </div>
          </div>
        </div>
      </div>
    </section>



    <section id="submit-property" data-parallax-speed="0">
      <span class="overlay"></span>
      <div class="container">
        <div class="section-detail">
          <h1>Submit Property</h1>
          <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dolor, sagittis sed elementum dignissim, lobortis.<br />Dolor nunc vule putateulr ips dol consec.Donec semp ertet.</h2>  
        </div>
        <div class="row text-center">
          <a href="new-property.html" class="btn btn-reverse button-large">Submit Property</a>
        </div>
      </div>
    </section>


    <section id="testimonial">
      <div class="section-detail hidden-xs">
        <h1>Client Testimonials</h1>
      </div>
      <div class="container hidden-xs">
        <div class="row">
          <div class="col-md-12">
            <div class="row feedback-margin">
              <div class="feedback-container" data-navigation="#feedback-nav">
                <div class="crsl-wrap">
                  <figure class="crsl-item">
                    <div class="feeddback-user">
                      <div class="info-user">
                        <span class="avatar">
                          <img src="http://placehold.it/512/bbbbbb/ffffff" alt="Image Sample" class="img-responsive" />
                        </span>
                        <b>Robert Phelps</b>
                        <span>broadway (NY)</span>
                        <span>Age 26 Year</span>
                      </div>
                      <div class="message">
                        <div class="content">
                          <h3 class="title">
                            <i class="icon-quote fa fa-quote-left"></i>
                            Iaculis pharetra velit torquent pellentesque euismod
                            <i class="icon-quote fa fa-quote-right"></i>
                          </h3>
                          <span class="rating">
                            <span>Rating:</span>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </span>
                          <p class="text-container">
                            Aenean nisique purus vulputate suspendisse felis aliquet eu commodo aliquam ut ultricies facilisi eu metus cum<br /><br />Facilisi aenean in penatiblus convallis montes taciti cras sollicitudin semper iniam vestibulum orci convallis malesuada orci pellentesque nascetur massa amet parturient
                          </p>              
                        </div>
                      </div>
                    </div>
                  </figure>
                  <figure class="crsl-item">
                    <div class="feeddback-user">
                      <div class="info-user">
                        <span class="avatar">
                          <img src="http://placehold.it/512/bbbbbb/ffffff" alt="Image Sample" class="img-responsive" />
                        </span>
                        <b>Shawn Mcdonald</b>
                        <span>Boston</span>
                        <span>Age 32 Year</span>
                      </div>
                      <div class="message">
                        <div class="content">
                          <h3 class="title">
                            <i class="icon-quote fa fa-quote-left"></i>
                            Iaculis pharetra velit torquent pellentesque euismod
                            <i class="icon-quote fa fa-quote-right"></i>
                          </h3>
                          <span class="rating">
                            <span>Rating:</span>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </span>
                          <p class="text-container">
                            Aenean nisique purus vulputate suspendisse felis aliquet eu commodo aliquam ut ultricies facilisi eu metus cum<br /><br />Facilisi aenean in penatiblus convallis montes taciti cras sollicitudin semper iniam vestibulum orci convallis malesuada orci pellentesque nascetur massa amet parturient
                          </p>                
                        </div>
                      </div>
                    </div>
                  </figure>
                  <figure class="crsl-item">
                    <div class="feeddback-user">
                      <div class="info-user">
                        <span class="avatar">
                          <img src="http://placehold.it/512/bbbbbb/ffffff" alt="Image Sample" class="img-responsive" />
                        </span>
                        <b>Andrew Waters</b>
                        <span>Paris (FR)</span>
                        <span>Age 26 Year</span>
                      </div>
                      <div class="message">
                        <div class="content">
                          <h3 class="title">
                            <i class="icon-quote fa fa-quote-left"></i>
                            Iaculis pharetra velit torquent pellentesque euismod
                            <i class="icon-quote fa fa-quote-right"></i>
                          </h3>
                          <span class="rating">
                            <span>Rating:</span>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </span>
                          <p class="text-container">
                            Aenean nisique purus vulputate suspendisse felis aliquet eu commodo aliquam ut ultricies facilisi eu metus cum<br /><br />Facilisi aenean in penatiblus convallis montes taciti cras sollicitudin semper iniam vestibulum orci convallis malesuada orci pellentesque nascetur massa amet parturient
                          </p>              
                        </div>
                      </div>
                    </div>
                  </figure>
                  <figure class="crsl-item">
                    <div class="feeddback-user">
                      <div class="info-user">
                        <span class="avatar">
                          <img src="http://placehold.it/512/bbbbbb/ffffff" alt="Image Sample" class="img-responsive" />
                        </span>
                        <b>Diane Hayes</b>
                        <span>Bloomfield (NY)</span>
                        <span>Age 29 Year</span>
                      </div>
                      <div class="message">
                        <div class="content">
                          <h3 class="title">
                            <i class="icon-quote fa fa-quote-left"></i>
                            Iaculis pharetra velit torquent pellentesque euismod
                            <i class="icon-quote fa fa-quote-right"></i>
                          </h3>
                          <span class="rating">
                            <span>Rating:</span>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o"></i>
                          </span>
                          <p class="text-container">
                            Aenean nisique purus vulputate suspendisse felis aliquet eu commodo aliquam ut ultricies facilisi eu metus cum<br /><br />Facilisi aenean in penatiblus convallis montes taciti cras sollicitudin semper iniam vestibulum orci convallis malesuada orci pellentesque nascetur massa amet parturient
                          </p>                
                        </div>
                      </div>
                    </div>
                  </figure>
                </div>
                <div id="feedback-nav" class="nav-box">
                  <a href="#" class="previous"></a>
                  <a href="#" class="next"></a>
                </div>    
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

        <c:import url="/menu/bottom.jsp" />
    
    <div class="modal fade login-modal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
        <div class="login-button-container">
          <a href="#" data-section="login"><i class="fa fa-user"></i></a>
          <a href="#" data-section="sign-in"><i class="fa fa-pencil-square-o"></i></a>
          <a href="#" data-section="recovery"><i class="fa fa-lock"></i></a>
          <a href="#" data-section="setting"><i class="fa fa-cog"></i></a>
        </div><!-- ./login-button-container -->
        <div class="form-container">
          <form method="post" action="#">
            <div id="login" class="box">
              <h2 class="title">Login in to your account</h2>
              <h3 class="sub-title">It is a breach of our terms and conditions to provide username and password details to unauthorised third parties. Unauthorised use may lead to suspension or termination.</h3>
              <div class="field">
                <input id="user-log" name="user-log" class="form-control" type="text" placeholder="Username or email">
                <i class="fa fa-user user"></i>
              </div>
              <div class="field">
                <input id="password-log" name="password-log" class="form-control" type="password" placeholder="Password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field footer-form text-right">
                <span class="remember"><input class="labelauty" type="checkbox" data-labelauty="Keep me signed in" checked /></span>
                <button type="button" class="btn btn-reverse button-form">Reset</button>
                <button type="button" class="btn btn-default button-form">Login</button>
              </div>
            </div> <!-- ./login -->
            <div id="sign-in" class="box">
              <h2 class="title">Sign In</h2>
              <h3 class="sub-title">Create a Free account and discover how you can centralize all communication around a transaction, connect with clients, market your listings, and more. </h3>
              <div class="form-inline">
                <div class="form-group">
                  <input id="user-sign" name="user-sign" class="form-control input-inline margin-right" type="text" placeholder="Username">
                  <i class="fa fa-user user"></i>
                </div>
                <div class="form-group">
                  <input id="email-sign" class="form-control input-inline" type="text" name="email-sign" placeholder="Email">
                  <i class="fa fa-envelope-o"></i>
                </div>
              </div>
              <div class="field">
                <input id="password-sign" class="form-control" type="password" name="password-sign" placeholder="Password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field">
                <input id="re-password-sign" class="form-control" type="password" name="re-password-sign" placeholder="Repeat password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field footer-form text-right">
                <span class="remember"><input class="labelauty" type="checkbox" data-labelauty="I have read the privacy policy." checked /></span>
                <button type="button" class="btn btn-default button-form">Sign in</button>
              </div>
            </div><!-- ./sign-in -->
            <div id="setting" class="box">
              <h2 class="title">Setting profile</h2>
              <h3 class="sub-title">Please note: You won't be able to change your name within the next 60 days. Make sure that you don't add any unusual capitalisation, punctuation, characters or random words. <a href="#">Learn more</a>.</h3>
              <div class="field">
                <input id="username-block" class="form-control" type="text" name="username-block" value="John Doe" disabled>
                <i class="fa fa-user user"></i>
              </div>
              <div class="field">
                <input id="email-setting" class="form-control" type="text" name="email-setting" value="administrator@prohome.com">
                <i class="fa fa-envelope-o"></i>
              </div>
              <div class="field">
                <input id="update-pass" class="form-control" type="password" name="update-pass" placeholder="New password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field">
                <input id="update-repass" class="form-control" type="password" name="update-repass" placeholder="Repeat password">
                <i class="fa fa-ellipsis-h"></i>
              </div>
              <div class="field footer-form text-right">
                <button type="button" class="btn btn-reverse button-form">Cancel</button>
                <button type="button" class="btn btn-default button-form">Update</button>
              </div>
            </div><!-- ./recovery -->
            <div id="recovery" class="box">
              <h2 class="title">Need a new password?</h2>
              <h3 class="sub-title">Enter your email address, and we’ll email you instructions to reset your password.</h3>
              <div class="field">
                <input id="recovery-email" class="form-control" type="text" name="recovery-email" placeholder="Your email">
                <i class="fa fa-envelope-o"></i>
              </div>
              <div class="field footer-form text-right">
                <button type="button" class="btn btn-default button-form">Recovery</button>
              </div>
            </div><!-- ./recovery -->
          </form><!-- ./form-container -->
        </div><!-- ./login-button-container -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

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
 
 
  <script src="<%=root%>/resources/script/jquery.min.js"></script>    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="<%=root%>/resources/script/jquery-ui.min.js"></script>   <!-- jQuery UI is a curated set of user interface interactions, effects, widgets, and themes -->
  <script src="<%=root%>/resources/script/bootstrap.min.js"></script>   <!-- Include all compiled plugins (below), or include individual files as needed -->

  <script src="<%=root%>/resources/script/vendor/mmenu/mmenu.min.all.js"></script>          <!-- Menu Responsive -->
  <script src="<%=root%>/resources/script/vendor/animation-wow/wow.min.js"></script>          <!-- Animate Script -->
  <script src="<%=root%>/resources/script/vendor/labelauty/labelauty.min.js"></script>          <!-- Checkbox Script -->
  <script src="<%=root%>/resources/script/vendor/parallax/parallax.min.js"></script>            <!-- Parallax Script -->
  <script src="<%=root%>/resources/script/vendor/images-fill/imagesloaded.min.js"></script>     <!-- Loaded image with ImageFill -->
  <script src="<%=root%>/resources/script/vendor/images-fill/imagefill.min.js"></script>          <!-- ImageFill Script -->
  <script src="<%=root%>/resources/script/vendor/easydropdown/jquery.easydropdown.min.js"></script> <!-- Select list Script -->
  <script src="<%=root%>/resources/script/vendor/carousel/responsiveCarousel.min.js"></script>    <!-- Carousel Script -->

  <script src="<%=root%>/resources/script/custom.js"></script>    <!-- Custom Script -->

  </body>
</html>