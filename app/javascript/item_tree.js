// 失敗作
$(function () {
  $('.navLeft__item').hover(function(){
    $(this).children('div').show();
  },
  function(){
    $(this).children('div').hide();
  })
})