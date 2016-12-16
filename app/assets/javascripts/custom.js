$(document).ready(function(){
  $(".showlist").hide();

  $(".showcomments").on('click', function(){
    $(this).parent().find(".showlist").toggle(100);
  });

  $(".enterlist").on('click', function(){
    $(this).parent().find(".showlist").show();
  });

});
