
/**
 * jQuery-плагин для построения круговых диаграмм
 * author: monochromer
 * https://github.com/monochromer/jquery.circle-diagram
*/

(function($) {

	$.fn.circleDiagram = function(params){

		/**
		 * Вспомогательная фукнция для поворота блоков
		 * @param {Number} angle - угол поворота в градусах
		 * @return {Object} object - набор css-свойств для поворота
		 */
		function rotate(angle) {
			return {
				"-webkit-transform": "rotate(" + angle + "deg)",
				   "-moz-transform": "rotate(" + angle + "deg)",
				    "-ms-transform": "rotate(" + angle + "deg)",
				     "-o-transform": "rotate(" + angle + "deg)",
				        "transform": "rotate(" + angle + "deg)"
			};
		};

		/**
		 * Набор параметров для диаграмм по-умолчанию
		*/
		var defaults = {
			size: "140",
			borderWidth: "15",
			bgFill: '#F2F2F2',
			frFill: '#50C8B4',
			textSize: 40,
			font: "inherit",
			textColor: "#777"
		};

		/**
		 * Кэшируем некоторые переменные
		*/

		$.each(this, function(e, index){

			var dataAttr;
			var options;
			$this = $(this);

			if($this.attr("data-circle-diagram") != undefined) {
				dataAttr = $.parseJSON($this.attr("data-circle-diagram"));
				options = $.extend(true, {}, defaults, params, dataAttr);
			} else {
				options = $.extend(true, {}, defaults, params);
			}

			/**
			 * Набор основных css-свойств для генериремых элементов.
			 * Возможно, стоит перенести в отдельный css-файл
			*/
			var cssMain = {
				"position": "relative",
				"box-sizing": "initial",
				"width": parseFloat(options.size) + "px",
				"height":  parseFloat(options.size) + "px",
				"border": parseFloat(options.borderWidth) + "px" + " " + "solid" + " " + options.bgFill,
				"border-radius": "50%",
				"z-index": "1"
			};

			var cssElems = {
				"position": "absolute",
				"z-index": "1",
				"top": -parseFloat(options.borderWidth) + "px",
				"right": -parseFloat(options.borderWidth) + "px",
				"bottom": -parseFloat(options.borderWidth) + "px",
				"left": -parseFloat(options.borderWidth) + "px",
				"border": parseFloat(options.borderWidth) + "px" + " " + "solid",
				"border-radius": "50%"
			};

			$this.css(cssMain);

			var text = $('<span></span>')
				.css({
					"display": "block",
					"position": "relative",
					"z-index": "2",
					"text-align": "center",
					"font-size": options.textSize + "px",
					"font-family": options.font,
					"height": parseFloat(options.size) + "px",
					"line-height": parseFloat(options.size) + "px",
					"color": options.textColor
				})
				.text(options.percent)
				.appendTo($this);

			var bg = $('<div></div>')
				.css(cssElems)
				.css({
					"border-color": options.frFill,
					"border-left-color": "transparent",
					"border-bottom-color": "transparent"
				})
				.appendTo($this);

			var fill = $('<div></div>')
				.css(cssElems)
				.css({
					"border-color": options.bgFill,
					"border-left-color": "transparent",
					"border-bottom-color": "transparent"
				})
				.appendTo($this);

			/**
			 * Вычисляем нужный угол поворота
			*/
			var angle;
			var data = parseFloat(options.percent);

			if (data >= 0 && data <= 50) {
				angle = (225 - 45)/50*data + 45;
			} else {
				angle = (405 - 225)/50*data + 225;
				fill.css({
					"border-color": options.frFill,
					"border-left-color": "transparent",
					"border-bottom-color": "transparent",
				});
			};

			bg.css(rotate(45));
			fill.css(rotate(angle));

			/**
			 * Возвращаем $this для поддержки цепочек вызова
			*/
			return $this;

		})
	};

})(jQuery);
