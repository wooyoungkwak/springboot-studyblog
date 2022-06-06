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
            this.addEvent();
        },
        addEvent: function () {
            $('a.nav-link').on('click', function () {
                location.href = '/' + this.id;
            });
        }
    };

    let headerEvent = {
        init: function () {
            this.setBackground();
            setInterval(this.setBackground, 5000);
        },
        addEvent: function () {
        },
        setBackground: function () {
            let index =0;

            index = Math.floor( Math.random() * 10 );

            let arr = [
                '/fileUpload/assets/introduce/head1_1.png',
                '/fileUpload/assets/introduce/head2_1.png',
                '/fileUpload/assets/introduce/head3_1.png',
                '/fileUpload/assets/introduce/head4_1.png',
                '/fileUpload/assets/introduce/head1_1.png',
                '/fileUpload/assets/introduce/head2_1.png',
                '/fileUpload/assets/introduce/head3_1.png',
                '/fileUpload/assets/introduce/head4_1.png',
                '/fileUpload/assets/introduce/head1_1.png',
                '/fileUpload/assets/introduce/head2_1.png'
            ]

            $('header').css({
                "background-size" : "1326px 895px",
                "background-image": "url(" + arr[index] + ")",
                "transition": "all 2s"
            });
        }
    }

    navEvent.init();
    headerEvent.init();

});