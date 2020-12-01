/**
 *	www.templatemo.com
 */

var m0 = `<div class="tm-product">
            <img src="img/lock.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">NGỪNG KINH DOANH</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$0</a>
            </div>
          </div>`;

var m1 = `<div class="tm-product">
            <img src="images/americano/americano.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Classic Americano</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$1</a>
            </div>
          </div>`;

var m2 = `<div class="tm-product">
            <img src="images/cappuccino/cappuccino.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Classic Cappuccino</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$2</a>
            </div>
          </div>
          <div class="tm-product">
            <img src="images/cappuccino/iced cappuccino.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Iced Cappuccino</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$2</a>
            </div>
          </div>`;

var m3 = `<div class="tm-product">
            <img src="images/latte/latte.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Classic Latte</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$3</a>
            </div>
          </div>
          <div class="tm-product">
            <img src="images/latte/caramel latte.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Caramel Latte</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$3</a>
            </div>
          </div><div class="tm-product">
            <img src="images/latte/vanilla latte.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Vanilla Latte</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$3</a>
            </div>
          </div><div class="tm-product">
            <img src="images/latte/mocha latte.jpg" alt="Product" class="imgmenu">
            <div class="tm-product-text">
                <h3 class="tm-product-title">Mocha Latte</h3>
                <p class="tm-product-description">Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque. Red ipsum.</p>
            </div>
            <div class="tm-product-price">
                <a href="#" class="tm-product-price-link tm-handwriting-font">$3</a>
            </div>
          </div>`;

if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.href);
}

// Tải trang nội dung
function LoadMenu(id) {
    switch (id) {
        case "2":
            output = m1;
            break;
        case "6":
            output = m2;
            break;
        case "3":
            output = m3;
            break;
        default:
            output = m0;
    }
    $('#menuContent').html(output);
}

/* HTML document is loaded. DOM is ready.
-----------------------------------------*/
$(document).ready(function () {

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

        id = $(this).attr('data-stt');
        LoadMenu(id);
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

