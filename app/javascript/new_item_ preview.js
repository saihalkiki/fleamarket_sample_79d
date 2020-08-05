$(document).on('turbolinks:load', function () {
  $(function () {
    // 画像用のinputを生成する関数
    const buildFileField = function(index) {
      const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file" type="file" name="item[images_attributes][${index}][image]" id="item_images_attributes_${index}_image">`;
      return html;
    } 

    // プレビュー用のimgタグを生成する関数
    const buildImg = function(index, url) {
      const html = `<div class="previewsBox" data-index="${index}">
                    <div class="previewsBox__image">
                    <img data-index="${index}" src="${url}">
                    </div>
                    <div class="js-remove text-center">
                    削除
                    </div>
                    </div>`;
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
    $('#image-box').on('change', '.js-file', function (e) {
      // 画像変更された要素の親要素のdata-indexの値を取得する
      const targetIndex = $(this).parent().data('index');
      // ファイルのブラウザ上でのURLを取得する
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      $(this).next('div').removeClass('newInputHidden');
      // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {  // 新規画像追加の処理
        $('#previews').append(buildImg(targetIndex, blobUrl));
        if ($('.js-file').length < 10) {
          // fileIndexの先頭の数字を使ってinputを作る
          $('#image-box').append(buildFileField(fileIndex[0]));
          // 配列から最初の要素を取り除き、その要素を返す
          fileIndex.shift();
          // 減った分の配列末尾に1足した数を追加する
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
        }
      }
    });
    $('#image-box').on('click', '.js-remove', function() {
      // クリックされた要素の親要素のdata-indexの値を取得する
      const targetIndex = $(this).parent().data('index');
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      // プレビュー画像の削除
      $(this).parent().remove();
      if ($('.previewsBox').length == 9) {
        $('#image-box').append(buildFileField(fileIndex[0]));
        // 配列から最初の要素を取り除き、その要素を返す
        fileIndex.shift();
        console.log(fileIndex);
        // 減った分の配列末尾に1足した数を追加する
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
        console.log(fileIndex);
      }
      // クリックした親要素(div.js-file_group)を削除
      $(`#item_images_attributes_${targetIndex}_image`).parent().remove();
      // 画像入力欄が0個になったら
      if ($('.js-file').length == 0) {
        // 入力蘭を追加する
        $('#image-box').append(buildFileField(fileIndex[0]));
      }
    })
  });
})