<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>

  </head>
  <body class="fixed-header">
<jsp:include page="/menu/top.jsp" flush='false' />
	<div id="page-container">
		
		<section id="header-page" class="header-margin-base">
			<div class="skyline">
				<div data-offset="50" class="p1 parallax"></div>
				<div data-offset="25" class="p2 parallax"></div>
				<div data-offset="15" class="p3 parallax"></div>
				<div data-offset="8"  class="p4 parallax"></div>
				<span class="cover"></span>
				<div class="container header-text">
					<div><h1 class="title">Article details</h1></div>
					<div><h2 class="sub-title">Lorem ipsum dolor etur ats adipiscing elit justo</h2></div>
				</div>
			</div>
			<div id="breadcrumb">
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-home"></i></a></li>
						<li><a href="#">Pages</a></li>
						<li class="active">Article</li>
					</ol>
				</div>
			</div><!-- /#breadcrumb -->
			<span class="cover"></span>
		</section><!-- /#header -->

		<section id="blog">

			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-9">
						<div class="blog-list blog-detail">
							<h2 class="title"><a href="#">Making this the first true genator</a></h2>
							<div class="social">
								<span class="date">15<span>Mar</span></span>
								<a href="#"><i class="fa fa-heart-o"></i><span>654</span></a>
								<a href="#"><i class="fa fa-eye"></i><span>92435</span></a>
								<a href="#"><i class="fa fa-comments"></i><span>69</span></a>
							</div>
							<div class="image">
								<img src="http://placehold.it/1280x680/bbbbbb/ffffff" alt="Image Sample" class="img-responsive" />
							</div>
							<h3 class="subtitle">Internet tend to repeat predefined chunks.</h3>
							<div class="text">
								Morbi nisl augue, hendrerit vitae posuere id, scelerisque vestibulum orci. Curabitur diam dolor, convallis vitae blandit a, fringilla id massa. In ornare ante diam, eget rutrum libero varius nec. Praesent efficitur velit erat, vel sodales eros faucibus vel. Sed lacus massa, convallis non neque porttitor, porttitor egestas nulla.<br /><br />
								Nulla aliquet neque tortor, vitae dictum mauris hendrerit quis. Nam nulla purus, sollicitudin vitae leo vitae, mattis pharetra elit. Nulla quis massa laoreet, elementum diam eget, hendrerit risus. Nullam mattis mi ut urna feugiat, sit amet auctor metus malesuada. Mauris commodo sapien leo, eget commodo eros faucibus sit amet.<br /><br />
								<div role="alert" class="alert with-icon alert-success"><i class="icon fa fa-check"></i> Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br />Quisque vulputate turpis</div>
								<em>Fusce finibus odio ac nisl semper, at interdum sapien tristique. Sed velit purus, consequat non tellus eget, viverra facilisis turpis. Aliquam et massa nec tortor vulputate efficitur sed quis metus. Vestibulum et massa vel turpis vehicula elementum. Vestibulum laoreet auctor diam et dictum.</em><br /><br />
								Mauris gravida feugiat euismod. Etiam rutrum justo sed molestie commodo. Cras auctor posuere metus ut feugiat. Pellentesque lobortis mauris id commodo facilisis. Mauris nec enim diam. Praesent auctor scelerisque arcu sed iaculis. Morbi mattis neque eu justo fringilla scelerisque ut facilisis risus. Proin imperdiet erat tellus, non viverra dui condimentum eget. Nullam at enim id elit semper scelerisque. Etiam lorem ex, semper sed magna sed, molestie interdum ante. Donec blandit nisl mauris, nec placerat ante sodales quis.
							</div>
						</div><!-- /.blog-list -->

						<div id="comments">
							<h2 class="title-comment">Comments <span class="total-comment">4</span></h2>
							<div class="medialist">
								<div class="media">
									<div class="media-left">
										<a href="#">
											<img class="media-object" src="http://placehold.it/512/bbbbbb/ffffff" alt="Image sample" />
										</a>
									</div>
									<div class="media-body">
										<div class="comment-line">
											<h4 class="media-heading">
												Manuel Lawrence
												<span class="date-comment">1 February at 22:03</span> 
												<button class="reply"><i class="fa fa-share-square-o"></i></button>
											</h4>
											<b>Lorem ipsum dolor sit amet, consectetur adipiscing elit</b>
											Aliquam at maximus nibh. Nunc odio dolor, cursus rutrum lorem vel, rutrum faucibus risus. Duis id imperdiet mauris, eget lobortis urna. Donec efficitur, tellus sed dapibus consequat, nulla sapien accumsan ligula, sollicitudin congue est magna non dui. Sed malesuada convallis est, et laoreet sem accumsan at. Ut vestibulum eleifend urna, nec sodales lorem rhoncus quis. Nulla imperdiet mattis nisl sit amet cursus. Nullam malesuada, lorem ac commodo finibus, ipsum eros fermentumet euismod ultricies.									
										</div>
									</div>
									</div>
									<div class="media">
										<div class="media-left">
											<a href="#">
												<img class="media-object" src="http://placehold.it/512/bbbbbb/ffffff" alt="Image sample" />
											</a>
										</div>
										<div class="media-body">
											<div class="comment-line">
												<h4 class="media-heading">
													Ruth Stone
													<span class="date-comment">2 February at 22:36</span> 
													<button class="reply"><i class="fa fa-share-square-o"></i></button>
												</h4>
												<b>Morbi mattis neque eu justo fringilla</b>
												Scelerisque ut facilisis risus. Proin imperdiet erat tellus, non viverra dui condimentum eget. Nullam at enim id elit semper scelerisque. Etiam lorem ex, semper sed magna sed, molestie interdum ante. Donec blandit nisl mauris, nec placerat ante sodales quis.
											</div>
											<div class="media">
												<div class="media-left">
													<a href="#"><img class="media-object" src="http://placehold.it/512/bbbbbb/ffffff" alt="Image sample" /></a>
												</div>
												<div class="media-body nested">
													<div class="comment-line">
														<h4 class="media-heading">
															Jean Medina
															<span class="date-comment">8 February at 22:40</span> 
														</h4>
														Mauris eu ipsum porta, rhoncus mi eget, vehicula est. Nulla condimentum condimentum dapibus. Nullam at enim id elit semper scelerisque. Etiam lorem ex, semper sed magna sed, molestie interdum ante. Donec blandit nisl mauris, nec placerat ante sodales quis.												
													</div>
												</div>
											</div>
									</div>
								</div>
								<div class="media">
									<div class="media-left">
										<a href="#">
											<img class="media-object" src="http://placehold.it/512/bbbbbb/ffffff" alt="Image sample" />
										</a>
									</div>
									<div class="media-body">
										<div class="comment-line">
											<h4 class="media-heading">
												Margaret Smith
												<span class="date-comment">4 February at 16:52</span> 
												<button class="reply"><i class="fa fa-share-square-o"></i></button>
											</h4>
											Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.							
										</div>
									</div>
								</div>
							</div>
							<h3 class="title-form"><i class="icon fa fa-comment"></i> Leave a Comment</h3>
							<form class="form-large grey-color" action="#" method="post">
								<div class="row">
									<div class="col-md-6 col-sm-6 col-xs-12">
										<label for="name">Name</label>
										<input type="text" placeholder="Name .." name="name" id="name" class="margin-bottom form-control">
									</div>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<label for="email">Email</label>
										<input type="text" placeholder="Email .." name="email" id="email" class="margin-bottom form-control">
									</div>
									<div class="col-md-12">
										<label for="text-message">Message</label>
										<textarea name="text-message" id="text-message" rows="4" class="margin-bottom form-control"></textarea>
									</div>
								</div>
								<input type="submit" class="btn btn-default" value="Send Comment">
							</form>			
						</div><!-- /. end-comment -->

					</div>
					
						<div class="section-title line-style">
							<h3 class="title">Blog Categories</h3>
						</div>
						<ul class="category-list">
							<li><a href="#">April 2015</a></li>
							<li class="active"><a href="#">March 2015</a></li>
							<li><a href="#">February 2015</a></li>
							<li><a href="#">November 2014</a></li>
							<li><a href="#">October 2014</a></li>
							<li><a href="#">September 2014</a></li>
							<li><a href="#">August 2014</a></li>
							<li class="has-submenu">
								<a href="#">2013</a>
								<ul class="category-list">
									<li><a href="#">December 2013</a></li>
									<li><a href="#">November 2013</a></li>
									<li><a href="#">October 2013</a></li>
								</ul>
							</li>
						</ul><!-- /.category-list -->

						<div class="section-title line-style">
							<h3 class="title">Post Archive</h3>
						</div>
						<ul class="category-list">
							<li><a href="#">Architecture</a></li>
							<li><a href="#">Apartments</a></li>
							<li><a href="#">Design</a></li>
							<li class="has-submenu">
								<a href="#">Do it yourself</a>
								<ul class="category-list">
									<li><a href="#">Housing</a></li>
									<li><a href="#">Agency</a></li>
									<li><a href="#">Apartements</a></li>
								</ul>
							</li>
							<li><a href="#">Interior</a></li>
							<li><a href="#">Trends</a></li>
						</ul><!-- /.category-list -->

						<div class="section-title line-style">
							<h3 class="title">Popular Post</h3>
						</div>

						<div class="recent-post">
							<a class="image image-fill" href="blog-detail.html">
								<img alt="Image Sample" src="http://placehold.it/1280x680/bbbbbb/ffffff">
							</a><!-- /.image -->
							<div class="body">
								<span class="title">Cras varius elementum</span>
								<span class="date">March 22, 2015 - 5 Comments</span>
								<div class="text">
									<p>Lorem ipsum dolor amet donec, collentesque ullamcorper.</p>
								</div><!-- /.text -->
								<input type="submit" class="button-read button-read btn btn-default" value="Read now" name="submit" id="submit">	
							</div><!-- /.body -->
						</div><!-- recent-post -->

						<div class="recent-post">
							<a class="image image-fill" href="blog-detail.html">
								<img alt="Image Sample" src="http://placehold.it/1280x840/bbbbbb/ffffff">
							</a><!-- /.image -->
							<div class="body">
								<span class="title">Ante egestas venenatis</span>
								<span class="date">March 19, 2015 - 2 Comments</span>
								<div class="text">
									<p>Consectetur adipiscing. Quam pellentesque ut fermentum.</p>
								</div><!-- /.text -->
								<input type="submit" class="button-read button-read btn btn-default" value="Read now">	
							</div><!-- /.body -->
						</div><!-- recent-post -->

						<div class="section-title line-style">
							<h3 class="title">Tags</h3>
						</div>
						<div id="filter-box">
							<a href="#" class="filter">Music <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Recipes <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Landscape <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Graphic Design <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Photography <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Videos <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Wild Life <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Scenery <i class="fa fa-times"></i></a>
							<a href="#" class="filter">News <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Web Design <i class="fa fa-times"></i></a>
							<a href="#" class="filter">Models <i class="fa fa-times"></i></a>
						</div><!-- /.filter-box -->
					</div>
				</div>
			</div>

		</section>

		<footer id="footer-page" class="section-color">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 col-md-3">
						<span class="title with-icon">
							<img class="logo-footer" src="images/mini-logo-x1.png" alt="logo" />
							Shortly About Us
						</span>
						<span class="text">
							There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration inble. If you are of going.
						</span>
					</div>
					<div class="col-sm-6 col-md-3">
						<span class="title">CALL US NOW</span>
						<span class="phone"><i class="fa fa-phone"></i> (011)-8800-555</span>
						<span class="address">
						</span>
						339 Broadway Ave, <strong>New York</strong><br />
						<i class="fa fa-map-marker"></i> NY 10013, USA
					</div>
					<div class="hidden-xs hidden-sm col-md-3">
						<span class="title">Extras</span>
						<ul class="link-extra">
							<li><a href="#">ProHome Mobile Apps</a></li>
							<li><a href="#">Market Guide</a></li>
							<li><a href="#">ProHome&reg; Magazine</a></li>
							<li><a href="#">More Resources</a></li>
						</ul>
					</div>
					<div class="col-sm-6 col-md-3">
						<span class="title">Our Newsletter</span>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eu condimentum neque.
						<div class="newsletter-box">
						  <input type="text" class="form-control" placeholder="Your email">
						  <button class="btn btn-default send" type="button"><i class="fa fa-envelope-o"></i></button>
						</div><!-- /input-group -->
					</div>
				</div>
			</div>
			<div class="credits">
				<div class="container">
					<div class="row">
						<div class="hidden-xs col-md-6 credits-text">Copyright 2015 <b>ProHome</b> | All Rights Reserved | Designed By AndyLab</div>
						<div class="col-md-6">
							<ul class="social-icons">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>

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

	<script	src="script/jquery.min.js"></script>		<!-- jQuery	(necessary for Bootstrap's JavaScript plugins) -->
	<script	src="script/jquery-ui.min.js"></script>		<!-- jQuery	UI is a	curated	set	of user	interface interactions,	effects, widgets, and themes -->
	<script	src="script/bootstrap.min.js"></script>		<!-- Include all compiled plugins (below), or include individual files as needed -->

	<script	src="script/vendor/mmenu/mmenu.min.all.js"></script>					<!-- Menu Responsive -->
	<script	src="script/vendor/animation-wow/wow.min.js"></script>					<!-- Animate Script	-->
	<script src="script/vendor/labelauty/labelauty.min.js"></script>					<!-- Checkbox Script -->
	<script	src="script/vendor/parallax/parallax.min.js"></script>						<!-- Parallax Script -->
	<script	src="script/vendor/images-fill/imagesloaded.min.js"></script>			<!-- Loaded	image with ImageFill -->
	<script src="script/vendor/images-fill/imagefill.min.js"></script>					<!-- ImageFill Script -->
	<script	src="script/vendor/easydropdown/jquery.easydropdown.min.js"></script>	<!-- Select	list Script	-->

	<script	src="script/custom.js"></script>		<!-- Custom	Script -->

  </body>


