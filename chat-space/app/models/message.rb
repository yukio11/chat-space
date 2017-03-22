class Message < ApplicationRecord
  #association
  belongs_to :users
  belongs_to :groups
end
