class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, foreign_key: :friend_id, class_name: :User

  validates :user_id, :friend_id, presence: true
  validates :user_id, uniqueness: { scope: :friend_id }

  scope :invited, -> { where approved: false }
  scope :accepted, -> { where approved: true }

  def accept!
    update(approved: true)
  end
end
