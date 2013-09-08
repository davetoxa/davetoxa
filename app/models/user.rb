class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :email, format: {with: Devise.email_regexp}, uniqueness: true

  has_many :posts
end
