// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap';
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("custom.js");
import $ from 'jquery';
import jQuery from 'jquery';
global.$ = jQuery;
require("trix")
require("@rails/actiontext")

$(document).ready(function(){
  $("#hide").click(function(){
    $("#advance_search").toggle();
  });
});

$(document).ready(function(){
  $("#ad_color").change(function(){
    if($(this).val()=='Other'){
      $('.color_field').removeClass("d-none")
      $('.color_field').show();
      $('#ad_color').hide();
   }
 });
});

$(document).ready(function(){
  var $temp = $("<input>");
  var $url = $(location).attr('href');
  $('#btn').click(function() {
    $("body").append($temp);
    $temp.val($url).select();
    document.execCommand("copy");
    $temp.remove();
  });
});




