class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :moviedataa

  scope :recent, -> { order("created_at DESC")}
 end
