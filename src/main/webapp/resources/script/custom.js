
	"use strict";

	/* SCROLL PAGE
	============================================== */
	$(window).scroll(function() {

		// Header source
		var $headerFixed = $('#header-container-box');
		// HeaderHeight
		var $headerHeight = $('header').height();
		// Menu height
		var $menuHeight = $('#menu-nav').height();
		// Fixed
		$(this).scrollTop() > 170 ? $headerFixed.css({'top': -($headerHeight-$menuHeight)+'px'}) 
			                      : $headerFixed.css({'top': '0px'}) ;
    });





	/* MENU RESPONSIVE
	============================================== */
	$(function() {
		var $menu = $("#navigation").clone();
		$menu.attr( "id", "mobile-menu" );
		$menu.mmenu({
			extensions	: [ 'effect-slide', 'pageshadow' ],
			header		: true,
			searchfield	: true,
			counters	: false
		});
	});





	/* SPINNER
	============================================== */
	$(function() {
		$("#bathroom, #bedroom", document.body).spinner({
			min: 1,
			max: 9
		});
		$("#property-size", document.body).spinner({
			min: 50,
			max: 1000,
			step: 10
		});
	});





	/* CAROUSEL
	============================================== */
	$(document).ready(function($) {
		$('.property-type-slide', '#property-type').carousel({
			visible: 6,
			itemMinWidth: 200,
			speed: 1000
		});
		$('.property-slide', '#recent-listed').carousel({
			visible: 2,
			itemMinWidth: 580,
			itemMargin: 50,
			autoRotate : 7000,
			speed: 1000
		});
		$('.feedback-container', '#testimonial').carousel({
			visible: 1,
			autoRotate : 7000,
			speed: 1000
		});
		$('.my-property', '#agent-page').carousel({
			visible: 4,
			itemMinWidth: 260,
			itemMargin: 20,
			autoRotate : 7000,
			speed: 1000
		});
	});





	/* HOME SLIDER / MAPS
	============================================== */
	var $menuHeight   = parseInt($('header').height(), 10);       // MENU HEIGHT
	var $windowHeight = parseInt($(window).height(), 10);         // WINDOW HEIGHT
	var $pageHeight   = $windowHeight - $menuHeight;              // AVAILABLE HEIGHT
	$('.fixed-height', document.body).css({'height': $pageHeight+'px'})          // SETTING HEIGHT
	$('.fixed-height-map', document.body).css({'height': ($pageHeight-78)+'px'}) // SETTING HEIGHT

	var $homeSlider = $('.home-slider', '#home-slide');
	$(document).ready(function($) {
		$homeSlider.carousel({ visible: 1, autoRotate : 7000, speed: 1000});
		$homeSlider.find('figure').each(function(index, object){
			var $image = $(this).data('image');
			$(this).css({'background': 'url('+$image+')'});
		});
	});





	/* RANGE SLIDER
	============================================== */
	var $priceRange = $("#price-range");
	if($priceRange.length) {
		$priceRange.noUiSlider({
			start: [ 250000, 745000 ],
			behaviour: 'drag',
			step: 5000,
			connect: true,
			range: {
				'min': 70000,
				'max': 1000000
			}
		});
		$priceRange.Link('lower').to( $('#price-value-min') )
		$priceRange.Link('upper').to( $('#price-value-max') );
	}





	/* CHECKBOX STYLE
	============================================== */
	$(document).ready(function(){
		$(".labelauty").labelauty();
	});





	/* SELECT STYLE
	============================================== */
	$(function(){
		var $selects = $('select');
		$selects.easyDropDown({
			onChange: function(selected){}
		});
	});





	/* PARALLAX PAGES BACKGROUND
	============================================== */
	$("#submit-property, #recent-listed, #skyline, .team, #timeline.parallax").parallax();





	/* PARALLAX HEADER PAGES
	============================================== */
	$(window).on('mousemove', function(e) {
			var w = $(window).width();
			var h = $(window).height();
			var offsetX = 0.3 - e.pageX / w;
			var offsetY = 0.3 - e.pageY / h;
			$(".parallax", "#header-page").each(function(i, el) {
				var offset = parseInt($(el).data('offset'), 10);
				var translate = "translate3d(" + Math.round(offsetX * offset) + "px," + Math.round(offsetY * offset) + "px, 0px)";
				$(el).css({
					'-webkit-transform': translate,
					'transform': translate,
					'moz-transform': translate,
					'-ms-transform': translate,
					'-o-transform': translate
				});
			});
	});





	/* MAPS & SERCHER
	============================================== */
	var $filter = $('.filter', '#search-box');
	var $maps   = $('#map-container', '#search-box');
	var $search = $('#content-search', '#search-box');
	var $searcher = $(".searcher", '#search-box');
	var $position = parseInt($searcher.css('bottom'), 10);

	function viewFullMaps() {
		$maps.toggleClass('full-screen');
	}

	$('.botton-options', '#search-box').on('click', function(){
		hideSearcher();
	});

	function hideSearcher(navigatorMap){

		if(navigatorMap==true){
			$searcher.slideUp(220);
		} else {
			$searcher.slideToggle(220);
		}
		return false;
	}

	$(".set-searcher", '#search-box').on('click', hideSearcher);

	$(".more-button", '#search-box').on('click', function(){
		$filter.toggleClass('hide-filter');
		return false;
	});





	/* HOME WORD SLIDE
	============================================== */
	$(function() {
		function spinner($element) {

			var words = [];
			var list = $('li', $element);

			list.each(function() {
				words.push($(this).text());    
			});

			list.remove();
			var $ss = $('#spinner-show');
			var i = 0, i_next = 1;

			$('.next span', $ss).text(words[i_next]);
			$ss.width($('.current').width());

			setInterval(function() {

				$ss.addClass('swap');
				i = i_next;
				i_next++;

				if(i_next >= words.length) {
					i_next = 0;
				};

				$ss.width($('.next span').width());

				setTimeout(function() {
					$('.next span', $ss).text(words[i_next]);
					$('.current', $ss).text(words[i]);
					$ss.removeClass('swap');
				}, 1000);

			}, 7000);
		}

		if($('#spinner').length) {
			spinner($('#spinner'));
		}
	});





	/* EXPAND FEEDBACK
	============================================== */
	$(function() {
		var feedbackContainer = $('#testimonial');
		$('.next, .previous', feedbackContainer).on('click', function(){

			var $messageBox = $('.message');
			$messageBox.removeAttr('style').css({'height': parseInt($('.message').css('height'), 10)+'px'});

		});
		$('.message .more-button', feedbackContainer).on('click', function(){

			var $feedbackBlock = $(this).parent();
			var $feedbackContent = $feedbackBlock.children(':first-child');

			if(!$feedbackContent.attr('data-max')){
				$feedbackContent.attr('data-max', parseInt($feedbackContent.css('height'), 10));
				$feedbackContent.attr('data-min', parseInt($feedbackBlock.css('height'), 10));
			}

			if(parseInt($feedbackBlock.css('height') ,10)!=$feedbackContent.attr('data-min')){
				$feedbackBlock.css({'height': $feedbackContent.attr('data-min')+'px'});
			}else{
				$feedbackBlock.css({'height': $feedbackContent.attr('data-max')+'px'});
			}

			return false;

		});


	});





	/* MODAL LOGIN / SIGNIN FORM
	============================================== */
	$(document).ready(function(){
		$('#login-pan a', '#header-container-box').on('click', function(){
			var type = $(this).data('section');
			$('.login-button-container a', document.body).removeClass('active');
			$('.login-button-container a[data-section="'+type+'"]', document.body).addClass('active');
			$('.modal-dialog .box').fadeOut(1);
			$('.modal-dialog #'+type).delay(350).fadeIn();
		});

		$('.login-button-container a', document.body).on('click', function(e){
			e.preventDefault();
			$('.login-button-container a', document.body).removeClass('active');
			$(this).addClass('active');
			var target = $(this).data('section');
			$('.modal-dialog .box', document.body).fadeOut(300);
			$('.modal-dialog #'+target, document.body).delay(350).fadeIn();
		});
	});





	/* MODAL CONTACT FORM
	============================================== */
	$('a', '#form-modal-contact').on('click', function(){
		$(this).parent().parent().find('a').removeClass('active');
		$(this).addClass('active');
		return false;
	});





	/* BOTTON SCROLL TOP
	============================================== */
	$(document).ready(function(){
		var $buttonScroll = $('.fixed-button.top', document.body);
		$(window).scroll(function(){
			$(this).scrollTop() > 300 ? $buttonScroll.addClass('active')
				                      : $buttonScroll.removeClass('active') ;
		});
		$buttonScroll.on('click', function(){
			$("html, body").animate({ scrollTop: 0 }, 600);
			return false;
		});
	});





	/* MORTGAGE CALCULATE
	============================================== */
	$("#mortgage-calc", document.body).on('click', function(){

		var L, P, n, c, dp;
		L = parseInt( $( "#mc-price" ).val() ,10 );
		n = parseInt( $( "#mc-term" ).val() ,10 ) * 12;
		c = parseFloat( $( "#mc-rate" ).val() ,10 )/1200;
		dp = 1 - parseFloat( $( "#mc-down" ).val() ,10 )/100;
		L = L * dp;
		P = ( L* ( c*Math.pow( 1+c, n ) ) ) / ( Math.pow( 1 + c, n ) -1 );

		if( !isNaN( P ) ) {
			$( "#mc-payment" ).text( "$ " + P.toFixed(2) );
		} else {
			$( "#mc-payment" ).text( "There was an error" );
		}

		return false;

	});





	/* FIT IMAGE SCRIPT
	============================================== */
	$('.image-fill', document.body).imagefill();





	/* RESPONSIVE LEFT MENU
	============================================== */
	$(document).ready(function(){
		var lastId, $targetLink = $('.block-menu a[href^="#"]', document.body);
		$($targetLink, document.body).on('click',function (e) {
			$targetLink.removeClass('active');
			$(this).addClass('active');
			e.preventDefault();
			var target = this.hash;
			var $target = $(target);
			var pointer = $target.offset().top - 120;
			$('html, body').stop().animate({
				'scrollTop': pointer
			}, 900, 'swing', function () {
				//window.location.hash = target;
			});
		});

		var lastId, topMenu = $(".block-menu", document.body),
			topMenuHeight = 160,
			menuItems = topMenu.find('a[href^="#"]');

			// Anchors corresponding to menu items
			var scrollItems = menuItems.map(function(){

				var item = $($(this).attr("href"));
				if (item.length) { 
					return item;
				}

			});

			// Bind to scroll
			$(window).scroll(function(){

				if(topMenu.hasClass('affix')){

				   // Get container scroll position
				   var fromTop = $(this).scrollTop()+topMenuHeight;
				   
				   // Get id of current scroll item
				   var cur = scrollItems.map(function(){
					 if ($(this).offset().top < fromTop)
					   return this;
				   });
				   // Get the id of the current element
				   cur = cur[cur.length-1];
				   var id = cur && cur.length ? cur[0].id : "";
				   
				   if (lastId !== id) {
					   lastId = id;
					   // Set/remove active class
					   menuItems.removeClass("active");
					   menuItems.filter("[href=#"+id+"]").addClass("active");
				   }  
				} //end- if
			}); //end- scroll

	});





	/* AFFIX MENU
	============================================== */
	var $affix = function(){
		var menu = $('.block-menu', document.body);
		menu.css({'width':menu.parent().width() + 'px'});
	};  $(window).resize(function (e) {
		e.preventDefault();
		$affix();
	}); $affix();





	/* SELECT PRICING
	============================================== */
	var $select = function(){
		$('.pricing .icon', document.body)
			.addClass('fa-cart-arrow-down')
			.removeClass('fa-check');
		$('.pricing', document.body)
			.addClass('no-select')
			.removeClass('select');
	}; 
	$('.select-button', document.body).on('click', function(){
		$select();
		$(this).find('.icon').addClass('fa-check')
			   .removeClass('fa-cart-arrow-down');
		$(this).parent()
			   .removeClass('no-select')
			   .addClass('select');
	});





	/* MASONRY LIST
	============================================== */
	var $propertyList = $("#property-list", document.body);
	if($propertyList.length){
		$propertyList.gridalicious({
			gutter: 0,
			width: 250
		});
	}

	var $propertyList2c = $("#property-list-2c", document.body);
	if($propertyList2c.length){
		$propertyList2c.gridalicious({
			gutter: 0,
			width: 300
		});
	}

	var $blogList = $("#blog-list", document.body);
	if($blogList.length){
		$blogList.gridalicious({
			gutter: 20,
			width: 300
		});
	}

	var $masonryImages = $(".masonry-images", document.body);
	if($masonryImages.length){
		$masonryImages.gridalicious({
			gutter: 20,
			width: 250
		});
	}