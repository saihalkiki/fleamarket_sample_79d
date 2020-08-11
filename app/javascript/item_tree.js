$(function () {
  let setTimeCategoryTree = 0;
  $('#category_tree').hover(function(){
    clearTimeout(setTimeCategoryTree);
    $(this).children().removeClass('displayNone');
  },function(){
    let hideMenu = $(this).children('div')
      setTimeCategoryTree = setTimeout(function() {
        hideMenu.addClass('displayNone');
    },200)
  })
})