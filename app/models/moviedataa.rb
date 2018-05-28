class Moviedataa < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :posts
  has_many :moviedataa_relationships
  has_many :members, :through => :moviedataa_relationships, :source => :user
end
