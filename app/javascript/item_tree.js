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
  $('.categoryTreeParent').hover(function(){
    let parentId = $(this).children().data('index');
    $.ajax({
      url: '/items/get_category_children',
      type: 'GET',
      data: { parent_id: parentId },
      dataType: 'json'
    })
    .done(function (children){
      
    })
  },function(){})
})