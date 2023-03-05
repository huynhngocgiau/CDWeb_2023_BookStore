(function ($) {
    "use strict";

    //sign in
    $("#signUp").click(function () {
        $("#container").addClass("right-panel-active");
    });

    $("#signIn").click(function () {
        $("#container").removeClass("right-panel-active")
    });

    // Dropdown on mouse hover
    $(document).ready(function () {
        function toggleNavbarMethod() {
            if ($(window).width() > 992) {
                $('.navbar .dropdown').on('mouseover', function () {
                    $('.dropdown-toggle', this).trigger('click');
                }).on('mouseout', function () {
                    $('.dropdown-toggle', this).trigger('click').blur();
                });
            } else {
                $('.navbar .dropdown').off('mouseover').off('mouseout');
            }
        }

        toggleNavbarMethod();
        $(window).resize(toggleNavbarMethod);
    });


    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Vendor carousel
    $('.vendor-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0: {
                items: 2
            },
            576: {
                items: 3
            },
            768: {
                items: 4
            },
            992: {
                items: 5
            },
            1200: {
                items: 6
            }
        }
    });


    // Related carousel
    $('.related-carousel').owlCarousel({
        loop: true,
        margin: 29,
        nav: false,
        autoplay: true,
        smartSpeed: 1000,
        responsive: {
            0: {
                items: 1
            },
            576: {
                items: 2
            },
            768: {
                items: 3
            },
            992: {
                items: 4
            }
        }
    });


    // Product Quantity
    $('.quantity button').on('click', function () {
        var button = $(this);
        var oldValue = button.parent().parent().find('input').val();
        if (button.hasClass('btn-plus')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        button.parent().parent().find('input').val(newVal);
    });

    //ajax category
    $.ajax({
        url: "/getAllCat",
        type: "GET",
        cache: false,
        success: function (results) {
            var str = "";
            $.each(results, function (index, category) {
                str += "<a href='/danh-sach-san-pham?category=" + category.code + "' class='nav-item nav-link'>" + category.name + "</a>";
            });
            $("#listCategory").html(str);
        }
    });

    //show category list on index page
    if (window.location.pathname == "/") $("#navbar-vertical").addClass("show");
    else $("#navbar-vertical").removeClass("show");

	//category position absolute in another page except index
    if (window.location.pathname == "/" || window.location.pathname == "/trang-chu"){
        $("#navbar-vertical").removeClass(["position-absolute", "bg-light", "style-width-cat"]);
    }
    else {
        $("#navbar-vertical").addClass(["position-absolute", "bg-light", "style-width-cat"]);
    }
})(jQuery);

