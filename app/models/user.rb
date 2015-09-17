class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable, omniauth_providers: [:github]
  validates :email, :username, :uid, uniqueness: true

  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :destroy
  has_many :friendships, dependent: :destroy

  def admin?
    username? && Rails.application.config.admins.include?(username)
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create(
      email: auth.info.email || '',
      username: auth.info.nickname,
      name: auth.info.name,
      uid: auth.uid
    )
  end

  def full_name
    name || username
  end

  def mine_friend?(user)
    if user
      friendships.accepted.map(&:friend_id).include?(user.id) || user.friendships.accepted.map(&:friend_id).include?(id)
    else
      false
    end
  end

  def invited?(user)
    user ? friendships.invited.map(&:friend_id).include?(user.id) : false
  end

  protected
  # This two methods were overwritten for devise compability

  def encrypted_password
    nil
  end

  def password_required?
    nil
  end
end
