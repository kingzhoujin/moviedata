class Post < ApplicationRecord
  validate :content, presence: true
  belongs_to :user
  belongs_to :moviedataa

end
