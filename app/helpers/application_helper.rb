module ApplicationHelper
  def published_on(message) # 時刻のフォーマットを変更するヘルパーメソッドを定義
    message.created_at.to_s
    # message.created_at.to_s(:default) でも同義。
  end
end
