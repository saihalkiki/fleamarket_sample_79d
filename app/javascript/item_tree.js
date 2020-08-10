// 失敗作
$(function () {
  console.log("item_tree.js発火");
  $('.navLeft__item').hover(function(){
    $(this).children('div').show();
  },
  function(){
    $(this).children('div').hide();
  })
})