$(function () {

`
<div class="tree tree__parent displayNone">
  <ul class="categoryTree">
    以下繰り返し処理
    <a class="categoryTreeParent categoryTree__item" href="#">
      <li class="categoryTree__item--name" data-index="0">
      レディース（カテゴリーの変数）
      </li>
    </a>
  </ul>
</div>
`

  // カテゴリーのリンク要素を作成(ul内)
  function buildLink(category) {
    let html =
      `<a class="categoryTreeParent categoryTree__item" href="#">
        <li class="categoryTree__item--name" data-index="${category.id}">
          ${category.name}
        </li>
      </a>`
    return html;
  }
  // 子階層カテゴリーのツリーを生成
  function appendChidrenTree(insertHTML) {
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
  // function appendGrandchidrenTree(insertHTML) {
  //   let buildGrandchidrenSelect = '';
  //   buildGrandchidrenSelect =
  //     `<div class="tree tree__grandhild">
  //       <ul class="categoryTree">
  //         ${insertHTML}
  //       </ul>
  //     </div>`
  //   $('#category_tree').append(buildGrandchidrenSelect);
  // }

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
      hideMenu.addClass('displayNone');
    },200)
  })
  $('.categoryTreeParent').hover(function(){
    let parentId = $(this).children().data('index');
    // $.ajax({
    //   url: '/items/get_category_children',
    //   type: 'GET',
    //   data: { parent_id: parentId + 1 },
    //   dataType: 'json'
    // })
    // .done(function (children){
    //   //追加するHTMLの入れ物を作る
    //   let insertHTML = '';
    //   //配列childrenの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
    //   $.each(children, function (i, child) {
    //     insertHTML += buildLink(childData)
    //   });
    //   let a = appendChidrenTree(insertHTML);
    // })
    // .fail(function () {
    //   alert('カテゴリー取得に失敗しました');
    // })
  },function(){ //ホバーアウト後の処理

  })
})