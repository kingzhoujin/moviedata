class Moviedataa < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
end
