class Post < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  validates :title, :content, :user_id, :state, presence: true

end
