$(function(){
  console.log("comment.js発火");
  function buildHTML(comment){
    let html = `<div class="commentcontent">
                  <div class="commentuser">
                    <a href=/users/${comment.user_id}">${comment.user_name}</a>
                  </div>
                  <div class="commenttext">${comment.text}</div>
                  <div class="commenttime">${comment.created_at}</div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.commentbox__show--box').append(html);
      $('.commentform')[0].reset();  
      $('.commentbtn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})


