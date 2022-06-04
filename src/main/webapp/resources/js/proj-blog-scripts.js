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
            setInterval(this.setBackground, 5000);
        },
        addEvent: function () {
        },
        setBackground: function () {
            let index =0;

            index = Math.floor( Math.random() * 10 );

            let arr = [
                'https://mblogthumb-phinf.pstatic.net/MjAyMDA0MTRfMjQ5/MDAxNTg2ODUwMDMyMzc5.q-jpJAlMkIKu0-AjGeh-aLPKmoY4cD2WUeeJVnJDEmMg.P1hntf10V_IhJK8vkK44KEnwZVTWmnybjLs-vVYWVOYg.PNG.bizhows/%25EA%25B0%2580%25EC%2583%2581%25EB%25B0%25B0%25EA%25B2%25BD-6.png?type=w800',
                'https://ssl.pstatic.net/melona/libs/1388/1388658/67abea994c0c49798924_20220602135717941.jpg',
                'https://s.pstatic.net/static/www/mobile/edit/20220531/mobile_183003680170.jpg',
                'https://img.freepik.com/free-photo/white-clouds-on-blue-sky-background-abstract-seasonal-wallpaper-sunny-day-atmosphere_548821-3621.jpg?w=2000',
                'https://mblogthumb-phinf.pstatic.net/MjAyMDA0MTRfMjQ5/MDAxNTg2ODUwMDMyMzc5.q-jpJAlMkIKu0-AjGeh-aLPKmoY4cD2WUeeJVnJDEmMg.P1hntf10V_IhJK8vkK44KEnwZVTWmnybjLs-vVYWVOYg.PNG.bizhows/%25EA%25B0%2580%25EC%2583%2581%25EB%25B0%25B0%25EA%25B2%25BD-6.png?type=w800',
                'https://ssl.pstatic.net/melona/libs/1388/1388658/67abea994c0c49798924_20220602135717941.jpg',
                'https://s.pstatic.net/static/www/mobile/edit/20220531/mobile_183003680170.jpg',
                'https://img.freepik.com/free-photo/white-clouds-on-blue-sky-background-abstract-seasonal-wallpaper-sunny-day-atmosphere_548821-3621.jpg?w=2000',
                'https://s.pstatic.net/static/www/mobile/edit/20220531/mobile_183003680170.jpg',
                'https://img.freepik.com/free-photo/white-clouds-on-blue-sky-background-abstract-seasonal-wallpaper-sunny-day-atmosphere_548821-3621.jpg?w=2000'
            ]

            $('header').css({
                "background-image": "url(" + arr[index] + ")",
                "transition": "all 2s"
            });
        }
    }

    navEvent.init();
    headerEvent.init();

});