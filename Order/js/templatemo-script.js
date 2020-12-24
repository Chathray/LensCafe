/**
 *	www.templatemo.com
 */

if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}


/* HTML document is loaded. DOM is ready.
-----------------------------------------*/
$(document).ready(function () {

    $("#ContentPlaceHolder1_coffeeType").change(function () {
        $("#ContentPlaceHolder1_hf_ddl").val(this.selectedIndex);
    });


    // Mobile menu
    $('.mobile-menu-icon').click(function () {
        $('.tm-nav').slideToggle();
    });

    $('.menu-fuzzy').click(function () {

        //Điều này không hoạt động, why?
        //$('.menu-cate').each(function () {
        //    $(this).toggleClass('active');
        //});

        $('.menu-fuzzy').each(function () {
            var s = $(this).find('a');
            s.removeClass("active");
        });

        var r = $(this).find('a');
        r.addClass("active");
        var tan = r.text();

        $.ajax({
            type: "POST",
            url: "Menu.aspx/SayHello",
            data: "{'name':'" + tan + "'}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: function (output) {
                $('#menuContent').html(output.d);
            }
        });
    });

    $(window).resize(function () {
        if ($(window).width() > 995) {
            $('.tm-nav').show();
        } else {
            $('.tm-nav').hide();
        }
    });

    $('footer').on("contextmenu", function (e) {
        e.preventDefault();

        if (document.fullscreenElement)
            document.exitFullscreen()
        else
            document.documentElement.requestFullscreen()
    });

    // http://stackoverflow.com/questions/2851663/how-do-i-simulate-a-hover-with-a-touch-in-touch-enabled-browsers
    $('body').bind('touchstart', function () { });

    // Scroll to top button appear
    $(document).on('scroll', function () {
        var scrollDistance = $(this).scrollTop();
        if (scrollDistance > 100) {
            $('.scroll-to-top').fadeIn();
        } else {
            $('.scroll-to-top').fadeOut();
        }
    });

    // Smooth scroll
    // https://css-tricks.com/snippets/jquery/smooth-scrolling/
    $('a[href*=#]:not([href=#])').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 400);
                return false;
            }
        }
    });
});

$(window).load(function () {
    // Remove preloader
    // https://ihatetomatoes.net/create-custom-preloading-screen/
    $('body').addClass('loaded');
});

