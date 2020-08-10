$(function () {
  let setTimeCategoryTree = 0;
  $('#category_tree').hover(function(){
    clearTimeout(setTimeCategoryTree);
    $(this).children('div').show();
  },function(){
    let hideMenu = $(this).children('div')
      setTimeCategoryTree = setTimeout(function() {
      hideMenu.hide();
    },200)
  })
})