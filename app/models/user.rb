class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :moviedataas
  has_many :posts
  has_many :moviedataa_relationships
  has_many :participated_moviedataas, :through => :moviedataa_relationships, :source => :moviedataa
end
