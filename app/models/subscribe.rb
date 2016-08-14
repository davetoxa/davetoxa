class Subscribe < ActiveRecord::Base
  validates :email, format: { with: Devise.email_regexp }, uniqueness: true
end
