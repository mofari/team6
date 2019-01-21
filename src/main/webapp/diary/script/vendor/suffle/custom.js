		var shuffleme = (function( $ ) {

		  'use strict';

		  var $grid = $('#images-container'),
			  $filterOptions = $('.filter-options'),
			  $sizer = $grid.find('.shuffle_sizer'),

		  init = function() {

			// None of these need to be executed synchronously
			setTimeout(function() {
			  listen();
			  setupFilters();
			}, 100);

			// instantiate the plugin
			$grid.shuffle({
			  itemSelector: '[class*="col-"]',
			  sizer: $sizer    
			});
		  },

		  // Set up button clicks
		  setupFilters = function() {
			var $btns = $filterOptions.find('a');
			$btns.on('click', function() {
			  var $this = $(this),
				  isActive = $this.hasClass( 'active' ),
				  group = isActive ? 'all' : $this.data('group');

			  // Hide current label, show current label in title
			  if ( !isActive ) {
				$('.filter-options .active').removeClass('active');
			  }

			  $this.toggleClass('active');

			  // Filter elements
			  $grid.shuffle( 'shuffle', group );
			  return false;
			});

			$btns = null;
		  },
			  
		  // Re layout shuffle when images load. This is only needed
		  // below 768 pixels because the .picture-item height is auto and therefore
		  // the height of the picture-item is dependent on the image
		  // I recommend using imagesloaded to determine when an image is loaded
		  // but that doesn't support IE7
		  listen = function() {
			var debouncedLayout = $.throttle( 300, function() {
			  $grid.shuffle('update');
			});

			// Get all images inside shuffle
			$grid.find('img').each(function() {
			  var proxyImage;

			  // Image already loaded
			  if ( this.complete && this.naturalWidth !== undefined ) {
				return;
			  }

			  // If none of the checks above matched, simulate loading on detached element.
			  proxyImage = new Image();
			  $( proxyImage ).on('load', function() {
				$(this).off('load');
				debouncedLayout();
			  });

			  proxyImage.src = this.src;
			});

			// Because this method doesn't seem to be perfect.
			setTimeout(function() {
			  debouncedLayout();
			}, 500);
		  };      
		  
		  return {
			init: init
		  };
		}( jQuery ));

		$(document).ready(function() {
		  shuffleme.init();
		});