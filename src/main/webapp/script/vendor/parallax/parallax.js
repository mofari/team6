/*
 *  RD-Parallax - v0.8.8 
 *  Easy as hell Parallax Jquery plugin.
 *
 *  Made by Evgeniy Gusarov (Stmechanus || Diversant)
 *          Rafael Shayvolodyan (raffa)
 *
 *  Under MIT License
 */

;(function ($) {
    var $window = $(window);
    var windowHeight = $window.height();

    $window.resize(function () {
        windowHeight = $window.height();
    });

    $.fn.parallax = function (xpos, speed, offset, outerHeight) {
        var $this = $(this);
        var getHeight;
        var speedFactor = speed;
        var offset = offset ? parseInt(offset) : null;



        if (outerHeight) {
            getHeight = function (jqo) {
                return jqo.outerHeight(true);
            };
        } else {
            getHeight = function (jqo) {
                return jqo.height();
            };
        }

        if (arguments.length < 1 || xpos === null) xpos = "50%";
        if (arguments.length < 2 || speedFactor === null) speedFactor = -0.2;
        if (arguments.length < 3 || offset === null) offset = 0;
        if (arguments.length < 4 || outerHeight === null) outerHeight = true;

        function update() {

            var pos = $window.scrollTop();



            $this.each(function () {
                var $element = $(this);
                var top = $element.offset().top;
                var height = getHeight($element);
                if (top + height < pos || top > pos + windowHeight) {
                    return;
                }

                $element.css('backgroundPosition', xpos + " " + (Math.round((top - pos) * speedFactor) + offset) + "px");
            });
        }

        $window.bind('scroll', update).resize(update);
        update();
    };
})(jQuery);

$(document).ready(function () {
    var obj;
    if ((obj = $('.parallax')).length > 0 && $('html').hasClass('desktop')) {
        for (var i = 0; i < obj.length; i++) {
            if(isIE() && isIE() < 9){
                $(obj[i]).parallax($(obj[i]).css('backgroundPositionX'), obj[i].getAttribute('data-parallax-speed'), obj[i].getAttribute('data-parallax-offset'));
            }else{
                $(obj[i]).parallax($(obj[i]).css('background-position').split(" ")[0], obj[i].getAttribute('data-parallax-speed'), obj[i].getAttribute('data-parallax-offset'));
            }
        }
    }

    function isIE() {
        var myNav = navigator.userAgent.toLowerCase();
        return (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
    };
});