$(function(){

  var search_list = $("#user-search-result");

  function appendUser(user){
    var html = `<li>${ user.name }</li>`
    search_list.append(html);
  }
  function appendNoUser(user){
    var html = `<li>${ user }</li>`
    search_list.append(html);
  }


  $(".search_users").on("keyup", function(){
    var input = $(".search_users").val();
    console.log(input);

    $.ajax({
      url: '/users/search',
      type: 'POST',
      data: { keyword: input },
      dataType: 'json'
    })

// message.jsと違い、contentTypeとprocessDataを指定しない。なぜ？
// 参考 http://js.studio-kingdom.com/jquery/ajax/ajax

    .done(function(users){
      $("#user-search-result").empty();
      if (users.length !== 0){
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else {
        appendNoUser("一致するユーザーはいません");
      }
    })
    .fail(function(data){
      alert('ユーザー検索に失敗しました。');
    });
  });
});
