$(function () {
  let setTime = 0;
  $('.navLeft__item').hover(function(){
    clearTimeout(setTime);
    $(this).children('div').show();
    console.log("hover");
  },function(){
    let hideMenu = $(this).children('div')
      setTime = setTimeout(function() {
      console.log("timeout")
      hideMenu.hide();
    },200)
  })
})