class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, :user_id, :state, presence: true

end
