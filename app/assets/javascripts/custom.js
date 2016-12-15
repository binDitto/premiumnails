$(document).ready(function(){
  $(".showlist").hide();

  $(".showcomments").on('click', function(){
    $(".showlist").toggle(200);
  });

  $(".enterlist").on('click', function(){
    $(".showlist").show();
  });

});
