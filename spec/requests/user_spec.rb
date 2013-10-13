require 'spec_helper'

describe 'User' do
  subject { page }
  let!(:user){ create :user }

  describe 'Guest' do
    it 'login'
  end
end