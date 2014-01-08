class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  validates :title, :content, :state, presence: true

end
