json.name @message.user.name
json.body @message.body
json.image @message.image
json.time published_on(@message) #ヘルパーメソッドを使用すれば、非同期時と通常リクエスト時も同様の表記にできる
