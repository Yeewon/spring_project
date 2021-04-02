/*!
 * Start Bootstrap - Agency v6.0.3 (https://startbootstrap.com/theme/agency)
 * Copyright 2013-2020 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
 */
(function ($) {
    'use strict'; // Start of use strict

    // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate(
                    {
                        scrollTop: target.offset().top - 72,
                    },
                    1000,
                    'easeInOutExpo'
                );
                return false;
            }
        }
    });

    // Closes responsive menu when a scroll trigger link is clicked
    $('.js-scroll-trigger').click(function () {
        $('.navbar-collapse').collapse('hide');
    });

    // Activate scrollspy to add active class to navbar items on scroll
    $('body').scrollspy({
        target: '#mainNav',
        offset: 74,
    });

    // Collapse Navbar
    var navbarCollapse = function () {
        if ($('#mainNav').offset().top > 100) {
            $('#mainNav').addClass('navbar-shrink');
        } else {
            $('#mainNav').removeClass('navbar-shrink');
        }
    };
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);
})(jQuery); // End of use strict

$(document).ready(function () {
    var root = '/portfolio_cafe';

    //best menu

    // getBestMenu();
    // setInterval(getBestMenu, 5000);

    // const getBestMenu = () => {
    //     $.ajax({
    //         url: root + '/popular',
    //         type: 'GET',
    //         dataType: 'json',
    //         success: function (menus) {
    //             makeMenu(menus, '.popular_menu_ul');
    //         },
    //     });
    // }

    //login
    $('#loginBtn').click(function () {
        var userid = prompt('아이디입력', 'yeewon');
        if (userid.length == 0) {
            alert('아이디 입력!!!');
            return;
        }
        var userpass = prompt('비밀번호입력', 'yeewon');
        if (userpass.length == 0) {
            alert('비밀번호 입력!!!');
            return;
        }
        if (userid == 'yeewon' && userpass == 'yeewon') {
            $('#loginOff').css('display', 'none');
            $('#loginOn').css('display', 'block');
        } else {
            alert('check id or password');
        }
    });

    //logout
    $('#logoutBtn').click(function () {
        $('#loginOff').css('display', 'block');
        $('#loginOn').css('display', 'none');
    });
});
