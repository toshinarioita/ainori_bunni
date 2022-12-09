// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require bootstrap-sprockets

//= require moment
//= require bootstrap-datetimepicker

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


var data = {'data-date-format': 'YYYY-MM-DD hh:mm:ss' };
$(function(){
  $('.datepicker').attr(data);
  $('.datepicker').datetimepicker();
});

// Sticky Header
$(window).scroll(function() {

  if ($(window).scrollTop() > 100) {
      $('.main_h').addClass('sticky');
  } else {
      $('.main_h').removeClass('sticky');
  }
});

// Mobile Navigation
$('.mobile-toggle').click(function() {
  if ($('.main_h').hasClass('open-nav')) {
      $('.main_h').removeClass('open-nav');
  } else {
      $('.main_h').addClass('open-nav');
  }
});

$('.main_h li a').click(function() {
  if ($('.main_h').hasClass('open-nav')) {
      $('.navigation').removeClass('open-nav');
      $('.main_h').removeClass('open-nav');
  }
});

// navigation scroll lijepo radi materem
$('nav a').click(function(event) {
  var id = $(this).attr("href");
  var offset = 70;
  var target = $(id).offset().top - offset;
  $('html, body').animate({
      scrollTop: target
  }, 500);
  event.preventDefault();
});



$(function(){
  $(window).on('load scroll', function() {
     var winScroll = $(window).scrollTop();
     var winHeight = $(window).height();
     var scrollPos = winScroll + (winHeight * 0.8);

     $(".showhey").each(function() {
        if($(this).offset().top < scrollPos) {
           $(this).css({opacity: 1, transform: 'translate(0, 0)'});
        }
     });
  });
});

// var window_h = $(window).height();
// $("#wh span").text(window_h);
// //スクロールイベント
// $(window).on("scroll", function() {
//   var scroll_top = $(window).scrollTop();
//   $("#scroll span").text(scroll_top);

//   $(".box").each(function() {
//     var elem_pos = $(this).offset().top;
//     $(this).find(".box_pos span").text(Math.floor(elem_pos));
//   　
//     //どのタイミングでフェードインさせるか
//     if (scroll_top >= elem_pos - window_h+200) {
//       $(this).addClass("fadein");
//     } else {
//       $(this).removeClass("fadein");
//     }
//   });
// });

