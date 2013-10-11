class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable, omniauth_providers: [:github]
  validates :email, :username, :uid, uniqueness: true

  has_many :posts

  def admin?
    username? && Rails.application.config.admins.include?(username)
  end

  def self.from_omniauth(auth)
    where(auth.slice :uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.nickname
      user.name = auth.info.name
      user.uid = auth.uid
    end
  end

  def gravatar(size = 100)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}?size=#{size}"
  end

  def encrypted_password
    nil
  end

  def password_required?
    nil
  end

end
