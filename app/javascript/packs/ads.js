$(document).on('turbolinks:load', function() {
 $("#hide").click(function(){
   $("#advance_search").toggle();
 });

 $("#ad_color").change(function () {
   if ($(this).val() == 'Other') {
     $('.color_field').removeClass('d-none');
     $('.color_field').focus();
   } else {
     $('.color_field').addClass('d-none');
   }
 });

 let $temp = $("<input>");
 let $url = $(location).attr('href');
 $('#btn').click(function() {
   $("body").append($temp);
   $temp.val($url).select();
   document.execCommand("copy");
   $temp.remove();
 });
});
