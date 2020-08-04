$(document).on('turbolinks:load', function () {
  $(function () {
    // 画像用のinputを生成する関数
    const buildFileField = function(index) {
      const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image">
                    <br>
                    <div class="js-remove">削除</div>`;
      return html;
    }
    // file_fieldのnameに動的なindexをつける為に配列を作成
    let fileIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // editアクション用 既に使われているindexを除外 ※後ほど確認
    lastIndex = $('.js-file_group:last').data('index');
    // 第1引数で指定した要素から、第2引数で指定した数の分の要素を取り除
    fileIndex.splice(0, lastIndex);
    // 削除check_boxを非表示にする ※動作確認のため、一旦表示させる
    // $('.hidden-destroy').hide();
    
    // file_fieldの内容が変化した時発火
    $('#image-box').on('change', '.js-file', function () {
      // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex[0]));
      // 配列から最初の要素を取り除き、その要素を返す
      fileIndex.shift();
      // 減った分の配列末尾に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    });
    $('#image-box').on('click', '.js-remove', function() {
      // クリックされた親要素のdata-indexの値を取得する
      const targetIndex = $(this).parent().data('index')
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      // クリックした親要素(div.js-file_group)を削除
      $(this).parent().remove();
      // 画像入力欄が0個になったら
      if ($('.js-file').length == 0) {
        // 入力蘭を追加する
        $('#image-box').append(buildFileField(fileIndex[0]));
      }
    })
  });
})