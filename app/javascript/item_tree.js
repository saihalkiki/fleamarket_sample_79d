$(function () {
  // 子カテゴリーのリンク要素を作成(ul内)
  function buildChildLink(category) {
    let html =
      `<a class="categoryTreeChild categoryTree__item" href="#">
        <li class="categoryTree__item--name" data-index="${category.id}">
          ${category.name}
        </li>
      </a>`
    return html;
  }
  // 孫カテゴリーのリンク要素を作成(ul内)
  function buildGrandchildLink(category) {
    let html =
      `<a class="categoryTreeGrandchild categoryTree__item" href="#">
        <li class="categoryTree__item--name" data-index="${category.id}">
          ${category.name}
        </li>
      </a>`
    return html;
  }
  // 子階層カテゴリーのツリーを生成
  function appendChildrenTree(insertHTML) {
    let buildChildSelect = '';
    buildChildSelect =
      `<div class="tree tree__child">
        <ul class="categoryTree">
          ${insertHTML}
        </ul>
      </div>`
    $('#category_tree').append(buildChildSelect);
  }
  // 孫階層カテゴリーのツリーを生成
  function appendGrandchildrenTree(insertHTML) {
    let buildGrandchildrenSelect = '';
    buildGrandchildrenSelect =
      `<div class="tree tree__grandchild">
        <ul class="categoryTree">
          ${insertHTML}
        </ul>
      </div>`
    $('#category_tree').append(buildGrandchildrenSelect);
  }

  // タイマー用変数を定義
  let setTimeCategoryTree = 0;
  // ヘッダーのカテゴリーをホバーした時
  $('#category_tree').hover(function(){
    // タイマーカウントをリセット
    clearTimeout(setTimeCategoryTree);
    // カテゴリーの親階層を表示
    $(this).children().removeClass('displayNone');
  },function(){ // ホバーアウトした時
    // 隠す対象情報（カテゴリー親階層）を取得
    let hideMenu = $(this).children('div')
    // タイマーを起動し、0.2s後に処理を実装
    setTimeCategoryTree = setTimeout(function() {
      // カテゴリー親階層を非表示
      $('.tree__child').remove();
      $('.tree__grandchild').remove();
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
      $('.tree__child').remove(); 
      $('.tree__grandchild').remove();
      //追加するHTMLの入れ物を作る
      let insertHTML = '';
      //配列childrenの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
      $.each(children, function (i, childData) {
        insertHTML += buildChildLink(childData)
      });
      appendChildrenTree(insertHTML);
    })
    .fail(function () {
      alert('カテゴリー取得に失敗しました');
    })
  });
  $('#category_tree').on('mouseover', '.categoryTreeChild',function(){
    childId = $(this).children().data('index');
    $.ajax({
      url: '/items/get_category_grandchildren',
      type: 'GET',
      data: { child_id: childId },
      dataType: 'json'
    })
    .done(function (grandchildren){
      $('.tree__grandchild').remove(); 
      //追加するHTMLの入れ物を作る
      let insertHTML = '';
      //配列childrenの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
      $.each(grandchildren, function (i, grandchildData) {
        insertHTML += buildGrandchildLink(grandchildData)
      });
      appendGrandchildrenTree(insertHTML);
    })
    .fail(function () {
      alert('カテゴリー取得に失敗しました');
    })
  })
})