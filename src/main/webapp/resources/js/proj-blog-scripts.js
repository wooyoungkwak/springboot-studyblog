/*!
* Start Bootstrap - Blog Home v5.0.8 (https://startbootstrap.com/template/blog-home)
* Copyright 2013-2022 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-blog-home/blob/master/LICENSE)
*/
// This file is intentionally blank
// Use this file to add JavaScript to your project

$(document).ready(function () {

    let navEvent = {
        id: $(location).attr('pathname').replaceAll('/', ''),
        init: function () {
            $('a.nav-link').removeClass('active');
            $('#' + this.id).addClass('active');
        },
        addEvent: function () {
            $('a.nav-link').on('click', function () {
                location.href = '/' + this.id;
            });
        }
    };

    function initialize() {
        navEvent.init();
        navEvent.addEvent();
    }

    initialize();

});