import $ from 'jquery';
import jquery from 'jquery';
global.$ = jquery;

$(document).ready(function(){
  $("#hide").click(function(){
    $("#advance_search").toggle();
  });
});

$(document).ready(function(){
  $("#ad_color").change(function () {
    if ($(this).val() == 'Other') {
      $('.color_field').removeAttr("disabled");
      $('.color_field').focus();
    } else {
      $('.color_field').attr("disabled", "disabled");
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
