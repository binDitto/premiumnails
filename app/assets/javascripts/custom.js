$(document).ready(function(){

  $(".showcomments").parent().find(".showlist").hide();


  $(".showcomments").on('click', function(){
    $(this).parent().find(".showlist").toggle(100);
    var text = $('.showcomments').text();
    $(this).text(text == "Show Comments" ? "Hide Comments" : "Show Comments");
  });

});
