class Message < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group

  #validation
  validates :body, presence: true

  def json_api
    {
        user: user.name,
        user_id: user.id,
        body: body,
        time: created_at.strftime('%Y/%m/%d %H:%M:%S'),
        image: image.to_s
    }
  end
end
