$(function() {
  function new_message(message) {
    var new_message = $('<div class="msg">' +
                '<p class="msg__username">'+ message.name +'</p>' +
                '<p class="msg__time">'+ message.time + '<p>' +
                '<p class ="msg__passage">' + message.body +'</p>' +
                '</div>');
    return new_message;
  }

  $('.msg_form').on('submit', function(e) {
    e.preventDefault();
    var api_url = window.location.pathname;
    //リクエストのパスを取得
    // var message = $('.form__textfield').val();
    // var user_id = $('#message_user_id').val();
    // var group_id = api_url.replace ( /[^\d.]/g, '' );

    var formdata = new FormData($(this).get(0));
    // for(item of formdata) console.log(item);
    $.ajax({
      url: api_url,
      type: 'POST',
      data: formdata,
      contentType: false,
      processData: false,
      dataType: 'json',
      cache: false
    })

    .done(function(message){
      console.log('success!');
      console.log(message);
      var html = new_message(message);
      $('.msg').append(html);
      // 'chat__content'の末尾に'html'を加える
      $('.form__textfield').val('');
      //テキストフィールドを空にする
      $('.form__submit').prop('disabled', false);
      ///送信ボタンを有効にする
    })

    .fail(function(data){
      console.log('error!');
    });
  });
});
